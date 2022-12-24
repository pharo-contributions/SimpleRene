Class {
	#name : #SRWriter,
	#superclass : #SRStreamingVisitor,
	#category : #'SimpleRene-Model-Visitor'
}

{ #category : #'instance creation' }
SRWriter class >> write: anObject [
	^ self new write: anObject
]

{ #category : #'instance creation' }
SRWriter class >> write: anObject description: aDescription [
	^ self new write: anObject description: aDescription
]

{ #category : #'instance creation' }
SRWriter class >> write: anObject description: aDescription to: aStream [
	^ self new write: anObject description: aDescription to: aStream
]

{ #category : #private }
SRWriter >> defaultWriteStream [
	self subclassResponsibility
]

{ #category : #private }
SRWriter >> error: aString [ 
	SRWriteError signal: aString
]

{ #category : #visiting }
SRWriter >> write: anObject [
	^ self write: anObject description: anObject simpleReneDescription
]

{ #category : #visiting }
SRWriter >> write: anObject description: aDescription [
	^ self write: anObject description: aDescription to: self defaultWriteStream
]

{ #category : #visiting }
SRWriter >> write: anObject description: aDescription to: aStream [
	self
		object: anObject;
		stream: aStream;
		visit: aDescription.
	^ self contents
]
