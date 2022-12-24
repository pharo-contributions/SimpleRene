Class {
	#name : #SRMultipleOptionDescriptionTest,
	#superclass : #SROptionDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'accessing-default' }
SRMultipleOptionDescriptionTest class >> defaultUnique [
	^ false
]

{ #category : #testing }
SRMultipleOptionDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRMultipleOptionDescriptionTest >> actualClass [
	^ SRMultipleOptionDescription
]

{ #category : #private }
SRMultipleOptionDescriptionTest >> includedInstance [
	^ self optionInstances copyFrom: 1 to: 2
]

{ #category : #'tests-properties' }
SRMultipleOptionDescriptionTest >> testOrdered [
	self description beOrdered.
	self assert: self description isOrdered.
	self assert: self description ordered.

	self description beUnordered.
	self deny: self description isOrdered.
	self deny: self description ordered
]

{ #category : #'tests-properties' }
SRMultipleOptionDescriptionTest >> testSorted [
	self description beDistinct.
	self assert: self description isDistinct.
	self assert: self description distinct.

	self description beIndefinite.
	self deny: self description isDistinct.
	self deny: self description distinct
]
