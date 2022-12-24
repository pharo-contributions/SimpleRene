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
	^ #magritte
]

{ #category : #'tests-validation' }
SRSymbolDescriptionTest >> testValidateConditions [
]
