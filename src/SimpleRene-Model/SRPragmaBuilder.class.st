"
I dynamically build container descriptions from instance-side methods decorated pragmas. The pragmas used are:
- `simpleReneContainer` to identify the method generating the container instance.
- `simpleReneDescription` for unary methods returning valid SimpleRene descriptions which are added to the container.
- `simpleReneDescription:` for single parameter methods returning SimpleRene description extensions, where the pragma parameter defines the related SimpleRene description method. The extension method will be called after the related method to refine the description definition.
"
Class {
	#name : 'SRPragmaBuilder',
	#superclass : 'SRBasicObject',
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'constants' }
SRPragmaBuilder class >> containerPragma [ 
	^ #simpleReneContainer
]

{ #category : 'instance creation' }
SRPragmaBuilder class >> for: anObject [
	^ self new for: anObject
]

{ #category : 'constants' }
SRPragmaBuilder class >> simpleReneDescriptionExtensionPragma [ 
	^ #simpleReneDescription:
]

{ #category : 'constants' }
SRPragmaBuilder class >> simpleReneDescriptionPragma [ 
	^ #simpleReneDescription
]

{ #category : 'constants' }
SRPragmaBuilder class >> simpleReneSelectors [
	^ Array with: self containerPragma with: self simpleReneDescriptionExtensionPragma with: self simpleReneDescriptionPragma
]

{ #category : 'private' }
SRPragmaBuilder >> applyExtensions: descriptionExtensions for: each of: anObject to: description [
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: description) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].
]

{ #category : 'private' }
SRPragmaBuilder >> build: anObject cache: cache [
	| container |
	container := cache at: anObject put: (self buildContainer: anObject).
	
	^ container
		addAll: (self buildDescriptions: anObject);
		yourself.

]

{ #category : 'private' }
SRPragmaBuilder >> buildContainer: anObject [
	| containerPragmas containerPragma containerSelector extensionSelectors container |
	
	containerPragmas := Pragma 
		allNamed: self class containerPragma 
		from: anObject class to: Object.
		
	containerPragma := containerPragmas detect: [ :each | each method numArgs = 0 ].
	containerSelector := containerPragma method selector.

	extensionSelectors := (containerPragmas 
		select: [ :each | each method numArgs = 1 ]) 
		collect: [ :each | each method selector ]. 

	SRDynamicDescribedObject use: anObject during: [	
		container := anObject perform: containerSelector.
		extensionSelectors do: [ :each | 
			anObject perform: each with: container ] ].

	^ container
]

{ #category : 'private' }
SRPragmaBuilder >> buildDescriptions: anObject [
	| descriptionExtensions descriptionSelectors extendedDescriptions |
	
	descriptionSelectors := self uniqueDescriptionSelectors: anObject.
	descriptionExtensions := self descriptionExtensions: anObject.
	
	extendedDescriptions := descriptionSelectors 
		collect:  [ :descSel |
			| initialDescription |
			initialDescription := anObject perform: descSel.
			self description: initialDescription extendedBy: descriptionExtensions for: descSel of: anObject ].

	^ extendedDescriptions select: #notNil.
]

{ #category : 'private' }
SRPragmaBuilder >> description: description extendedBy: descriptionExtensions for: descriptionSelector of: anObject [
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: descriptionSelector) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].
]

{ #category : 'private' }
SRPragmaBuilder >> descriptionExtensions: anObject [
	| extensionPragmas |
	
	extensionPragmas := Pragma
		allNamed: self class simpleReneDescriptionExtensionPragma
		from: anObject class to: Object.
	
	^ extensionPragmas inject: Dictionary new into: [ :extensionSelectors :each | 
		| extensionSelectorTarget |
		extensionSelectorTarget := each arguments first.
		(extensionSelectors at: extensionSelectorTarget ifAbsentPut: [ SortedCollection new ]) add: each method selector.
		extensionSelectors ].

]

{ #category : 'private' }
SRPragmaBuilder >> extensionsFrom: aDictionary matching: aSymbol [
	"
	aDictionary - a cache mapping extensionSelectors to the description they extend
	aSymbol - the getter of the extended description e.g. #fuelOutDescription"
	^ aDictionary at: aSymbol ifAbsent: [ #() ].
]

{ #category : 'description building' }
SRPragmaBuilder >> for: anObject [
	| cache |
	cache := SRDynamicDescriptionCache value.
	
	SRDynamicDescriptionCache use: cache during: [
		^ cache at: anObject ifAbsentPut: [ self build: anObject cache: cache ] ]
]

{ #category : 'private' }
SRPragmaBuilder >> uniqueDescriptionSelectors: anObject [
	| descriptionPragmas selectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class simpleReneDescriptionPragma 
		from: anObject class to: Object.
		
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]
