Class {
	#name : #SRSymbolDescriptionTest,
	#superclass : #SRStringDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRSymbolDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRSymbolDescriptionTest >> actualClass [
	^ SRSymbolDescription
]

{ #category : #private }
SRSymbolDescriptionTest >> includedInstance [
	^ #simpleRene
]

{ #category : #'tests-validation' }
SRSymbolDescriptionTest >> testValidateConditions [
]
