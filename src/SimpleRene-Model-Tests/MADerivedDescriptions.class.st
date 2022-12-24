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
	self assert: (baseModel simpleReneMagritteDescription hasProperty: #addressContainerBase).
	self assert: (derivedModel simpleReneMagritteDescription hasProperty: #addressContainerDerived)
]

{ #category : #tests }
MADerivedDescriptions >> testDescription [
	| baseDescription derivedDescription |
	
	baseDescription := baseModel simpleReneMagritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: baseDescription isRequired not.
	
	derivedDescription := derivedModel simpleReneMagritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: derivedDescription isRequired.	
	
]
