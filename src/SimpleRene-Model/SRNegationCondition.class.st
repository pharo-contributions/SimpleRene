Class {
	#name : 'SRNegationCondition',
	#superclass : 'SRCondition',
	#instVars : [
		'condition'
	],
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'instance creation' }
SRNegationCondition class >> with: aCondition [
	^ self new initializeWith: aCondition
]

{ #category : 'initialization' }
SRNegationCondition >> initializeWith: aCondition [
	condition := aCondition
]

{ #category : 'evaluating' }
SRNegationCondition >> value: anObject [
	^ (condition value: anObject) not
]
