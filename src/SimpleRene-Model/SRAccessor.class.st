"
I am the abstract superclass to all accessor strategies. Accessors are used to implement different ways of accessing (reading and writing) data from instances using a common protocol: data can be uniformly read and written using ==#readFrom:== respectively ==#write:to:==.
"
Class {
	#name : 'SRAccessor',
	#superclass : 'SRObject',
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'converting' }
SRAccessor >> asSimpleReneAccessor [
	^ self
]

{ #category : 'testing' }
SRAccessor >> canRead: aModel [
	"Test if ==aModel== can be read."

	^ false
]

{ #category : 'testing' }
SRAccessor >> canWrite: aModel [
	"Test if ==aModel== can be written."

	^ false
]

{ #category : 'accessing' }
SRAccessor >> defaultLabelFor: aDescription [
	^ aDescription class defaultLabel
]

{ #category : 'testing' }
SRAccessor >> handlesSelector: aSelector [
	^ false

]

{ #category : 'accessing' }
SRAccessor >> name [
	^ nil
]

{ #category : 'printing' }
SRAccessor >> printOn: aStream [
	self storeOn: aStream
]

{ #category : 'model' }
SRAccessor >> read: aModel [
	"Read from ==aModel== using the access-strategy of the receiver."

	^ nil
]

{ #category : 'printing' }
SRAccessor >> storeOn: aStream [
	self class storeOn: aStream.
	aStream nextPutAll: ' new'
]

{ #category : 'model' }
SRAccessor >> write: anObject to: aModel [
	"Write ==anObject== to ==aModel== using the access-strategy of the receiver."
]
