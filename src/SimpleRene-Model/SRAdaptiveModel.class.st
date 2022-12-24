"
I am an adaptive model referencing a dynamic description of myself and a dictionary mapping those descriptions to actual values.
"
Class {
	#name : #SRAdaptiveModel,
	#superclass : #SRBasicObject,
	#instVars : [
		'magritteDescription',
		'values'
	],
	#category : #'SimpleRene-Model-Models'
}

{ #category : #'instance creation' }
SRAdaptiveModel class >> description: aDescription [
	^ self new
		magritteDescription: aDescription;
		yourself
]

{ #category : #'accessing-configuration' }
SRAdaptiveModel >> defaultDescription [
	^ SRContainer new
]

{ #category : #'accessing-configuration' }
SRAdaptiveModel >> defaultDictionary [
	^ Dictionary new
]

{ #category : #initialization }
SRAdaptiveModel >> initialize [
	super initialize.
	self magritteDescription: self defaultDescription.
	self values: self defaultDictionary
]

{ #category : #accessing }
SRAdaptiveModel >> magritteDescription: aDescription [
	magritteDescription := aDescription
]

{ #category : #accessing }
SRAdaptiveModel >> simpleReneDescription [
	"Answer the description of the receiver."

	^ magritteDescription
]

{ #category : #model }
SRAdaptiveModel >> simpleReneReadUsing: aDescription [
	"Answer the actual value of ==aDescription== within the receiver, ==nil== if not present."

	^ self values at: aDescription ifAbsent: [ nil ]
]

{ #category : #model }
SRAdaptiveModel >> simpleReneWrite: anObject using: aDescription [
	"Set ==anObject== to be that actual value of the receiver for ==aDescription==."

	self values at: aDescription put: anObject
]

{ #category : #accessing }
SRAdaptiveModel >> values [
	"Answer a dictionary mapping description to actual values."

	^ values
]

{ #category : #accessing }
SRAdaptiveModel >> values: aDictionary [
	values := aDictionary
]
