Class {
	#name : #SRToOneRelationDescriptionTest,
	#superclass : #SRRelationDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRToOneRelationDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRToOneRelationDescriptionTest >> actualClass [
	^ SRToOneRelationDescription
]

{ #category : #private }
SRToOneRelationDescriptionTest >> includedInstance [
	^ self addressInstance1
]
