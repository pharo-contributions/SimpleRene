Class {
	#name : #SRMementoTest,
	#superclass : #SRObjectTest,
	#instVars : [
		'memento',
		'value',
		'description'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRMementoTest class >> isAbstract [
	^ true
]

{ #category : #private }
SRMementoTest >> actualClass [
	^ SRMemento
]

{ #category : #private }
SRMementoTest >> defaultInstance [
	^ 'Lukas Renggli'
]

{ #category : #private }
SRMementoTest >> descriptionInstance [
	^ SRContainer with: (SRStringDescription new
			default: self defaultInstance;
			accessor: #value;
			yourself)
]

{ #category : #accessing }
SRMementoTest >> descriptionValue [
	^ self simpleReneDescription children first
]

{ #category : #private }
SRMementoTest >> includedInstance [
	^ 'Rene'
]

{ #category : #accessing }
SRMementoTest >> instance [
	^ memento
]

{ #category : #private }
SRMementoTest >> invalidInstance [
	^ 31415
]

{ #category : #accessing }
SRMementoTest >> memento [
	^ memento
]

{ #category : #private }
SRMementoTest >> mementoInstance [
	^ self actualClass model: self modelInstance
]

{ #category : #private }
SRMementoTest >> modelInstance [
	^ self
]

{ #category : #private }
SRMementoTest >> nullInstance [
	^ nil
]

{ #category : #private }
SRMementoTest >> otherInstance [
	^ 'Ursula Freitag'
]

{ #category : #'accessing-memento' }
SRMementoTest >> read [
	^ self memento simpleReneReadUsing: self descriptionValue
]

{ #category : #running }
SRMementoTest >> setUp [
	super setUp.
	description := self descriptionInstance.
	memento := self mementoInstance
]

{ #category : #'acessing-magritte' }
SRMementoTest >> simpleReneDescription [
	^ description
]

{ #category : #'tests-actions' }
SRMementoTest >> testCommit [
	self subclassResponsibility
]

{ #category : #'tests-accessing' }
SRMementoTest >> testDescription [
	self assert: self memento simpleReneDescription = self simpleReneDescription.
	self assert: self memento simpleReneDescription = self descriptionInstance
]

{ #category : #'tests-accessing' }
SRMementoTest >> testModel [
	self assert: self memento model = self modelInstance
]

{ #category : #'tests-basic' }
SRMementoTest >> testRead [
	self subclassResponsibility
]

{ #category : #'tests-actions' }
SRMementoTest >> testReset [
	self subclassResponsibility
]

{ #category : #'tests-actions' }
SRMementoTest >> testValidateIncluded [
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: SRValidationError
]

{ #category : #'tests-actions' }
SRMementoTest >> testValidateInvalid [
	self write: self invalidInstance.
	self should: [ self memento validate ] raise: SRValidationError
]

{ #category : #'tests-actions' }
SRMementoTest >> testValidateRequired [
	self descriptionValue beRequired.

	self write: self nullInstance.
	self should: [ self memento validate ] raise: SRValidationError
]

{ #category : #'tests-basic' }
SRMementoTest >> testWrite [
	self subclassResponsibility
]

{ #category : #'accessing-model' }
SRMementoTest >> value [
	^ value
]

{ #category : #'accessing-model' }
SRMementoTest >> value: anObject [
	value := anObject
]

{ #category : #'accessing-memento' }
SRMementoTest >> write: anObject [
	self memento simpleReneWrite: anObject using: self descriptionValue
]
