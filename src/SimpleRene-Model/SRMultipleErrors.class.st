"
I am an error that is raised whenever there are multiple validation rules failing.
"
Class {
	#name : #SRMultipleErrors,
	#superclass : #SRValidationError,
	#instVars : [
		'collection'
	],
	#category : #'SimpleRene-Model-Exception'
}

{ #category : #'instance creation' }
SRMultipleErrors class >> description: aDescription errors: aCollection signal: aString [ 
	^ self new
		setDescription: aDescription;
		setCollection: aCollection;
		signal: aString;
		yourself
]

{ #category : #accessing }
SRMultipleErrors >> collection [
	^ collection
]

{ #category : #printing }
SRMultipleErrors >> printOn: aStream [
	self collection
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream nextPut: Character cr ]
]

{ #category : #initialization }
SRMultipleErrors >> setCollection: aCollection [
	collection := aCollection
]
