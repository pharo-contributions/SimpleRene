Class {
	#name : 'SRSortBlock',
	#superclass : 'SRBasicObject',
	#instVars : [
		'accessor',
		'selector'
	],
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'instance creation' }
SRSortBlock class >> accessor: anAccessor selector: aSelector [
	^ self basicNew initializeAccessor: anAccessor selector: aSelector
]

{ #category : 'instance creation' }
SRSortBlock class >> selector: aSelector [ 
	^ self 
		accessor: SRIdentityAccessor new
		selector: aSelector
]

{ #category : 'actions' }
SRSortBlock >> fixTemps [
]

{ #category : 'initialization' }
SRSortBlock >> initializeAccessor: anAccessor selector: aSelector [
	accessor := anAccessor asSimpleReneAccessor.
	selector := aSelector
]

{ #category : 'evaluating' }
SRSortBlock >> value: aFirstObject value: aSecondObject [
	^ (accessor read: aFirstObject)
		perform: selector
		with: (accessor read: aSecondObject)
]
