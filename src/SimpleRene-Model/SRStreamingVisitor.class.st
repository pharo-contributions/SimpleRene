Class {
	#name : #SRStreamingVisitor,
	#superclass : #SRVisitor,
	#instVars : [
		'stream',
		'object'
	],
	#category : #'SimpleRene-Model-Visitor'
}

{ #category : #streaming }
SRStreamingVisitor >> contents [
	^ self stream contents
]

{ #category : #accessing }
SRStreamingVisitor >> object [
	^ object
]

{ #category : #accessing }
SRStreamingVisitor >> object: anObject [
	object := anObject
]

{ #category : #private }
SRStreamingVisitor >> object: anObject during: aBlock [
	| previous |
	previous := self object. self object: anObject.
	aBlock ensure: [ self object: previous ]
]

{ #category : #accessing }
SRStreamingVisitor >> stream [
	^ stream
]

{ #category : #accessing }
SRStreamingVisitor >> stream: aStream [
	stream := aStream
]
