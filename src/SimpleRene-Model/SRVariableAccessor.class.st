"
I am an access strategy that directly reads from and writes to instance variables. I strongly violate encapsulation and most of the time I should be replaced by an instance of *MASelectorAccessor*.
"
Class {
	#name : 'SRVariableAccessor',
	#superclass : 'SRAccessor',
	#instVars : [
		'name'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'testing' }
SRVariableAccessor class >> isAbstract [
	^ false
]

{ #category : 'instance creation' }
SRVariableAccessor class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : 'comparing' }
SRVariableAccessor >> = anObject [
	^ super = anObject and: [ self name = anObject name ]
]

{ #category : 'testing' }
SRVariableAccessor >> canRead: aModel [
	^ aModel class allInstVarNames includes: self name asSymbol
]

{ #category : 'testing' }
SRVariableAccessor >> canWrite: aModel [
	^ self canRead: aModel
]

{ #category : 'comparing' }
SRVariableAccessor >> hash [
	^ super hash bitXor: self name hash
]

{ #category : 'accessing' }
SRVariableAccessor >> name [
	^ name
]

{ #category : 'accessing' }
SRVariableAccessor >> name: aString [
	name := aString
]

{ #category : 'model' }
SRVariableAccessor >> read: aModel [
	^ aModel instVarNamed: self name
]

{ #category : 'printing' }
SRVariableAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' name: ';
		store: self name;
		nextPut: $)
]

{ #category : 'model' }
SRVariableAccessor >> write: anObject to: aModel [
	aModel instVarNamed: self name put: anObject
]
