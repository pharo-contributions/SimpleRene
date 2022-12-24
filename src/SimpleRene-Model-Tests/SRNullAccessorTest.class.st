Class {
	#name : #SRNullAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRNullAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRNullAccessorTest >> accessorInstance [
	^ self actualClass new
]

{ #category : #private }
SRNullAccessorTest >> actualClass [
	^ SRNullAccessor
]

{ #category : #'tests-identity' }
SRNullAccessorTest >> testAsAccessor [
	super testAsAccessor.
	self assert: (nil asSimpleReneAccessor isKindOf: self actualClass)
]

{ #category : #'tests-testing' }
SRNullAccessorTest >> testCanRead [
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRNullAccessorTest >> testCanWrite [
	self deny: (self accessor canWrite: nil)
]

{ #category : #tests }
SRNullAccessorTest >> testRead [
	self
		should: [ self accessor read: self ]
		raise: SRReadError
]

{ #category : #tests }
SRNullAccessorTest >> testWrite [
	self
		should: [ self accessor write: 123 to: self ]
		raise: SRWriteError.
	self assert: self value isNil
]
