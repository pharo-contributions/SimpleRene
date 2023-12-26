"
I am a null access strategy and I should be neither read nor written. I am still comparable to other strategies by holding onto a unique-identifier.
"
Class {
	#name : 'SRNullAccessor',
	#superclass : 'SRAccessor',
	#instVars : [
		'uuid'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'testing' }
SRNullAccessor class >> isAbstract [
	^ false
]

{ #category : 'instance creation' }
SRNullAccessor class >> new [
	| random uuid |
	random := Random new.
	uuid := Array new: 16.
	1 to: 16 do: [ :i | uuid at: i put: (random next: 256) -1 ].
	^ self uuid: uuid
]

{ #category : 'instance creation' }
SRNullAccessor class >> uuid: anObject [
	^ self basicNew
		uuid: anObject;
		yourself
]

{ #category : 'comparing' }
SRNullAccessor >> = anObject [
	^ super = anObject
		and: [ self uuid = anObject uuid ]
]

{ #category : 'comparing' }
SRNullAccessor >> hash [
	^ super hash bitXor: self uuid hash
]

{ #category : 'model' }
SRNullAccessor >> read: aModel [ 
	SRReadError signal: 'This message is not appropriate for this object'
]

{ #category : 'printing' }
SRNullAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' uuid: ';
		store: self uuid;
		nextPut: $)
]

{ #category : 'accessing' }
SRNullAccessor >> uuid [
	^ uuid
]

{ #category : 'accessing' }
SRNullAccessor >> uuid: anObject [
	uuid := anObject
]

{ #category : 'model' }
SRNullAccessor >> write: anObject to: aModel [ 
	SRWriteError signal: 'This message is not appropriate for this object'
]
