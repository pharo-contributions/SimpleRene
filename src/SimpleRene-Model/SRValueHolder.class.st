Class {
	#name : #SRValueHolder,
	#superclass : #SRBasicObject,
	#instVars : [
		'contents'
	],
	#category : #'SimpleRene-Model-Utility'
}

{ #category : #'instance creation' }
SRValueHolder class >> on: anObject [
	^ self new contents: anObject
]

{ #category : #accessing }
SRValueHolder >> contents [
	^ contents
]

{ #category : #accessing }
SRValueHolder >> contents: anObject [
	contents := anObject
]
