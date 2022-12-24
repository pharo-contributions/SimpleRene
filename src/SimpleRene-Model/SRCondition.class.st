Class {
	#name : #SRCondition,
	#superclass : #SRObject,
	#category : #'SimpleRene-Model-Utility'
}

{ #category : #testing }
SRCondition class >> isAbstract [
	^ self name = #SRCondition
]

{ #category : #convenience }
SRCondition class >> receiver: anObject selector: aSelector [
	^ self receiver: anObject selector: aSelector arguments: #(nil) index: 1
]

{ #category : #'instance creation' }
SRCondition class >> receiver: anObject selector: aSelector arguments: anArray index: anInteger [
	(aSelector numArgs = anArray size)
		ifFalse: [ self error: 'Invalid number of arguments.' ].
	(anInteger between: 0 and: anArray size)
		ifFalse: [ self error: 'Index out of bounds.' ].
	^ SRPluggableCondition new 
		initializeReceiver: anObject
		selector: aSelector
		arguments: anArray
		index: anInteger
]

{ #category : #convenience }
SRCondition class >> selector: aSelector [
	^ self receiver: nil selector: aSelector arguments: #() index: 0
]

{ #category : #convenience }
SRCondition class >> selector: aSelector argument: anObject [
	^ self receiver: nil selector: aSelector arguments: (Array with: anObject) index: 0
]

{ #category : #operators }
SRCondition >> & aCondition [ 
	^ SRConjunctiveCondition new & self & aCondition
]

{ #category : #operators }
SRCondition >> not [
	^ SRNegationCondition with: self
]

{ #category : #accessing }
SRCondition >> numArgs [
	^ 1
]

{ #category : #evaluating }
SRCondition >> value: anObject [
	self subclassResponsibility
]

{ #category : #operators }
SRCondition >> | aCondition [ 
	^ (self not & aCondition not) not
]
