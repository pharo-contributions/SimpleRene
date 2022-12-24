Class {
	#name : #SRNumberDescriptionTest,
	#superclass : #SRMagnitudeDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRNumberDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRNumberDescriptionTest >> actualClass [
	^ SRNumberDescription
]

{ #category : #private }
SRNumberDescriptionTest >> excludedInstance [
	^ 0.6180
]

{ #category : #private }
SRNumberDescriptionTest >> includedInstance [
	^ 2.7182
]

{ #category : #private }
SRNumberDescriptionTest >> maxInstance [
	^ 3.1415
]

{ #category : #private }
SRNumberDescriptionTest >> minInstance [
	^ 1.6180
]

{ #category : #tests }
SRNumberDescriptionTest >> testBeInteger [
	self description beInteger.
	self assert: (self description isSatisfiedBy: 1).
	self assert: (self description isSatisfiedBy: -1).
	self deny: (self description isSatisfiedBy: 1 / 2).
	self deny: (self description isSatisfiedBy: 1.2)
]

{ #category : #tests }
SRNumberDescriptionTest >> testBeNegative [
	self description beNegative.
	self assert: (self description isSatisfiedBy: -1).
	self assert: (self description isSatisfiedBy: -1.5).
	self deny: (self description isSatisfiedBy: 1).
	self deny: (self description isSatisfiedBy: 1.5)
]

{ #category : #tests }
SRNumberDescriptionTest >> testBePositive [
	self description bePositive.
	self assert: (self description isSatisfiedBy: 1).
	self assert: (self description isSatisfiedBy: 1.5).
	self deny: (self description isSatisfiedBy: -0.1).
	self deny: (self description isSatisfiedBy: -1)
]

{ #category : #private }
SRNumberDescriptionTest >> testFromString [
	"We do some special tests here because #visitNumberDescription: in
	MAStringReader works around problems with Number>>readFrom."
	self shouldSkipStringTests
		ifTrue: [^ self].
	super testFromString.
	self
		should: [self description fromString: 'xyz']
		raise: SRReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '12-234']
		raise: SRReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '1.4.2007']
		raise: SRReadError
		description: 'Non-numeric string should raise an error'.
	self assert: (self description fromString: '') isNil description: 'Empty string should be parsed to nil'.
	self assert: (self description fromString: '-20')
			= -20 description: 'Negative numbers should be accepted'
]

{ #category : #tests }
SRNumberDescriptionTest >> testValidateConditions [
]
