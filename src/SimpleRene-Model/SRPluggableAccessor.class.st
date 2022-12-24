"
I am an access strategy defined by two block-closures. The read-block expects the model as its first argument and is used to retrieve a value. The write-block expects the model as its first and the value as its second argument and is used to write a value to the model.
"
Class {
	#name : #SRPluggableAccessor,
	#superclass : #SRAccessor,
	#instVars : [
		'readBlock',
		'writeBlock'
	],
	#category : #'SimpleRene-Model-Accessor'
}

{ #category : #testing }
SRPluggableAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
SRPluggableAccessor class >> read: aReadBlock write: aWriteBlock [
	^ self new
		readBlock: aReadBlock;
		writeBlock: aWriteBlock;
		yourself
]

{ #category : #comparing }
SRPluggableAccessor >> = anObject [
	^ super = anObject
		and: [ self readBlock = anObject readBlock
		and: [ self writeBlock = anObject writeBlock ] ]
]

{ #category : #testing }
SRPluggableAccessor >> canRead: aModel [
	^ self readBlock notNil
]

{ #category : #testing }
SRPluggableAccessor >> canWrite: aModel [
	^ self writeBlock notNil
]

{ #category : #comparing }
SRPluggableAccessor >> hash [
	^ super hash bitXor: (self readBlock hash bitXor: self writeBlock hash)
]

{ #category : #model }
SRPluggableAccessor >> read: aModel [
	^ self readBlock value: aModel
]

{ #category : #accessing }
SRPluggableAccessor >> readBlock [
	^ readBlock
]

{ #category : #accessing }
SRPluggableAccessor >> readBlock: aBlock [
	readBlock := aBlock
]

{ #category : #printing }
SRPluggableAccessor >> storeBlock: aBlock on: aStream [ 
	aStream nextPutAll: aBlock decompile asString allButFirst allButLast
]

{ #category : #printing }
SRPluggableAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' read: '.
	self storeBlock: self readBlock on: aStream.
	aStream nextPutAll: ' write: '.
	self storeBlock: self writeBlock on: aStream.
	aStream nextPut: $)
]

{ #category : #model }
SRPluggableAccessor >> write: anObject to: aModel [
	self writeBlock value: aModel value: anObject
]

{ #category : #accessing }
SRPluggableAccessor >> writeBlock [
	^ writeBlock
]

{ #category : #accessing }
SRPluggableAccessor >> writeBlock: aBlock [
	writeBlock := aBlock
]
