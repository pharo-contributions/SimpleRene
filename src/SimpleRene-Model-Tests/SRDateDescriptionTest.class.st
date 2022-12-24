Class {
	#name : #SRDateDescriptionTest,
	#superclass : #SRMagnitudeDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDateDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRDateDescriptionTest >> actualClass [
	^ SRDateDescription
]

{ #category : #private }
SRDateDescriptionTest >> excludedInstance [
	^ Date newDay: 1 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
SRDateDescriptionTest >> includedInstance [
	^ Date newDay: 11 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
SRDateDescriptionTest >> maxInstance [
	^ Date newDay: 12 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
SRDateDescriptionTest >> minInstance [
	^ Date newDay: 10 month: (Date nameOfMonth: 6) year: 1980
]
