Class {
	#name : #SRReferenceDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRReferenceDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
SRReferenceDescriptionTest >> actualClass [
	^ SRReferenceDescription
]

{ #category : #private }
SRReferenceDescriptionTest >> referenceInstance [
	^ SRStringDescription new
]

{ #category : #running }
SRReferenceDescriptionTest >> setUp [
	super setUp.
	self description reference: self referenceInstance.
	self assert: self description reference accessor notNil
]

{ #category : #'tests-copying' }
SRReferenceDescriptionTest >> testCopyReference [
	self assert: self description copy reference = self description reference.
	self deny: self description copy reference == self description reference
]
