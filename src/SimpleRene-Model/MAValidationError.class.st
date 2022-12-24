"
I am a generic validation error. I reference the description that caused the validation error.
"
Class {
	#name : #MAValidationError,
	#superclass : #MAError,
	#category : #'SimpleRene-Model-Exception'
}

{ #category : #'instance creation' }
MAValidationError class >> description: aDescription signal: aString [ 
	^ self new
		setDescription: aDescription;
		signal: aString;
		yourself
]

{ #category : #testing }
MAValidationError >> isResumable [
	^ true
]

{ #category : #printing }
MAValidationError >> printOn: aStream [
	(self tag isSimpleReneDescription and: [ self tag label notNil ])
		ifTrue: [ aStream nextPutAll: self tag label asString; nextPutAll: ': ' ].
	aStream nextPutAll: self messageText asString 
]

{ #category : #initialization }
MAValidationError >> setDescription: aDescription [
	self tag: aDescription
]
