Class {
	#name : #SRAccessorTest,
	#superclass : #SRObjectTest,
	#instVars : [
		'accessor',
		'value'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRAccessorTest class >> isAbstract [
	^ true
]

{ #category : #accessing }
SRAccessorTest >> accessor [
	^ accessor
]

{ #category : #private }
SRAccessorTest >> accessorInstance [
	self subclassResponsibility
]

{ #category : #private }
SRAccessorTest >> actualClass [
	^ SRAccessor
]

{ #category : #accessing }
SRAccessorTest >> instance [
	^ accessor
]

{ #category : #running }
SRAccessorTest >> setUp [
	super setUp.
	accessor := self accessorInstance
]

{ #category : #'tests-identity' }
SRAccessorTest >> testAsAccessor [
	self assert: self instance asSimpleReneAccessor = self instance.
	self assert: self instance asSimpleReneAccessor == self instance
]

{ #category : #'tests-testing' }
SRAccessorTest >> testCanRead [
	self subclassResponsibility
]

{ #category : #'tests-testing' }
SRAccessorTest >> testCanWrite [
	self subclassResponsibility
]

{ #category : #tests }
SRAccessorTest >> testRead [
	self subclassResponsibility
]

{ #category : #'tests-identity' }
SRAccessorTest >> testStore [
	
	self
		assert:
			(OpalCompiler new
				source: self accessor storeString;
				evaluate) = self accessor
]

{ #category : #tests }
SRAccessorTest >> testWrite [
	self subclassResponsibility
]

{ #category : #'accessing-model' }
SRAccessorTest >> value [
	^ value
]

{ #category : #'accessing-model' }
SRAccessorTest >> value: anObject [
	value := anObject
]
