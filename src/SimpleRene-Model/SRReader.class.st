Class {
	#name : #SRReader,
	#superclass : #SRStreamingVisitor,
	#category : #'SimpleRene-Model-Visitor'
}

{ #category : #'instance creation' }
SRReader class >> read: aStream description: aDescription [
	^ self new read: aStream description: aDescription
]

{ #category : #private }
SRReader >> error: aString [ 
	SRReadError signal: aString
]

{ #category : #visiting }
SRReader >> read: aStream description: aDescription [
	self
		stream: aStream;
		visit: aDescription.
	^ self object
]
