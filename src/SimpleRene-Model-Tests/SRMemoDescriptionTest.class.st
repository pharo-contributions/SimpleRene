Class {
	#name : #SRMemoDescriptionTest,
	#superclass : #SRStringDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #private }
SRMemoDescriptionTest >> actualClass [
	^ SRMemoDescription
]

{ #category : #'tests-properties' }
SRMemoDescriptionTest >> testLineCount [
	self description lineCount: 123.
	self assert: self description lineCount = 123
]
