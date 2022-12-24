"
I am the most common access strategy defined by a read- and a write-selector. I am mostly used together with standard getters and setters as usually defined by the accessing protocol. If there is only a read-selector specified, the write selector will be deduced automatically by adding a colon to the read-selector.
"
Class {
	#name : #SRSelectorAccessor,
	#superclass : #SRAccessor,
	#instVars : [
		'readSelector',
		'writeSelector'
	],
	#category : #'SimpleRene-Model-Accessor'
}

{ #category : #testing }
SRSelectorAccessor class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
SRSelectorAccessor class >> read: aReadSelector write: aWriteSelector [
	^ self new
		readSelector: aReadSelector;
		writeSelector: aWriteSelector;
		yourself
]

{ #category : #'instance creation' }
SRSelectorAccessor class >> selector: aSelector [
	^ self new
		selector: aSelector;
		yourself
]

{ #category : #comparing }
SRSelectorAccessor >> = anObject [
	^ super = anObject
		and: [ self readSelector = anObject readSelector
		and: [ self writeSelector = anObject writeSelector ] ]
]

{ #category : #testing }
SRSelectorAccessor >> canRead: aModel [
	^ self readSelector notNil and: [ aModel respondsTo: self readSelector ]
]

{ #category : #testing }
SRSelectorAccessor >> canWrite: aModel [
	^ self writeSelector notNil and: [ aModel respondsTo: self writeSelector ]
]

{ #category : #accessing }
SRSelectorAccessor >> defaultLabelFor: aDescription [
	^ self readSelector asString simpleReneNormalizeCamelCase capitalized
]

{ #category : #'accessing-magritte' }
SRSelectorAccessor >> descriptionSelector [
	<simpleReneDescription>
	^ SRSymbolDescription new
			accessor: #selector;
			yourself
]

{ #category : #printing }
SRSelectorAccessor >> fieldDescription [
	^ self readSelector asString
]

{ #category : #testing }
SRSelectorAccessor >> handlesSelector: aSelector [
	^ aSelector = self readSelector or: [ aSelector = self writeSelector ]
]

{ #category : #comparing }
SRSelectorAccessor >> hash [
	^  super hash bitXor: (self readSelector hash bitXor: self writeSelector hash)
]

{ #category : #accessing }
SRSelectorAccessor >> name [
	^ self readSelector
]

{ #category : #model }
SRSelectorAccessor >> read: aModel [
	^ aModel perform: self readSelector
]

{ #category : #accessing }
SRSelectorAccessor >> readSelector [
	^ readSelector
]

{ #category : #accessing }
SRSelectorAccessor >> readSelector: aSelector [
	readSelector := aSelector
]

{ #category : #'accessing-dynamic' }
SRSelectorAccessor >> selector [
	^ self readSelector
]

{ #category : #'accessing-dynamic' }
SRSelectorAccessor >> selector: aSelector [ 
	self readSelector: aSelector asSymbol.
	self writeSelector: (aSelector asString copyWith: $:) asSymbol
]

{ #category : #printing }
SRSelectorAccessor >> storeOn: aStream [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream
		nextPutAll: ' read: ';
		store: self readSelector;
		nextPutAll: ' write: ';
		store: self writeSelector;
		nextPut: $)
]

{ #category : #model }
SRSelectorAccessor >> write: anObject to: aModel [
	^ aModel perform: self writeSelector with: anObject
]

{ #category : #accessing }
SRSelectorAccessor >> writeSelector [
	^ writeSelector
]

{ #category : #accessing }
SRSelectorAccessor >> writeSelector: aSelector [
	writeSelector := aSelector
]
