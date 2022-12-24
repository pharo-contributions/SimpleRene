Class {
	#name : #SRClassDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRClassDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRClassDescriptionTest >> actualClass [
	^ SRClassDescription
]

{ #category : #private }
SRClassDescriptionTest >> includedInstance [
	^ String
]

{ #category : #private }
SRClassDescriptionTest >> nonIdenticalInstance [
	"Classes cannot be copied on some platforms, so we override the inherited
	behaviour in order to return a different class."
	
	^ Object
]

{ #category : #private }
SRClassDescriptionTest >> shouldSkipStringTests [
	^ true
]
