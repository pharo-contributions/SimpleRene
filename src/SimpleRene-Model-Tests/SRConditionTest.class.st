Class {
	#name : #SRConditionTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #tests }
SRConditionTest >> testConjunctive [
	| condition |
	condition := (SRCondition selector: #isInteger) & (SRCondition selector: #positive).
	self assert: (condition value: 1).
	self deny: (condition value: 1.5).	
	self deny: (condition value: -1).
	self deny: (condition value: -1.5)
]

{ #category : #tests }
SRConditionTest >> testDisjunctive [
	| condition |
	condition := (SRCondition selector: #isInteger) | (SRCondition selector: #positive).
	self assert: (condition value: 1).
	self assert: (condition value: 1.5).	
	self assert: (condition value: -1).
	self deny: (condition value: -1.5)
]

{ #category : #tests }
SRConditionTest >> testNegation [
	| condition |
	condition := (SRCondition selector: #isInteger) not.
	self assert: (condition value: 0.6).
	self deny: (condition value: 1)
]

{ #category : #tests }
SRConditionTest >> testReceiverSelector [
	| condition |
	condition := SRCondition receiver: 1 selector: #=.
	self assert: (condition value: 1).
	self deny: (condition value: 0)
]

{ #category : #tests }
SRConditionTest >> testSelector [
	| condition |
	condition := SRCondition selector: #isInteger.
	self assert: (condition value: -1).
	self assert: (condition value: 1).
	self deny: (condition value: 0.5)
	
]

{ #category : #tests }
SRConditionTest >> testSelectorArgument [
	| condition |
	condition := SRCondition selector: #< argument: 5.
	self assert: (condition value: 1).
	self deny: (condition value: 5)
]
