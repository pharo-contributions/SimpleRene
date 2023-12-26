"
I recreate SimpleRene-described domain objects from strings. Typically I am used to convert string values entered into a SimpleRene form back to the objects they represent. For example, a user may have typed '10/01/2020' into a date field.
"
Class {
	#name : 'SRStringReader',
	#superclass : 'SRReader',
	#category : 'SimpleRene-Model-Visitor',
	#package : 'SimpleRene-Model',
	#tag : 'Visitor'
}

{ #category : 'private' }
SRStringReader >> isFalseUsing: aDescription [
	^ aDescription falseString = self contents
		or: [ aDescription falseStrings anySatisfy: [ :e | e asLowercase = self contents asLowercase ] ]
]

{ #category : 'private' }
SRStringReader >> isTrueUsing: aDescription [
	^ aDescription trueString = self contents
		or: [ aDescription trueStrings anySatisfy: [ :e | e asLowercase = self contents asLowercase ] ]
]

{ #category : 'private' }
SRStringReader >> nextMatchAll: aCollection on: aStream [
	"Tries to match ==aCollection== on ==aStream==. Answer ==true== if ==aCollection== was consumed, otherwise ==false==."

	| position |
	(aCollection isNil or: [ aCollection isEmpty ])
		ifTrue: [ ^ false ].
	position := aStream position.
	aCollection do: [ :char |
		(aStream atEnd or: [ aStream next ~= char ]) ifTrue: [
			aStream position: position.
			^ false ] ].
	^ true
]

{ #category : 'visiting' }
SRStringReader >> read: aStream description: aDescription [
	(aStream atEnd or: [ self nextMatchAll: aDescription undefined on: aStream ])
		ifTrue: [ ^ nil ].
	^ super read: aStream description: aDescription
]

{ #category : 'visiting-description' }
SRStringReader >> visitBlockDescription: aDescription [
	self object: (Smalltalk compiler evaluate: self contents)
]

{ #category : 'visiting-description' }
SRStringReader >> visitBooleanDescription: aDescription [
	(self isTrueUsing: aDescription)
			ifTrue: [ ^ self object: true ].
	(self isFalseUsing: aDescription)
			ifTrue: [ ^ self object: false ].
	SRReadError signal
]

{ #category : 'visiting-description' }
SRStringReader >> visitClassDescription: aDescription [
	self shouldNotImplement
]

{ #category : 'visiting-description' }
SRStringReader >> visitColorDescription: aDescription [
	(self contents notEmpty and: [ self contents allSatisfy: [ :each | '#0123456789ABCDEFabcdef.' includes: each ] ])
		ifFalse: [ SRReadError signal ].
	self object: (aDescription kind fromString: self contents)
]

{ #category : 'visiting-description' }
SRStringReader >> visitContainer: anObject [
	self shouldNotImplement
]

{ #category : 'visiting-description' }
SRStringReader >> visitDurationDescription: aDescription [
	| contents |
	contents := self contents.
	contents isEmpty
		ifTrue: [ SRReadError signal ].
	(contents occurrencesOf: $-) > 1
		ifTrue: [ SRReadError signal ].
	(contents indexOf: $-) > 1
		ifTrue: [ SRReadError signal ].
	(contents occurrencesOf: $.) > 1
		ifTrue: [ SRReadError signal ].
	(contents allSatisfy: [:each | '-0123456789.:' includes: each])
		ifFalse: [ SRReadError signal ].
	super visitDurationDescription: aDescription
]

{ #category : 'visiting-description' }
SRStringReader >> visitElementDescription: aDescription [
	"This implementation can be very dangerous and might lead to a potential security hole (this is tested), since the default implementation of #readFrom: in Object evaluates the expression to find its value. Most subclasses like Number, Date, Time, ... override this implementation, but some others (like Boolean) do not."

	self object: ([ aDescription kind readFrom: self stream ]
		on: Error do: [ :err | SRReadError signal: err messageText ])
]

{ #category : 'visiting-description' }
SRStringReader >> visitFileDescription: aDescription [
	self shouldNotImplement
]

{ #category : 'visiting-description' }
SRStringReader >> visitMultipleOptionDescription: aDescription [
	self object: (Array streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			output nextPut: (aDescription reference
				fromString: (self stream upTo: $,)).
			self stream peek = Character space
				ifTrue: [ self stream next ] ] ])
]

{ #category : 'visiting-description' }
SRStringReader >> visitNumberDescription: aDescription [
	| isContentsValid |
	isContentsValid := NumberParser isSimpleReneValidNumber: self contents.
	isContentsValid ifFalse: [ SRReadError signal ].
	super visitNumberDescription: aDescription
]

{ #category : 'visiting-description' }
SRStringReader >> visitRelationDescription: aDescription [
	self shouldNotImplement
]

{ #category : 'visiting-description' }
SRStringReader >> visitSingleOptionDescription: aDescription [
	aDescription propertyAt: #labels ifPresent: [ :labels |
		labels keysAndValuesDo: [ :key :value |
			(self nextMatchAll: value on: self stream)
				ifTrue: [ ^ self object: key ] ] ].
	self visit: aDescription reference
]

{ #category : 'visiting-description' }
SRStringReader >> visitStringDescription: aDescription [
	self object: self contents
]

{ #category : 'visiting-description' }
SRStringReader >> visitSymbolDescription: aDescription [
	self object: self contents asSymbol
]

{ #category : 'visiting-description' }
SRStringReader >> visitTableDescription: aDescription [
	self shouldNotImplement
]

{ #category : 'visiting-description' }
SRStringReader >> visitTimeDescription: aDescription [
	| string |
	string := self contents.
	(string notEmpty and: [ string allSatisfy: [ :each | '0123456789: apm' includes: each ] ])
		ifFalse: [ SRReadError signal ].
	self object: (aDescription kind readFrom: string readStream)
]

{ #category : 'visiting-description' }
SRStringReader >> visitTokenDescription: aDescription [
	| token |
	self object: (aDescription kind streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			token := WriteStream on: String new.
			[ self stream atEnd or: [ aDescription separators includes: self stream peek ] ]
				whileFalse: [ token nextPut: self stream next ].
			self stream atEnd 
				ifFalse: [ self stream next ].
			token contents isEmpty
				ifFalse: [ output nextPut: (aDescription reference fromString: token contents) ] ] ])
]

{ #category : 'visiting-description' }
SRStringReader >> visitUrlDescription: aDescription [
	self object: self contents asUrl
]
