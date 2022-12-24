Class {
	#name : #SRBooleanDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRBooleanDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRBooleanDescriptionTest >> actualClass [
	^ SRBooleanDescription
]

{ #category : #private }
SRBooleanDescriptionTest >> includedInstance [
	^ true
]

{ #category : #private }
SRBooleanDescriptionTest >> testCaseInsensitiveStrings: aCollection convertTo: aBoolean [
	| lowercaseStrings uppercaseStrings |
	lowercaseStrings := aCollection.
	uppercaseStrings := lowercaseStrings collect: [ :e | e asUppercase ].
	lowercaseStrings, uppercaseStrings do: [ :e | 
		self assert: (self description fromString: e) = aBoolean ]
]

{ #category : #tests }
SRBooleanDescriptionTest >> testFalseString [
	self description falseString: 'nein'.
	self assert: (self description labelForOption: false) = 'nein'
]

{ #category : #tests }
SRBooleanDescriptionTest >> testFalseStrings [
	self testCaseInsensitiveStrings: #( 'false' 'f' 'no' 'n' '0' 'off' ) convertTo: false
]

{ #category : #tests }
SRBooleanDescriptionTest >> testLabelForOption [
	self assert: (self description labelForOption: true) = 'true'.
	self assert: (self description labelForOption: false) = 'false'.
	self assert: (self description labelForOption: nil) = ''
]

{ #category : #tests }
SRBooleanDescriptionTest >> testOptions [
	self assert: (self description options) = #(false true).
	self assert: (self description allOptionsWith: Object new) = #(false true)
]

{ #category : #tests }
SRBooleanDescriptionTest >> testTrueString [
	self description trueString: 'ja'.
	self assert: (self description labelForOption: true) = 'ja'
]

{ #category : #tests }
SRBooleanDescriptionTest >> testTrueStrings [
	self testCaseInsensitiveStrings: #( 'true' 't' 'yes' 'y' '1' 'on' ) convertTo: true
]

{ #category : #'tests-validation' }
SRBooleanDescriptionTest >> testValidateConditions [
]
