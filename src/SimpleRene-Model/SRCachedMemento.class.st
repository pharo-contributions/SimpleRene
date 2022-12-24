"
I cache values being read and written without touching the model. When committing changes, the modifications will be propagated to the model all at once.
"
Class {
	#name : #SRCachedMemento,
	#superclass : #SRMemento,
	#instVars : [
		'cache'
	],
	#category : #'SimpleRene-Model-Memento'
}

{ #category : #testing }
SRCachedMemento class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRCachedMemento >> cache [
	^ cache
]

{ #category : #actions }
SRCachedMemento >> commit [
	super commit.
	self push: self cache.
	self reset
]

{ #category : #private }
SRCachedMemento >> cookRawPull: aDictionary [

	super cookRawPull: aDictionary.
	aDictionary keysAndValuesDo: [ :key :value |
		| isCollectionOfRelations |
		self flag: 'duplicate logic with cookRawPull:'.
		isCollectionOfRelations := value isCollection and: [ key isKindOf: SRToManyRelationDescription ].
		isCollectionOfRelations ifTrue: [ 
			aDictionary at: key put: value copy ] ].
]

{ #category : #testing }
SRCachedMemento >> hasChanges [
	"Answer ==true==, if the cached data is different to the data in the model."

	^ self isDifferent: self cache to: self pullRaw
]

{ #category : #actions }
SRCachedMemento >> reset [
	super reset.
	self setCache: self pull
]

{ #category : #initialization }
SRCachedMemento >> setCache: aDictionary [
	cache := aDictionary
]

{ #category : #private }
SRCachedMemento >> simpleReneReadUsing: aDescription [
	^ self cache at: aDescription
]

{ #category : #private }
SRCachedMemento >> simpleReneWrite: anObject using: aDescription [
	self cache at: aDescription put: anObject
]
