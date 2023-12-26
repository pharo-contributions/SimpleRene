"
I take into account the description's specified ==undefined== string. See ${method:MAStringWriter>>#write:description:to:}$.
"
Class {
	#name : 'SRStringWriter',
	#superclass : 'SRWriter',
	#category : 'SimpleRene-Model-Visitor',
	#package : 'SimpleRene-Model',
	#tag : 'Visitor'
}

{ #category : 'private' }
SRStringWriter >> defaultWriteStream [
	^ WriteStream on: String new
]

{ #category : 'private' }
SRStringWriter >> printObjectDescribedBy: aDescription [

	| string |
	string := aDescription displayStringFor: self object.
	self stream nextPutAll: string.
]

{ #category : 'visiting-description' }
SRStringWriter >> visitBooleanDescription: aDescription [
	self stream nextPutAll: (self object
		ifTrue: [ aDescription trueString ]
		ifFalse: [ aDescription falseString ])
]

{ #category : 'visiting-description' }
SRStringWriter >> visitColorDescription: aDescription [
	stream nextPut: $#.
	stream nextPutAll: ((255 * self object red) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object green) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object blue) asInteger
		printPaddedWith: $0 to: 2 base: 16)
]

{ #category : 'visiting-description' }
SRStringWriter >> visitContainer: aDescription [
	aDescription do: [ :each |
		each isVisible ifTrue: [
			each stringWriter
				write: (self object simpleReneReadUsing: each)
				description: each to: stream.
			^ self ] ]
]

{ #category : 'visiting-description' }
SRStringWriter >> visitElementDescription: aDescription [
	self printObjectDescribedBy: aDescription
]

{ #category : 'visiting-description' }
SRStringWriter >> visitMultipleOptionDescription: aDescription [
	self object isEmpty
		ifTrue: [ self stream nextPutAll: aDescription undefined ]
		ifFalse: [
			self object
				do: [ :each | self stream nextPutAll: (aDescription labelForOption: each) ]
				separatedBy: [ self stream nextPutAll: ', ' ] ]
]

{ #category : 'visiting-description' }
SRStringWriter >> visitSingleOptionDescription: aDescription [
	self stream nextPutAll: (aDescription labelForOption: self object)
]

{ #category : 'visiting-description' }
SRStringWriter >> visitTimeStampDescription: aDescription [
	self stream print: self object asDate; space.
	self stream print: self object asTime
]

{ #category : 'visiting-description' }
SRStringWriter >> visitToManyRelationDescription: aDescription [
	self object
		do: [ :each | self object: each during: [ self visit: each simpleReneDescription ] ]
		separatedBy: [ self stream nextPutAll: ', ' ]
]

{ #category : 'visiting-description' }
SRStringWriter >> visitToOneRelationDescription: aDescription [
	self visit: self object simpleReneDescription
]

{ #category : 'visiting-description' }
SRStringWriter >> visitTokenDescription: aDescription [
	self object
		do: [ :each | self object: each during: [ self visit: aDescription reference ] ]
		separatedBy: [ self stream nextPut: aDescription separators first ]
]

{ #category : 'visiting' }
SRStringWriter >> write: anObject description: aDescription to: aStream [
	^ anObject 
		ifNil: [ 
			aStream
				nextPutAll: aDescription undefined;
				contents ]
		ifNotNil: [ super write: anObject description: aDescription to: aStream ].
]
