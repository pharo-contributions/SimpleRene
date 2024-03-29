"
I am a description of dates, possible values are instances of ==Date==. My visual representation could be a date-picker.
"
Class {
	#name : 'SRDateDescription',
	#superclass : 'SRMagnitudeDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRDateDescription class >> defaultKind [
	^ Date
]

{ #category : 'testing' }
SRDateDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRDateDescription class >> label [
	^ 'Date'
]

{ #category : 'visiting' }
SRDateDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitDateDescription: self
]
