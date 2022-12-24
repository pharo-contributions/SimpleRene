Class {
	#name : #SRColorDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRColorDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRColorDescriptionTest >> actualClass [
	^ SRColorDescription
]

{ #category : #private }
SRColorDescriptionTest >> includedInstance [
	^ Color blue
]
