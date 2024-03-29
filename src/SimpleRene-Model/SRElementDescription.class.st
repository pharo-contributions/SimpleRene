"
I am an abstract description for all basic description types.
"
Class {
	#name : 'SRElementDescription',
	#superclass : 'SRDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'instance creation' }
SRElementDescription class >> new [
	"override #new so that we can create an object without adding it to the collection returned by: MAElementDescription withAllConcreteClasses,
	that is so we can call  MAElementDescription new magritteDescription  and it works as expected, which is used in MADescriptionEditor>>#buildReport .
	Yes it's a hack, but it works... (better ideas gratefully received)"
	^ self basicNew initialize
]

{ #category : 'visiting' }
SRElementDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitElementDescription: self
]

{ #category : 'converting' }
SRElementDescription >> asContainer [
	^ SRContainer with: self
]

{ #category : 'accessing' }
SRElementDescription >> default [
	^ self propertyAt: #default ifAbsent: [ self class defaultDefault ]
]

{ #category : 'accessing' }
SRElementDescription >> default: anObject [
	self propertyAt: #default put: anObject
]

{ #category : 'testing' }
SRElementDescription >> handleMessage: aMessage for: anObject [
	"We do no error checking; you probably want to send #handlesSelector: first to make sure"
	^ aMessage numArgs = 0
		ifTrue: [ anObject simpleReneReadUsing: self ]
		ifFalse: [ anObject simpleReneWrite: aMessage argument using: self ]
]

{ #category : 'testing' }
SRElementDescription >> handlesSelector: aSelector [
	^ self accessor handlesSelector: aSelector
]

{ #category : 'lazy initialization' }
SRElementDescription >> lazilyInitializeFrom: currentValue for: anObject [
	"- The default value is cached if the description's #shouldCacheDefault property is true. An example when caching is necessary is for to-many relations because the user may modify the collection, which will then be thrown away if not cached

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyPropertyUsing: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"
	
	| defaultValue |		
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := self default.
	self shouldCacheDefault ifTrue: [ anObject simpleReneWrite: defaultValue using: self ].
	^ defaultValue
]

{ #category : 'printing' }
SRElementDescription >> printFor: anObject on: aWriteStream [ 
	(self read: anObject) ifNotNil: [ :value | aWriteStream nextPutAll: (self toString: value) ]
]

{ #category : 'printing' }
SRElementDescription >> storeOn: aStream [
	aStream 
		nextPutAll: self className;
		nextPutAll: ' new'; cr.
	(self simpleReneDescription reject: #isReadOnly) do: [ :desc |
		| value |
		value := desc read: self.
		(value ~= desc default and: [ value isNotNil ]) ifTrue: [ 
			desc accessor store: value inDescriptionOn: aStream ] ].
	aStream nextPutAll: 'yourself'
]
