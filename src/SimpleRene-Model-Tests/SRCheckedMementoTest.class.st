Class {
	#name : #SRCheckedMementoTest,
	#superclass : #SRCachedMementoTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRCheckedMementoTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRCheckedMementoTest >> actualClass [
	^ SRCheckedMemento
]

{ #category : #'tests-actions' }
SRCheckedMementoTest >> testConflictCommit [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanges.
	self deny: self memento hasConflict.

	self value: self otherInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanges.
	self assert: self memento hasConflict.

	self memento commit.
	self assert: self read = self includedInstance.
	self assert: self value = self includedInstance.
	self deny: self memento hasChanges.
	self deny: self memento hasConflict
]

{ #category : #'tests-actions' }
SRCheckedMementoTest >> testConflictReset [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanges.
	self deny: self memento hasConflict.

	self value: self otherInstance.
	self assert: self read = self includedInstance.
	self assert: self memento hasChanges.
	self assert: self memento hasConflict.

	self memento reset.
	self assert: self read = self otherInstance.
	self assert: self value = self otherInstance.
	self deny: self memento hasChanges.
	self deny: self memento hasConflict
]

{ #category : #'tests-accessing' }
SRCheckedMementoTest >> testOriginal [
	self assert: self memento original size = self simpleReneDescription size
]

{ #category : #'tests-actions' }
SRCheckedMementoTest >> testValidateConflictCommit [
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: SRValidationError.

	self value: self otherInstance.
	self should: [ self memento validate ] raise: SRValidationError.

	self memento commit.
	self shouldnt: [ self memento validate ] raise: SRValidationError
]

{ #category : #'tests-actions' }
SRCheckedMementoTest >> testValidateConflictReset [
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: SRValidationError.

	self value: self otherInstance.
	self should: [ self memento validate ] raise: SRValidationError.

	self memento reset.
	self shouldnt: [ self memento validate ] raise: SRValidationError
]
