"
I am a container holding a collection of descriptions and I keep them sorted according to their priority.
"
Class {
	#name : #SRPriorityContainer,
	#superclass : #SRContainer,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRPriorityContainer class >> defaultCollection [
	^ SortedCollection new
]

{ #category : #visiting }
SRPriorityContainer >> acceptMagritte: aVisitor [
	aVisitor visitPriorityContainer: self
]

{ #category : #actions }
SRPriorityContainer >> resort [
	self setChildren: self children copy
]

{ #category : #initialization }
SRPriorityContainer >> setChildren: aCollection [
	super setChildren: aCollection asSortedCollection
]

{ #category : #moving }
SRPriorityContainer >> simpleReneMoveDown: aDescription [
	self shouldNotImplement
]

{ #category : #moving }
SRPriorityContainer >> simpleReneMoveUp: aDescription [
	self shouldNotImplement
]
