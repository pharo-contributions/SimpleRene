Class {
	#name : #SRTimeDescriptionTest,
	#superclass : #SRMagnitudeDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRTimeDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRTimeDescriptionTest >> actualClass [
	^ SRTimeDescription
]

{ #category : #private }
SRTimeDescriptionTest >> excludedInstance [
	^ Time hour: 9 minute: 33 second: 12
]

{ #category : #private }
SRTimeDescriptionTest >> includedInstance [
	^ Time hour: 11 minute: 33 second: 12
]

{ #category : #private }
SRTimeDescriptionTest >> maxInstance [
	^ Time hour: 12 minute: 33 second: 12
]

{ #category : #private }
SRTimeDescriptionTest >> minInstance [
	^ Time hour: 10 minute: 33 second: 12
]

{ #category : #tests }
SRTimeDescriptionTest >> testDisplay [

	self testDisplay: [ :e | e hour asString ].
	self testDisplay: #print24.
]
