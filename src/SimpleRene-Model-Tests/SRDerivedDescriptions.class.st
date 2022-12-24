Class {
	#name : #SRDerivedDescriptions,
	#superclass : #TestCase,
	#instVars : [
		'baseModel',
		'derivedModel'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #running }
SRDerivedDescriptions >> setUp [
	super setUp.
	
	baseModel := SRMockAddress new.
	derivedModel := SRMockAddress2 new. 
]

{ #category : #tests }
SRDerivedDescriptions >> testContainer [
	self assert: (baseModel simpleReneDescription hasProperty: #addressContainerBase).
	self assert: (derivedModel simpleReneDescription hasProperty: #addressContainerDerived)
]

{ #category : #tests }
SRDerivedDescriptions >> testDescription [
	| baseDescription derivedDescription |
	
	baseDescription := baseModel simpleReneDescription detect: [ :each | each accessor selector = #street ].
	self assert: baseDescription isRequired not.
	
	derivedDescription := derivedModel simpleReneDescription detect: [ :each | each accessor selector = #street ].
	self assert: derivedDescription isRequired.	
	
]
