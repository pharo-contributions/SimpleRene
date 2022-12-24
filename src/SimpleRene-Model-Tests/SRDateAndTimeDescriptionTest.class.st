Class {
	#name : #SRDateAndTimeDescriptionTest,
	#superclass : #SRMagnitudeDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDateAndTimeDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRDateAndTimeDescriptionTest >> actualClass [
	^ SRDateAndTimeDescription
]

{ #category : #private }
SRDateAndTimeDescriptionTest >> excludedInstance [
	^ DateAndTime year: 1980 month: 1 day: 11 hour: 11 minute: 38 second: 12
]

{ #category : #private }
SRDateAndTimeDescriptionTest >> includedInstance [
	^ DateAndTime year: 1980 month: 6 day: 11 hour: 11 minute: 38 second: 12
]

{ #category : #private }
SRDateAndTimeDescriptionTest >> maxInstance [
	^ DateAndTime year: 1980 month: 6 day: 12 hour: 11 minute: 38 second: 12
]

{ #category : #private }
SRDateAndTimeDescriptionTest >> minInstance [
	^ DateAndTime year: 1980 month: 6 day: 10 hour: 11 minute: 38 second: 12
]

{ #category : #tests }
SRDateAndTimeDescriptionTest >> testDisplay [

	self testDisplay: [ :e | e asDate monthName ].
	self testDisplay: #monthName.
]
