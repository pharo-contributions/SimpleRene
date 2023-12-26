"
My access strategy is to delegate to the next accessor. I am not that useful all by myself, but subclasses might override certain methods to intercept access.
"
Class {
	#name : 'SRDelegatorAccessor',
	#superclass : 'SRAccessor',
	#instVars : [
		'next'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'testing' }
SRDelegatorAccessor class >> isAbstract [
	^ false
]

{ #category : 'instance creation' }
SRDelegatorAccessor class >> on: anAccessor [
	^ self new next: anAccessor
]

{ #category : 'comparing' }
SRDelegatorAccessor >> = anObject [
	^ super = anObject and: [ self next = anObject next ]
]

{ #category : 'testing' }
SRDelegatorAccessor >> canRead: aModel [
	^ self next canRead: aModel
]

{ #category : 'testing' }
SRDelegatorAccessor >> canWrite: aModel [
	^ self next canWrite: aModel
]

{ #category : 'accessing' }
SRDelegatorAccessor >> defaultLabelFor: aDescription [
	^ self next defaultLabelFor: aDescription
]

{ #category : 'accessing-magritte' }
SRDelegatorAccessor >> descriptionNext [
	<simpleReneDescription>
	^ SRToOneRelationDescription new
			reference: SRStringDescription new;
			accessor: #next;
			classes: SRAccessor allSubclasses;
			priority: 100;
			yourself
]

{ #category : 'comparing' }
SRDelegatorAccessor >> hash [
	^  super hash bitXor: self next hash
]

{ #category : 'accessing' }
SRDelegatorAccessor >> name [
	^ self next name
]

{ #category : 'accessing' }
SRDelegatorAccessor >> next [
	^ next
]

{ #category : 'accessing' }
SRDelegatorAccessor >> next: anAccessor [ 
	next := anAccessor asSimpleReneAccessor
]

{ #category : 'copying' }
SRDelegatorAccessor >> postCopy [
	super postCopy.
	next := next copy
]

{ #category : 'model' }
SRDelegatorAccessor >> read: aModel [
	^ self next read: aModel
]

{ #category : 'printing' }
SRDelegatorAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' on: ';
		store: self next;
		nextPut: $)
]

{ #category : 'model' }
SRDelegatorAccessor >> write: anObject to: aModel [
	self next write: anObject to: aModel
]
