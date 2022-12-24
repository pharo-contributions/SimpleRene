Class {
	#name : #SRPriorityContainerTest,
	#superclass : #SRContainerTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRPriorityContainerTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRPriorityContainerTest >> actualClass [
	^ SRPriorityContainer
]

{ #category : #'tests-moving' }
SRPriorityContainerTest >> testMoveDown [
	self should: [ super testMoveDown ] raise: Error
]

{ #category : #'tests-moving' }
SRPriorityContainerTest >> testMoveUp [
	self should: [ super testMoveUp ] raise: Error
]
