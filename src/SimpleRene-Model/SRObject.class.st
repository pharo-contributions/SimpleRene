"
I provide functionality available to all SimpleRene objects. I implement a dictionary of properties, so that extensions can easily store additional data.
"
Class {
	#name : #SRObject,
	#superclass : #SRBasicObject,
	#traits : 'SRTPropertyOwner',
	#classTraits : 'SRTPropertyOwner classTrait',
	#category : #'SimpleRene-Model-Core'
}

{ #category : #testing }
SRObject class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
SRObject class >> new [
	"Create a new instance of the receiving class and checks if it is concrete."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new
]

{ #category : #reflection }
SRObject class >> withAllConcreteClasses [
	^ Array streamContents: [ :stream |
		self withAllConcreteClassesDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : #reflection }
SRObject class >> withAllConcreteClassesDo: aBlock [
	self withAllSubclassesDo: [ :each |
		each isAbstract ifFalse: [
			aBlock value: each ] ]
]

{ #category : #comparing }
SRObject >> = anObject [
	"Answer whether the receiver and the argument represent the same object. This default implementation checks if the species of the compared objects are the same, so that superclasses might call super before performing their own check. Also redefine the message ==#hash== when redefining this message."

	^ self species = anObject species
]

{ #category : #visiting }
SRObject >> acceptSimpleReneVisitor: aVisitor [
]

{ #category : #comparing }
SRObject >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity. Also redefine the message ==#= == when redefining this message."

	^ self species hash
]

{ #category : #copying }
SRObject >> postCopy [
	"This method is called whenever a shallow copy of the receiver is made. Redefine this method in subclasses to copy other fields as necessary. Never forget to call super, else class invariants might be violated."

	super postCopy.
	self postCopyProperties
]
