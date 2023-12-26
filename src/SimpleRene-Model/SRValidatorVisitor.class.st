Class {
	#name : 'SRValidatorVisitor',
	#superclass : 'SRVisitor',
	#instVars : [
		'object'
	],
	#category : 'SimpleRene-Model-Visitor',
	#package : 'SimpleRene-Model',
	#tag : 'Visitor'
}

{ #category : 'instance creation' }
SRValidatorVisitor class >> on: anObject description: aDescription [
	^ self new on: anObject description: aDescription
]

{ #category : 'accessing' }
SRValidatorVisitor >> object [
	"Answer the currently validated object."

	^ object
]

{ #category : 'initialization' }
SRValidatorVisitor >> on: anObject description: aDescription [
	self use: anObject during: [ self visit: aDescription ]
]

{ #category : 'private' }
SRValidatorVisitor >> use: anObject during: aBlock [
	| previous |
	previous := object. object := anObject.
	^ aBlock ensure: [ object := previous ]
]

{ #category : 'private' }
SRValidatorVisitor >> validate: anObject using: aDescription [
	aDescription validateRequired: anObject.
	anObject = aDescription undefinedValue ifTrue: [ ^ self ].
	aDescription
		tryValidation: [ aDescription validateKind: anObject ]
		ifPass: [ 
			aDescription
				validateSpecific: anObject;
				validateConditions: anObject ]
		
]

{ #category : 'visiting' }
SRValidatorVisitor >> visit: aDescription [
	"Only visit objects that are visible and that can be changed."
	
	(aDescription isVisible and: [ aDescription isReadOnly not ])
		ifTrue: [ super visit: aDescription ].
	
]

{ #category : 'visiting-descriptions' }
SRValidatorVisitor >> visitContainer: aDescription [
	
	super visitContainer: aDescription.
	self object ifNotNil: [ :obj |
		aDescription do: [ :description |
			self
				use: (obj simpleReneReadUsing: description)
				during: [ self visit: description ] ] ]
]

{ #category : 'visiting-descriptions' }
SRValidatorVisitor >> visitDescription: aDescription [
	self validate: self object using: aDescription
]
