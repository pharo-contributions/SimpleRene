"
I am a memento that forwards read- and write-access directly to the model. I can mostly be replaced with the model itself.
"
Class {
	#name : #SRStraightMemento,
	#superclass : #SRMemento,
	#category : #'SimpleRene-Model-Memento'
}

{ #category : #testing }
SRStraightMemento class >> isAbstract [
	^ false
]

{ #category : #private }
SRStraightMemento >> simpleReneReadUsing: aDescription [
	^ (self model simpleReneReadUsing: aDescription)
		ifNil: [ aDescription default ]
]

{ #category : #private }
SRStraightMemento >> simpleReneWrite: anObject using: aDescription [
	self model simpleReneWrite: anObject using: aDescription
]
