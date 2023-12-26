"
I am a description of times, possible values are instances of ==Time==. My visual representation could be a time-picker.
"
Class {
	#name : 'SRTimeDescription',
	#superclass : 'SRMagnitudeDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRTimeDescription class >> defaultKind [
	^ Time
]

{ #category : 'testing' }
SRTimeDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRTimeDescription class >> label [
	^ 'Time'
]

{ #category : 'visiting' }
SRTimeDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitTimeDescription: self
]
