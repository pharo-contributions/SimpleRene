"
I am a memento that forwards read- and write-access directly to the model. I can mostly be replaced with the model itself.
"
Class {
	#name : #MAStraightMemento,
	#superclass : #MAMemento,
	#category : #'SimpleRene-Model-Memento'
}

{ #category : #testing }
MAStraightMemento class >> isAbstract [
	^ false
]

{ #category : #private }
MAStraightMemento >> simpleReneReadUsing: aDescription [
	^ (self model simpleReneReadUsing: aDescription)
		ifNil: [ aDescription default ]
]

{ #category : #private }
MAStraightMemento >> simpleReneWrite: anObject using: aDescription [
	self model simpleReneWrite: anObject using: aDescription
]
