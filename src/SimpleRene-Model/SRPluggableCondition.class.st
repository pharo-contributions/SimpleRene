Class {
	#name : 'SRPluggableCondition',
	#superclass : 'SRCondition',
	#instVars : [
		'receiver',
		'selector',
		'arguments',
		'index'
	],
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'initialization' }
SRPluggableCondition >> initializeReceiver: anObject selector: aSelector arguments: anArray index: anInteger [
	receiver := anObject.
	selector := aSelector.
	arguments := anArray.
	index := anInteger
]

{ #category : 'evaluating' }
SRPluggableCondition >> value: anObject [
	| actualReceiver actualArguments |
	actualReceiver := index = 0
		ifFalse: [ receiver ]
		ifTrue: [ anObject ].
	actualArguments := index > 0
		ifFalse: [ arguments ]
		ifTrue: [
			arguments copy 
				at: index put: anObject;
				yourself ].
	^ actualReceiver
		perform: selector
		withArguments: actualArguments
]
