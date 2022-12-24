"
I am an access strategy to be used on dictionary-like model objects. I use my ==key== to read from and write to indexed collections. I am mainly used for prototyping as it allows one to treat dictionaries like objects with object-based instance variables.
"
Class {
	#name : #SRDictionaryAccessor,
	#superclass : #SRAccessor,
	#instVars : [
		'key'
	],
	#category : #'SimpleRene-Model-Accessor'
}

{ #category : #testing }
SRDictionaryAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
SRDictionaryAccessor class >> key: aSymbol [
	^ self new
		key: aSymbol;
		yourself
]

{ #category : #comparing }
SRDictionaryAccessor >> = anObject [
	^ super = anObject
		and: [ self key = anObject key ]
]

{ #category : #testing }
SRDictionaryAccessor >> canRead: aModel [
	^ true
]

{ #category : #testing }
SRDictionaryAccessor >> canWrite: aModel [
	^ true
]

{ #category : #accessing }
SRDictionaryAccessor >> defaultLabelFor: aDescription [
	^ self key asString normalizeCamelCase capitalized
]

{ #category : #comparing }
SRDictionaryAccessor >> hash [
	^ super hash bitXor: self key hash
]

{ #category : #accessing }
SRDictionaryAccessor >> key [
	^ key
]

{ #category : #accessing }
SRDictionaryAccessor >> key: aKey [
	key := aKey
]

{ #category : #'magritte-accessing' }
SRDictionaryAccessor >> keyDescription [
	<simpleReneDescription>
	^ SRSymbolDescription new
		accessor: #key;
		required: true;
		yourself
]

{ #category : #accessing }
SRDictionaryAccessor >> name [
	^ self key
]

{ #category : #model }
SRDictionaryAccessor >> read: aModel [
	^ aModel at: self key ifAbsent: [ nil ]
]

{ #category : #printing }
SRDictionaryAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' key: ';
		store: self key;
		nextPut: $)
]

{ #category : #model }
SRDictionaryAccessor >> write: anObject to: aModel [
	aModel at: self key put: anObject
]
