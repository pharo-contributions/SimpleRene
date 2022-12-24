Class {
	#name : #SRChainAccessorTest,
	#superclass : #SRDelegatorAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRChainAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRChainAccessorTest >> accessorInstance [
	^ self actualClass accessors: #( holder contents value )
]

{ #category : #private }
SRChainAccessorTest >> actualClass [
	^ SRChainAccessor
]

{ #category : #private }
SRChainAccessorTest >> holder [
	^ SRValueHolder on: self
]

{ #category : #tests }
SRChainAccessorTest >> testAccessor [
	self accessor accessor: self.
	self assert: self accessor accessor = self
]

{ #category : #tests }
SRChainAccessorTest >> testAsAccessor [
	super testAsAccessor.
	
	accessor := #(value) asSimpleReneAccessor.
	self assert: (accessor isKindOf: SRSelectorAccessor).
	self assert: (accessor selector = #value).
	
	accessor := #(value contents) asSimpleReneAccessor.
	self assert: (accessor isKindOf: SRChainAccessor).
	self assert: (accessor next isKindOf: SRSelectorAccessor).
	self assert: (accessor next selector = #contents).
	self assert: (accessor accessor isKindOf: SRSelectorAccessor).
	self assert: (accessor accessor selector = #value)
]

{ #category : #'tests-testing' }
SRChainAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).
	self accessor next accessor readSelector: #zork.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRChainAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).
	self accessor next accessor writeSelector: #zork.
	self deny: (self accessor accessor canWrite: self)
]

{ #category : #tests }
SRChainAccessorTest >> testKind [
	self assert: self accessor class equals: SRChainAccessor.
	self assert: self accessor accessor class equals: SRSelectorAccessor.
	self assert: self accessor next class equals: SRChainAccessor.
	self assert: self accessor next accessor class equals: SRSelectorAccessor.
	self assert: self accessor next next class equals: SRSelectorAccessor
]

{ #category : #tests }
SRChainAccessorTest >> testNext [
	| next |
	next := #foo asSimpleReneAccessor.
	self accessor next: next.
	self assert: self accessor next = next
]

{ #category : #tests }
SRChainAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
SRChainAccessorTest >> testSelector [
	self assert: self accessor accessor selector equals: #holder.
	self assert: self accessor next accessor selector equals: #contents.
	self assert: self accessor next next selector equals: #value
]

{ #category : #tests }
SRChainAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
