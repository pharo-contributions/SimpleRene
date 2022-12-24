Class {
	#name : #SRVariableAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRVariableAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRVariableAccessorTest >> accessorInstance [
	^ self actualClass name: 'value'
]

{ #category : #private }
SRVariableAccessorTest >> actualClass [
	^ SRVariableAccessor
]

{ #category : #'tests-testing' }
SRVariableAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor name: 'zork'.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRVariableAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor name: 'zork'.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
SRVariableAccessorTest >> testName [
	self accessor name: 'other'.
	self assert: self accessor name = 'other'
]

{ #category : #tests }
SRVariableAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
SRVariableAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
