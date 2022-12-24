"
I am an abstract description of different options the user can choose from.

My options can be: 
- sorted or unsorted
- extensible or not i.e. can new options be added?

There are several ways to set my options:
- `SROptionDescription>>#options:` is the most straightforward. You can just pass a collection of objects. If you want to dynamically construct the options, pass a `SRDynamicOptions`.
- `SROptionDescription>>#optionsTextual:` does not, as it might suggest at first glance, use strings as options, but instead uses the `reference` to convert the strings into domain objects.
- `SROptionDescription>>#optionsAndLabels:` - takes a collection where the values are the option objects, and the keys are the corresponding labels.

One inconsistency in the above is introduced by the implementation of dynamic options via `#options:`. In that case, the actual options are not returned by `#options`, but by`SROptionDescription>>#allOptions`. So `options` is actually misleading. And the proof is the fact that client code elsewhere in Magritte uses `options` - which will not actually return dynamic options - instead of `allOptions`:

```
#options gtReferences & 'Magritte-' gtPackageMatches
```

Possible fixes might be:
- rename `options[:]` to `optionSource`
- have the `options` getter return what's currently returned by `allOptions`
"
Class {
	#name : #SROptionDescription,
	#superclass : #SRReferenceDescription,
	#instVars : [
		'options'
	],
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SROptionDescription class >> defaultExtensible [
	^ false
]

{ #category : #'accessing-defaults' }
SROptionDescription class >> defaultOptions [
	^ OrderedCollection new
]

{ #category : #'accessing-defaults' }
SROptionDescription class >> defaultSorted [
	^ false
]

{ #category : #visiting }
SROptionDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitOptionDescription: self
]

{ #category : #'accessing-dynamic' }
SROptionDescription >> allOptions [
	^ self options simpleReneAllOptionsFor: self
]

{ #category : #'accessing-dynamic' }
SROptionDescription >> allOptionsWith: anObject [
	^ self prepareOptions: ((self shouldNotInclude: anObject)
		ifFalse: [ self options copyWith: anObject ]
		ifTrue: [ self options copy ])
]

{ #category : #actions }
SROptionDescription >> beExtensible [
	self extensible: true
]

{ #category : #actions }
SROptionDescription >> beLimited [
	self extensible: false
]

{ #category : #actions }
SROptionDescription >> beSorted [
	self sorted: true
]

{ #category : #actions }
SROptionDescription >> beUnsorted [
	self sorted: false
]

{ #category : #'acessing-magritte' }
SROptionDescription >> descriptionDefault [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
SROptionDescription >> descriptionExtensible [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #extensible;
		label: 'Extensible';
		priority: 250;
		default: self class defaultExtensible;
		yourself
]

{ #category : #'acessing-magritte' }
SROptionDescription >> descriptionOptions [
	<simpleReneDescription>
	^ SRMemoDescription new
		accessor: #optionsTextual;
		label: 'Options';
		priority: 410;
		default: self class defaultOptions;
		yourself
]

{ #category : #'acessing-magritte' }
SROptionDescription >> descriptionSorted [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #sorted;
		label: 'Sorted';
		priority: 240;
		default: self class defaultSorted;
		yourself
]

{ #category : #'accessing-properties' }
SROptionDescription >> extensible [
	^ self propertyAt: #extensible ifAbsent: [ self class defaultExtensible ]
]

{ #category : #'accessing-properties' }
SROptionDescription >> extensible: aBoolean [
	self propertyAt: #extensible put: aBoolean
]

{ #category : #testing }
SROptionDescription >> isExtensible [
	^ self extensible
]

{ #category : #testing }
SROptionDescription >> isMultiple [
	^false
]

{ #category : #testing }
SROptionDescription >> isSorted [
	^ self sorted
]

{ #category : #private }
SROptionDescription >> labelForOption: anObject [
	self propertyAt: #labels ifPresent: [ :labels | labels simpleReneOptionFor: anObject ifPresent: [ :value | ^ value ] ].
	^ self displayStringFor: anObject.
]

{ #category : #accessing }
SROptionDescription >> options [
	^ options ifNil: [ options := self class defaultOptions ]
]

{ #category : #accessing }
SROptionDescription >> options: anArray [
	options := anArray
]

{ #category : #accessing }
SROptionDescription >> optionsAndLabels: aCollection [
	"Set the options to be the keys of aCollection and the labels to be the values of aCollection."

	self options: (aCollection collect: [ :assoc | assoc key ]).
	self propertyAt: #labels put: (aCollection
		inject: IdentityDictionary new
		into: [ :result :assoc | result add: assoc; yourself ])
]

{ #category : #'accessing-textual' }
SROptionDescription >> optionsTextual [
	^ (self reference toStringCollection: self options)
		simpleReneAsMultilineString
]

{ #category : #'accessing-textual' }
SROptionDescription >> optionsTextual: aString [
	| lines |
	lines := (aString ifNil: [ String new ]) lines.
	^ self options: (self reference fromStringCollection: lines)
]

{ #category : #copying }
SROptionDescription >> postCopy [
	super postCopy.
	options := options copy
]

{ #category : #private }
SROptionDescription >> prepareOptions: aCollection [
	^ self isSorted
		ifFalse: [ aCollection asArray ]
		ifTrue: [ 
			aCollection asArray
				sort: self sortBlock;
				yourself ]
]

{ #category : #'accessing-dynamic' }
SROptionDescription >> shouldNotInclude: anObject [
	^ self isExtensible not or: [ anObject isNil or: [ self options includes: anObject ] ]
]

{ #category : #private }
SROptionDescription >> sortBlock [
	^ [ :a :b | (self reference toString: a) caseInsensitiveLessOrEqual: (self reference toString: b) ]
]

{ #category : #'accessing-properties' }
SROptionDescription >> sorted [
	^ self propertyAt: #sorted ifAbsent: [ self class defaultSorted ]
]

{ #category : #'accessing-properties' }
SROptionDescription >> sorted: aBoolean [
	self propertyAt: #sorted put: aBoolean
]

{ #category : #'accessing-properties' }
SROptionDescription >> undefined: aString [
	super undefined: aString.
	self reference isNil
		ifFalse: [ self reference undefined: aString ]
]

{ #category : #validating }
SROptionDescription >> validateOptionKind: anObject [
	(self options includes: anObject)
		ifTrue: [ ^ self ].
	self isExtensible
		ifTrue: [ self reference validate: anObject ]
		ifFalse: [ SRKindError description: self signal: self kindErrorMessage ]
]
