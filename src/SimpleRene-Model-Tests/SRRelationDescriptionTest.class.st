Class {
	#name : #SRRelationDescriptionTest,
	#superclass : #SRReferenceDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRRelationDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
SRRelationDescriptionTest >> actualClass [
	^ SRRelationDescription
]

{ #category : #private }
SRRelationDescriptionTest >> addressInstance1 [
	^ SRMockAddress new
		street: 'Tillierstrasse 17';
		plz: 3005; place: 'Bern';
		yourself
]

{ #category : #private }
SRRelationDescriptionTest >> addressInstance2 [
	^ SRMockAddress new
		street: 'In der Au';
		plz: 8765; place: 'Engi';
		yourself
]

{ #category : #running }
SRRelationDescriptionTest >> setUp [
	super setUp.
	self description
		reference: SRMockAddress simpleReneDescription;
		classes: (Array with: SRMockAddress)
]

{ #category : #private }
SRRelationDescriptionTest >> shouldSkipStringTests [
	^ true
]

{ #category : #'tests-copying' }
SRRelationDescriptionTest >> testCopyClasses [
	self assert: self description copy classes = self description classes.
	self deny: self description copy classes == self description classes
]
