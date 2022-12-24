Class {
	#name : #SRDelegatorAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDelegatorAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRDelegatorAccessorTest >> accessorInstance [
	^ self actualClass on: (SRSelectorAccessor selector: #value)
]

{ #category : #private }
SRDelegatorAccessorTest >> actualClass [
	^ SRDelegatorAccessor
]

{ #category : #'tests-testing' }
SRDelegatorAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor next readSelector: #zork.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRDelegatorAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor next writeSelector: #zork:.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
SRDelegatorAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '123'.
	self assert: (self accessor read: self) = '123'
]

{ #category : #tests }
SRDelegatorAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
