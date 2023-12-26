"
When you have a ""to-many"" relationship, I describe the flattened collection of its items - something like {{gtMethod:Collection>>#flatCollect:}} meets {{gtClass:MAChainAccessor}}. Here's a usage example {{gtExample:MACompositeElementBuilder class>>#example}}:
"
Class {
	#name : 'SRCompositeAccessor',
	#superclass : 'SRChainAccessor',
	#instVars : [
		'kind'
	],
	#classInstVars : [
		'elementKind'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'example support' }
SRCompositeAccessor class >> sampleContainer [
	
	| desc |
	desc := SRContainer samplePersonDescription
		blocClass: MACompositeElementBuilder;
		yourself.
	desc children do: [ :e | 
		| acc prefixAccessor |
		prefixAccessor := SRDictionaryAccessor key: #people.
		acc := SRCompositeAccessor via: prefixAccessor using: e ].
	^ desc
]

{ #category : 'instance creation' }
SRCompositeAccessor class >> via: anAccessor using: aDescription [
	| result |
	result := (self on: aDescription accessor asSimpleReneAccessor accessor: anAccessor asSimpleReneAccessor)
		kind: aDescription kind;
		yourself.
	aDescription hasLabel ifTrue: [ aDescription label: (result accessor defaultLabelFor: aDescription) , '::' , aDescription label ].
	aDescription accessor: result.
	^ result
]

{ #category : 'testing' }
SRCompositeAccessor >> canRead: aModel [
	^ (self accessor canRead: aModel) and: [ (self elementsFrom: aModel) allSatisfy: [ :e | self next canRead: e ] ]
]

{ #category : 'testing' }
SRCompositeAccessor >> canWrite: aModel [
	^ (self accessor canRead: aModel) and: [ (self elementsFrom: aModel) allSatisfy: [ :e | self next canWrite: e ] ]
]

{ #category : 'testing' }
SRCompositeAccessor >> elementsFrom: aModel [
	^ self accessor read: aModel
]

{ #category : 'accessing' }
SRCompositeAccessor >> kind [
	^ kind
]

{ #category : 'accessing' }
SRCompositeAccessor >> kind: aClass [
	kind := aClass
]

{ #category : 'model' }
SRCompositeAccessor >> read: aModel [
	| elements values |
	elements := self elementsFrom: aModel.
	values := elements collect: [ :e | self next read: e ].
	^ values asSet size > 1
		ifTrue: [ SRCompositeConflict new kind: self kind; yourself  ]
		ifFalse: [ values first ].
	
]

{ #category : 'model' }
SRCompositeAccessor >> write: anObject to: aModel [
	^ (self elementsFrom: aModel) do: [ :e | 
		(anObject isKindOf: SRCompositeConflict) ifFalse: [ self next write: anObject to: e ] ]
]
