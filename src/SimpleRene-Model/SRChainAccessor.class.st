"
I am an access strategy used to chain two access strategies. To read and write a value the ==accessor== is performed on the given model and the result is passed into the ==next== accessor.
"
Class {
	#name : 'SRChainAccessor',
	#superclass : 'SRDelegatorAccessor',
	#instVars : [
		'accessor'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'instance creation' }
SRChainAccessor class >> accessors: aSequenceableCollection [
	aSequenceableCollection isEmpty
		ifTrue: [ self error: 'Unable to create accessor sequence from empty collection.' ].
	aSequenceableCollection size = 1
		ifTrue: [ ^ aSequenceableCollection first asSimpleReneAccessor ].
	^ self 
		on: (self accessors: aSequenceableCollection allButFirst)
		accessor: aSequenceableCollection first asSimpleReneAccessor
]

{ #category : 'instance creation' }
SRChainAccessor class >> on: anAccessor accessor: anotherAccessor [
	^ (self on: anAccessor) accessor: anotherAccessor
]

{ #category : 'comparing' }
SRChainAccessor >> = anObject [
	^ super = anObject and: [ self accessor = anObject accessor ]
]

{ #category : 'accessing' }
SRChainAccessor >> accessor [
	^ accessor
]

{ #category : 'accessing' }
SRChainAccessor >> accessor: anAccessor [
	accessor := anAccessor
]

{ #category : 'testing' }
SRChainAccessor >> canRead: aModel [
	^ (self accessor canRead: aModel) and: [ self next canRead: (self accessor read: aModel) ]
]

{ #category : 'testing' }
SRChainAccessor >> canWrite: aModel [
	^ (self accessor canRead: aModel) and: [ self next canWrite: (self accessor read: aModel) ]
]

{ #category : 'accessing' }
SRChainAccessor >> defaultLabelFor: aDescription [
	^ (self accessor defaultLabelFor: aDescription), '::', (super defaultLabelFor: aDescription)
]

{ #category : 'accessing-magritte' }
SRChainAccessor >> descriptionAccessor [
	<simpleReneDescription>
	^ SRToOneRelationDescription new
			reference: SRStringDescription new;
			accessor: #accessor;
			classes: SRAccessor allSubclasses;
			priority: 200;
			yourself
]

{ #category : 'comparing' }
SRChainAccessor >> hash [
	^ super hash bitXor: self accessor hash
]

{ #category : 'model' }
SRChainAccessor >> name [
	^ super name, '::', self accessor name
]

{ #category : 'copying' }
SRChainAccessor >> postCopy [
	super postCopy.
	accessor := accessor copy
]

{ #category : 'model' }
SRChainAccessor >> read: aModel [
	^ super read: (self accessor read: aModel)
]

{ #category : 'printing' }
SRChainAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' on: ';
		store: self next;
		nextPutAll: ' accessor: ';
		store: self accessor;
		nextPut: $)
]

{ #category : 'model' }
SRChainAccessor >> write: anObject to: aModel [
	super write: anObject to: (self accessor read: aModel)
]
