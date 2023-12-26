Class {
	#name : 'SRConjunctiveCondition',
	#superclass : 'SRCondition',
	#instVars : [
		'conditions'
	],
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'operators' }
SRConjunctiveCondition >> & aCondition [
	conditions := conditions copyWith: aCondition
]

{ #category : 'initialization' }
SRConjunctiveCondition >> initialize [
	conditions := #()
]

{ #category : 'evaluating' }
SRConjunctiveCondition >> value: anObject [
	^ conditions allSatisfy: [ :each | each value: anObject ]
]
