Class {
	#name : #MAColorDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
MAColorDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAColorDescriptionTest >> actualClass [
	^ MAColorDescription
]

{ #category : #private }
MAColorDescriptionTest >> includedInstance [
	^ Color blue
]
