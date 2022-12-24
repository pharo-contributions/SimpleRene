Class {
	#name : #MAAdaptiveModelTest,
	#superclass : #TestCase,
	#instVars : [
		'scaffolder'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #accessing }
MAAdaptiveModelTest >> descriptions [
	^ self scaffolder simpleReneMagritteDescription children
]

{ #category : #accessing }
MAAdaptiveModelTest >> scaffolder [
	^ scaffolder
]

{ #category : #running }
MAAdaptiveModelTest >> setUp [
	scaffolder := MAAdaptiveModel new.
	scaffolder simpleReneMagritteDescription
		add: MAStringDescription new;
		add: MANumberDescription new.
	scaffolder simpleReneWrite: 'foo' using: self descriptions first.
	scaffolder simpleReneWrite: 123 using: self descriptions second
]

{ #category : #tests }
MAAdaptiveModelTest >> testRead [
	self assert: (self scaffolder simpleReneReadUsing: self descriptions first) = 'foo'.
	self assert: (self scaffolder simpleReneReadUsing: self descriptions second) = 123
]

{ #category : #tests }
MAAdaptiveModelTest >> testWrite [
	self scaffolder simpleReneWrite: 'bar' using: self descriptions first.
	self scaffolder simpleReneWrite: 321 using: self descriptions second.

	self assert: (self scaffolder simpleReneReadUsing: self descriptions first) = 'bar'.
	self assert: (self scaffolder simpleReneReadUsing: self descriptions second) = 321
]
