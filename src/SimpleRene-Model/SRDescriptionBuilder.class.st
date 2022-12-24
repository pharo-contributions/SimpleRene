"
A MADescriptionBuilder is an abstract class for enriching a Magritte description, e.g. setting the component class based on the description class.


Instance Variables:
	model: the root object
	target:  the object the current description belongs to
	priority: when multiple builders are used, this determines the priority.
	buildedDescription: The result
"
Class {
	#name : #SRDescriptionBuilder,
	#superclass : #SRVisitor,
	#instVars : [
		'model',
		'target',
		'priority',
		'builtDescription'
	],
	#category : #'SimpleRene-Model-Builder'
}

{ #category : #accessing }
SRDescriptionBuilder class >> buildFrom: aDescription target: aTarget [
	^ self new 
		target: aTarget;
		visit: aDescription;
		builtDescription
]

{ #category : #accessing }
SRDescriptionBuilder class >> buildFrom: aDescription target: aTarget model: aModel [
	^ self new 
		target: aTarget;
		model: aModel;
		visit: aDescription;
		builtDescription
]

{ #category : #'accessing defaults' }
SRDescriptionBuilder class >> defaultPriority [
	^0
]

{ #category : #accessing }
SRDescriptionBuilder >> buildFrom: aDescription target: aTarget [ 
	self target: aTarget; visit: aDescription.
	^self builtDescription
]

{ #category : #visiting }
SRDescriptionBuilder >> builtDescription [
	^builtDescription
]

{ #category : #accessing }
SRDescriptionBuilder >> model [
	^model
]

{ #category : #accessing }
SRDescriptionBuilder >> model: aModel [
	model := aModel
]

{ #category : #accessing }
SRDescriptionBuilder >> priority [
	^ priority ifNil: [ ^self class defaultPriority ]
]

{ #category : #accessing }
SRDescriptionBuilder >> priority: anObject [
	priority := anObject
]

{ #category : #visiting }
SRDescriptionBuilder >> setBuiltDescription: aDescription [ 
	builtDescription := aDescription
]

{ #category : #accessing }
SRDescriptionBuilder >> target [
	^ target
]

{ #category : #accessing }
SRDescriptionBuilder >> target: anObject [
	target := anObject
]

{ #category : #visiting }
SRDescriptionBuilder >> visitContainer: aContainer [
	builtDescription := aContainer copy.
	builtDescription removeAll.
	aContainer do: [ :each |
		self visit: each copy ]
]

{ #category : #visiting }
SRDescriptionBuilder >> visitDescription: anObject [
	builtDescription
		ifNil: [ self setBuiltDescription: anObject]
		ifNotNil: [ builtDescription add: anObject ]
]
