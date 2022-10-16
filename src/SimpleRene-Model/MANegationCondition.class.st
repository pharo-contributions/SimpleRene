Class {
	#name : #MANegationCondition,
	#superclass : #MACondition,
	#instVars : [
		'condition'
	],
	#category : #'SimpleRene-Model-Utility'
}

{ #category : #'instance creation' }
MANegationCondition class >> with: aCondition [
	^ self new initializeWith: aCondition
]

{ #category : #initialization }
MANegationCondition >> initializeWith: aCondition [
	condition := aCondition
]

{ #category : #evaluating }
MANegationCondition >> value: anObject [
	^ (condition value: anObject) not
]
