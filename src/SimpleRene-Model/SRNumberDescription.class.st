"
I am a description of numbers, possible values are instances of ==Number== and all its subclasses, including ==Integer== and ==Float==. My visual representation could be a number input-box or even a slider-control.
"
Class {
	#name : #SRNumberDescription,
	#superclass : #SRMagnitudeDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRNumberDescription class >> defaultKind [
	^ Number
]

{ #category : #testing }
SRNumberDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRNumberDescription class >> label [
	^ 'Number'
]

{ #category : #visiting }
SRNumberDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitNumberDescription: self
]

{ #category : #convenience }
SRNumberDescription >> beInteger [
	self addCondition: (SRCondition selector: #isInteger) labelled: 'No integer was entered'
]

{ #category : #convenience }
SRNumberDescription >> beNegative [
	self addCondition: (SRCondition selector: #negative) labelled: 'No negative number was entered'
]

{ #category : #convenience }
SRNumberDescription >> bePositive [
	self addCondition: (SRCondition selector: #positive) labelled: 'No positive number was entered'
]
