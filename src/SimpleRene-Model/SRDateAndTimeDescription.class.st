"
I am a description of date and times, possible values are instances of ==DateAndTime==. My visual representation could be a date- and time-picker.
"
Class {
	#name : 'SRDateAndTimeDescription',
	#superclass : 'SRMagnitudeDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRDateAndTimeDescription class >> defaultKind [
	^ DateAndTime
]

{ #category : 'testing' }
SRDateAndTimeDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRDateAndTimeDescription class >> label [
	^ 'Date and Time'
]

{ #category : 'visiting' }
SRDateAndTimeDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitDateAndTimeDescription: self
]
