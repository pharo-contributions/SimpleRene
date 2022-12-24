Class {
	#name : #SRSelectorAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRSelectorAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRSelectorAccessorTest >> accessorInstance [
	^ self actualClass selector: #value
]

{ #category : #private }
SRSelectorAccessorTest >> actualClass [
	^ SRSelectorAccessor
]

{ #category : #'tests-identity' }
SRSelectorAccessorTest >> testAsAccessor [
	super testAsAccessor.
	self assert: #value asSimpleReneAccessor = self instance.
	self deny: #value asSimpleReneAccessor == self instance
]

{ #category : #'tests-testing' }
SRSelectorAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor readSelector: #zork.
	self deny: (self accessor canRead: self).

	self accessor readSelector: nil.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRSelectorAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor writeSelector: #zork:.
	self deny: (self accessor canWrite: self).

	self accessor writeSelector: nil.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
SRSelectorAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
SRSelectorAccessorTest >> testReadSelector [
	self accessor readSelector: #contents.

	self assert: self accessor selector = #contents.
	self assert: self accessor readSelector = #contents.
	self assert: self accessor writeSelector = #value:
]

{ #category : #tests }
SRSelectorAccessorTest >> testSelector [
	self accessor selector: #contents.

	self assert: self accessor selector = #contents.
	self assert: self accessor readSelector = #contents.
	self assert: self accessor writeSelector = #contents:
]

{ #category : #tests }
SRSelectorAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]

{ #category : #tests }
SRSelectorAccessorTest >> testWriteSelector [
	self accessor writeSelector: #contents:.

	self assert: self accessor selector = #value.
	self assert: self accessor readSelector = #value.
	self assert: self accessor writeSelector = #contents:
]
