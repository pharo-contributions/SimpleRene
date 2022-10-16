Class {
	#name : #MAMemoDescriptionTest,
	#superclass : #MAStringDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #private }
MAMemoDescriptionTest >> actualClass [
	^ MAMemoDescription
]

{ #category : #'tests-properties' }
MAMemoDescriptionTest >> testLineCount [
	self description lineCount: 123.
	self assert: self description lineCount = 123
]
