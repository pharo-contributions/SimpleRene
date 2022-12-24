"
I am a description of Smalltalk classes, possible values can be any of ==Smalltalk allClasses==.
"
Class {
	#name : #SRClassDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRClassDescription class >> defaultDisplayProperty [
	^ #name
]

{ #category : #'accessing-defaults' }
SRClassDescription class >> defaultKind [
	^ Class
]

{ #category : #testing }
SRClassDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRClassDescription class >> label [
	^ 'Class'
]

{ #category : #visiting }
SRClassDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitClassDescription: self
]
