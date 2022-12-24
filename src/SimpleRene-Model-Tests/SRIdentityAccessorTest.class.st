Class {
	#name : #SRIdentityAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRIdentityAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRIdentityAccessorTest >> accessorInstance [
	^ self actualClass new
]

{ #category : #private }
SRIdentityAccessorTest >> actualClass [
	^ SRIdentityAccessor
]

{ #category : #'tests-testing' }
SRIdentityAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRIdentityAccessorTest >> testCanWrite [
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
SRIdentityAccessorTest >> testRead [
	self assert: (self accessor read: 123) = 123
]

{ #category : #tests }
SRIdentityAccessorTest >> testWrite [
	self
		should: [ self accessor write: 123 to: self ]
		raise: SRWriteError.
	self assert: self value isNil
]
