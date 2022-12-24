Class {
	#name : #SRCachedMementoTest,
	#superclass : #SRMementoTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRCachedMementoTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRCachedMementoTest >> actualClass [
	^ SRCachedMemento
]

{ #category : #'tests-accessing' }
SRCachedMementoTest >> testCache [
	self assert: self memento cache size = self simpleReneDescription size
]

{ #category : #'tests-actions' }
SRCachedMementoTest >> testCommit [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self value = self nullInstance.
	self assert: self memento hasChanges.

	self memento commit.
	self assert: self read = self includedInstance.
	self assert: self value = self includedInstance.
	self deny: self memento hasChanges
]

{ #category : #'tests-basic' }
SRCachedMementoTest >> testRead [
	self assert: self read = self defaultInstance.

	self value: self includedInstance.
	self assert: self read = self defaultInstance
]

{ #category : #'tests-actions' }
SRCachedMementoTest >> testReset [
	self value: self defaultInstance.
	self write: self includedInstance.
	self assert: self memento hasChanges.

	self memento reset.
	self assert: self read = self defaultInstance.
	self assert: self value = self defaultInstance.
	self deny: self memento hasChanges
]

{ #category : #'tests-basic' }
SRCachedMementoTest >> testWrite [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self value = self nullInstance.

	self write: self defaultInstance.
	self assert: self read = self defaultInstance.
	self assert: self value = self nullInstance
]
