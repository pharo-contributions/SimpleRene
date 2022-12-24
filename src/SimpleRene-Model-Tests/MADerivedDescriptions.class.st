Class {
	#name : #MADerivedDescriptions,
	#superclass : #TestCase,
	#instVars : [
		'baseModel',
		'derivedModel'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #running }
MADerivedDescriptions >> setUp [
	super setUp.
	
	baseModel := MAMockAddress new.
	derivedModel := MAMockAddress2 new. 
]

{ #category : #tests }
MADerivedDescriptions >> testContainer [
	self assert: (baseModel simpleReneDescription hasProperty: #addressContainerBase).
	self assert: (derivedModel simpleReneDescription hasProperty: #addressContainerDerived)
]

{ #category : #tests }
MADerivedDescriptions >> testDescription [
	| baseDescription derivedDescription |
	
	baseDescription := baseModel simpleReneDescription detect: [ :each | each accessor selector = #street ].
	self assert: baseDescription isRequired not.
	
	derivedDescription := derivedModel simpleReneDescription detect: [ :each | each accessor selector = #street ].
	self assert: derivedDescription isRequired.	
	
]
