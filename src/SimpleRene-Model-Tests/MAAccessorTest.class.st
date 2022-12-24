Class {
	#name : #MAAccessorTest,
	#superclass : #MAObjectTest,
	#instVars : [
		'accessor',
		'value'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
MAAccessorTest class >> isAbstract [
	^ true
]

{ #category : #accessing }
MAAccessorTest >> accessor [
	^ accessor
]

{ #category : #private }
MAAccessorTest >> accessorInstance [
	self subclassResponsibility
]

{ #category : #private }
MAAccessorTest >> actualClass [
	^ MAAccessor
]

{ #category : #accessing }
MAAccessorTest >> instance [
	^ accessor
]

{ #category : #running }
MAAccessorTest >> setUp [
	super setUp.
	accessor := self accessorInstance
]

{ #category : #'tests-identity' }
MAAccessorTest >> testAsAccessor [
	self assert: self instance asSimpleReneAccessor = self instance.
	self assert: self instance asSimpleReneAccessor == self instance
]

{ #category : #'tests-testing' }
MAAccessorTest >> testCanRead [
	self subclassResponsibility
]

{ #category : #'tests-testing' }
MAAccessorTest >> testCanWrite [
	self subclassResponsibility
]

{ #category : #tests }
MAAccessorTest >> testRead [
	self subclassResponsibility
]

{ #category : #'tests-identity' }
MAAccessorTest >> testStore [
	
	self
		assert:
			(OpalCompiler new
				source: self accessor storeString;
				evaluate) = self accessor
]

{ #category : #tests }
MAAccessorTest >> testWrite [
	self subclassResponsibility
]

{ #category : #'accessing-model' }
MAAccessorTest >> value [
	^ value
]

{ #category : #'accessing-model' }
MAAccessorTest >> value: anObject [
	value := anObject
]
