"
!Responsibilities
I am an abstract memento. I am a stand-in for an object, typically for reading and writing. Subclasses ''may'' save the pre-operation state (e.g. ${class:MACachedMemento}$), or ''may not'' (e.g. ${class:MAStraightMemento}$. Similarly, they ''may'' verify described conditions are met (e.g. ${class:MACheckedMemento}$). NB. My behavior is different than a GoF ==Memento==, which is immutable, saving an object's state before it's modified by an operation.
!Collaborators
- the ==model== I represent/modify
- the ==description== currently used to describe this ==model==
"
Class {
	#name : 'SRMemento',
	#superclass : 'SRObject',
	#instVars : [
		'model',
		'description'
	],
	#category : 'SimpleRene-Model-Memento',
	#package : 'SimpleRene-Model',
	#tag : 'Memento'
}

{ #category : 'instance creation' }
SRMemento class >> model: aModel [
	^ self model: aModel description: aModel simpleReneDescription
]

{ #category : 'instance creation' }
SRMemento class >> model: aModel description: aDescription [
	^ self new
		setModel: aModel;
		setDescription: aDescription;
		reset; yourself
]

{ #category : 'actions' }
SRMemento >> commit [
	"Commit the receiver into the model."
]

{ #category : 'private' }
SRMemento >> cookRawPull: aDictionary [

	aDictionary keysAndValuesDo: [ :key :value |
		value isNil
			ifTrue: [ aDictionary at: key put: key default yourself ] ]
]

{ #category : 'reflective operations' }
SRMemento >> doesNotUnderstand: aMessage [
  ^ self simpleReneDescription children 
  	detect: [ :desc | desc handlesSelector: aMessage selector ] 
  	ifFound: [ :desc | desc handleMessage: aMessage for: self ]
  	ifNone: [ super doesNotUnderstand: aMessage ]
]

{ #category : 'private' }
SRMemento >> isDifferent: firstDictionary to: secondDictionary [
	| firstValue secondValue |
	self simpleReneDescription do: [ :each |
		(each isVisible and: [ each isReadOnly not ]) ifTrue: [
			firstValue := firstDictionary at: each ifAbsent: [ nil ].
			secondValue := secondDictionary at: each ifAbsent: [ nil ].
			firstValue = secondValue ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : 'accessing' }
SRMemento >> model [
	^ model
]

{ #category : 'printing' }
SRMemento >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' model: '; print: self model
]

{ #category : 'private' }
SRMemento >> pull [
	"Utility method to pull the model into a dictionary mapping descriptions to values. nil values are replaced with the default ones of the model."

	| result |
	result := self pullRaw.
	self cookRawPull: result.
	^ result
]

{ #category : 'private' }
SRMemento >> pullRaw [
	
	^ self pullRawTransforming: [ :e | e ]
]

{ #category : 'private' }
SRMemento >> pullRawTransforming: aBlock [
	| result |
	result := Dictionary new.
	self simpleReneDescription do: [ :each |
		| value transformedValue |
		value := self model simpleReneReadUsing: each.
		transformedValue := aBlock value: value.
		result at: each put: transformedValue ].
	^ result
]

{ #category : 'private' }
SRMemento >> push: aDictionary [
	"Utility method to push a dictionary mapping descriptions to values into the model."

	aDictionary keysAndValuesDo: [ :key :value |
		(self shouldPush: value using: key) 
			ifTrue: [ self model simpleReneWrite: value using: key ] ]
]

{ #category : 'actions' }
SRMemento >> reset [
	"Reset the memento from the model."
]

{ #category : 'initialization' }
SRMemento >> setDescription: aDescription [
	description := aDescription
]

{ #category : 'initialization' }
SRMemento >> setModel: aModel [
	model := aModel
]

{ #category : 'private-testing' }
SRMemento >> shouldPush: anObject using: aDescription [
	^ aDescription isVisible and: [ aDescription isReadOnly not ]
]

{ #category : 'accessing' }
SRMemento >> simpleReneDescription [
	"`#modelDescription` would probably be clearer, but we want to be polymorphic (see implementors)"
	^ description
]

{ #category : 'private' }
SRMemento >> simpleReneReadUsing: aDescription [
	^ self subclassResponsibility
]

{ #category : 'actions' }
SRMemento >> validate [
	"Check if the data in the receiver would be valid if committed. In case of problems an exception is raised."

	self simpleReneDescription validate: self
]
