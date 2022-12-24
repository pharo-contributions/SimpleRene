Class {
	#name : #SRDurationDescriptionTest,
	#superclass : #SRMagnitudeDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDurationDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRDurationDescriptionTest >> actualClass [
	^ SRDurationDescription
]

{ #category : #private }
SRDurationDescriptionTest >> excludedInstance [
	^ Duration days: 0 hours: 0 minutes: 0 seconds: 2
]

{ #category : #private }
SRDurationDescriptionTest >> includedInstance [
	^ Duration days: 1 hours: 2 minutes: 3 seconds: 4
]

{ #category : #private }
SRDurationDescriptionTest >> maxInstance [
	^ Duration days: 2 hours: 2 minutes: 3 seconds: 4
]

{ #category : #private }
SRDurationDescriptionTest >> minInstance [
	^ Duration days: 0 hours: 2 minutes: 3 seconds: 4
]
