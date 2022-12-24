"
I am an adaptive model referencing a dynamic description of myself and a dictionary mapping those descriptions to actual values.
"
Class {
	#name : #MAAdaptiveModel,
	#superclass : #MABasicObject,
	#instVars : [
		'magritteDescription',
		'values'
	],
	#category : #'SimpleRene-Model-Models'
}

{ #category : #'instance creation' }
MAAdaptiveModel class >> description: aDescription [
	^ self new
		magritteDescription: aDescription;
		yourself
]

{ #category : #'accessing-configuration' }
MAAdaptiveModel >> defaultDescription [
	^ MAContainer new
]

{ #category : #'accessing-configuration' }
MAAdaptiveModel >> defaultDictionary [
	^ Dictionary new
]

{ #category : #initialization }
MAAdaptiveModel >> initialize [
	super initialize.
	self magritteDescription: self defaultDescription.
	self values: self defaultDictionary
]

{ #category : #accessing }
MAAdaptiveModel >> magritteDescription: aDescription [
	magritteDescription := aDescription
]

{ #category : #accessing }
MAAdaptiveModel >> simpleReneDescription [
	"Answer the description of the receiver."

	^ magritteDescription
]

{ #category : #model }
MAAdaptiveModel >> simpleReneReadUsing: aDescription [
	"Answer the actual value of ==aDescription== within the receiver, ==nil== if not present."

	^ self values at: aDescription ifAbsent: [ nil ]
]

{ #category : #model }
MAAdaptiveModel >> simpleReneWrite: anObject using: aDescription [
	"Set ==anObject== to be that actual value of the receiver for ==aDescription==."

	self values at: aDescription put: anObject
]

{ #category : #accessing }
MAAdaptiveModel >> values [
	"Answer a dictionary mapping description to actual values."

	^ values
]

{ #category : #accessing }
MAAdaptiveModel >> values: aDictionary [
	values := aDictionary
]
