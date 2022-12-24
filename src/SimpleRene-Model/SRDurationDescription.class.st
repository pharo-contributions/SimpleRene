"
I am a description of durations, possible values are instances of ==Duration==.
"
Class {
	#name : #SRDurationDescription,
	#superclass : #SRMagnitudeDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRDurationDescription class >> defaultKind [
	^ Duration
]

{ #category : #testing }
SRDurationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRDurationDescription class >> label [
	^ 'Duration'
]

{ #category : #visiting }
SRDurationDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitDurationDescription: self
]
