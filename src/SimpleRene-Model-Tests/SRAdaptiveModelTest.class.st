Class {
	#name : #SRAdaptiveModelTest,
	#superclass : #TestCase,
	#instVars : [
		'scaffolder'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #accessing }
SRAdaptiveModelTest >> descriptions [
	^ self scaffolder simpleReneDescription children
]

{ #category : #accessing }
SRAdaptiveModelTest >> scaffolder [
	^ scaffolder
]

{ #category : #running }
SRAdaptiveModelTest >> setUp [
	scaffolder := SRAdaptiveModel new.
	scaffolder simpleReneDescription
		add: SRStringDescription new;
		add: SRNumberDescription new.
	scaffolder simpleReneWrite: 'foo' using: self descriptions first.
	scaffolder simpleReneWrite: 123 using: self descriptions second
]

{ #category : #tests }
SRAdaptiveModelTest >> testRead [
	self assert: (self scaffolder simpleReneReadUsing: self descriptions first) = 'foo'.
	self assert: (self scaffolder simpleReneReadUsing: self descriptions second) = 123
]

{ #category : #tests }
SRAdaptiveModelTest >> testWrite [
	self scaffolder simpleReneWrite: 'bar' using: self descriptions first.
	self scaffolder simpleReneWrite: 321 using: self descriptions second.

	self assert: (self scaffolder simpleReneReadUsing: self descriptions first) = 'bar'.
	self assert: (self scaffolder simpleReneReadUsing: self descriptions second) = 321
]
