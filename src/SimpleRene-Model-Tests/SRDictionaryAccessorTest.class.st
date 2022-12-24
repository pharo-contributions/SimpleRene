Class {
	#name : #SRDictionaryAccessorTest,
	#superclass : #SRAccessorTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDictionaryAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRDictionaryAccessorTest >> accessorInstance [
	^ self actualClass key: #value
]

{ #category : #private }
SRDictionaryAccessorTest >> actualClass [
	^ SRDictionaryAccessor
]

{ #category : #accessing }
SRDictionaryAccessorTest >> at: aKey ifAbsent: aBlock [
	^ aKey = #value 
		ifTrue: [ value ]
		ifFalse: [ aBlock value ]
]

{ #category : #accessing }
SRDictionaryAccessorTest >> at: aKey put: aValue [
	self assert: aKey = #value.
	^ value := aValue
]

{ #category : #'tests-testing' }
SRDictionaryAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).
	self accessor key: #zork.
	self assert: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
SRDictionaryAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self)
]

{ #category : #tests }
SRDictionaryAccessorTest >> testKey [
	self accessor key: #other.
	self assert: self accessor key = #other
]

{ #category : #tests }
SRDictionaryAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
SRDictionaryAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
