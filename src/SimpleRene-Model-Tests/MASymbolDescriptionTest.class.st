Class {
	#name : #MASymbolDescriptionTest,
	#superclass : #MAStringDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
MASymbolDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MASymbolDescriptionTest >> actualClass [
	^ MASymbolDescription
]

{ #category : #private }
MASymbolDescriptionTest >> includedInstance [
	^ #magritte
]

{ #category : #'tests-validation' }
MASymbolDescriptionTest >> testValidateConditions [
]
