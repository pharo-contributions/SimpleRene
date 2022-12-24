Class {
	#name : #SRTokenDescriptionTest,
	#superclass : #SRReferenceDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRTokenDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRTokenDescriptionTest >> actualClass [
	^ SRTokenDescription
]

{ #category : #private }
SRTokenDescriptionTest >> includedInstance [
	^ #( 'foo' 'bar' )
]

{ #category : #'tests-strings' }
SRTokenDescriptionTest >> testFromStringInvalid [
	"There is no invalid string input."
]
