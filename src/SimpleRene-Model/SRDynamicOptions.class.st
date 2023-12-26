Class {
	#name : 'SRDynamicOptions',
	#superclass : 'Object',
	#instVars : [
		'block',
		'completionToObjectBlock',
		'includesBlock'
	],
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'as yet unclassified' }
SRDynamicOptions class >> block: aBlock [
	^ self new
			block: aBlock;
			yourself.
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> block [
	^ block
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> block: aBlock [
	block := aBlock
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> detect: anObject [
	"Convert from a possibly-optimized object for entry-completion, to the object that should be saved"
	^ self reader value: anObject
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> includes: anObject [
	^ includesBlock value: anObject
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> includesBlock [
	^ includesBlock
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> includesBlock: aBlock [
	includesBlock := aBlock
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> reader [
	^ completionToObjectBlock ifNil: [ [ :obj | obj ] ]
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> reader: aBlock [
	completionToObjectBlock := aBlock
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> simpleReneAllOptionsFor: anOptionDescription [ 
	^ self
]

{ #category : 'as yet unclassified' }
SRDynamicOptions >> simpleReneSelectMatching: aString [ 
	^ self block value: aString
]
