Class {
	#name : #SRStraightMementoTest,
	#superclass : #SRMementoTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRStraightMementoTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRStraightMementoTest >> actualClass [
	^ SRStraightMemento
]

{ #category : #'tests-actions' }
SRStraightMementoTest >> testCommit [
	self write: self includedInstance.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance.

	self memento commit.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance
]

{ #category : #'tests-basic' }
SRStraightMementoTest >> testRead [
	self assert: self read = self defaultInstance.

	self value: self includedInstance.
	self assert: self read = self includedInstance.

	self value: self defaultInstance.
	self assert: self read = self defaultInstance
]

{ #category : #'tests-actions' }
SRStraightMementoTest >> testReset [
	self write: self includedInstance.
	self memento reset.
	self assert: self read = self includedInstance
]

{ #category : #'tests-actions' }
SRStraightMementoTest >> testValidateRequired [
]

{ #category : #'tests-basic' }
SRStraightMementoTest >> testWrite [
	self write: self includedInstance.
	self assert: self value = self includedInstance.

	self write: self defaultInstance.
	self assert: self value = self defaultInstance.

	self write: self nullInstance.
	self assert: self value = self nullInstance
]
