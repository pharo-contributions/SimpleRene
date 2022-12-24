"
I am a generic validation error. I reference the description that caused the validation error.
"
Class {
	#name : #SRValidationError,
	#superclass : #SRError,
	#category : #'SimpleRene-Model-Exception'
}

{ #category : #'instance creation' }
SRValidationError class >> description: aDescription signal: aString [ 
	^ self new
		setDescription: aDescription;
		signal: aString;
		yourself
]

{ #category : #testing }
SRValidationError >> isResumable [
	^ true
]

{ #category : #printing }
SRValidationError >> printOn: aStream [
	(self tag isSimpleReneDescription and: [ self tag label notNil ])
		ifTrue: [ aStream nextPutAll: self tag label asString; nextPutAll: ': ' ].
	aStream nextPutAll: self messageText asString 
]

{ #category : #initialization }
SRValidationError >> setDescription: aDescription [
	self tag: aDescription
]
