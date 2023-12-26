"
I am a description of multiline strings, possible values are instances of ==String==. My visual representation could be a text-area field.
"
Class {
	#name : 'SRMemoDescription',
	#superclass : 'SRStringDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRMemoDescription class >> defaultLineCount [
	^ 3
]

{ #category : 'accessing' }
SRMemoDescription class >> label [
	^ 'Memo'
]

{ #category : 'visiting' }
SRMemoDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitMemoDescription: self
]

{ #category : 'acessing-magritte' }
SRMemoDescription >> descriptionLineCount [
	<simpleReneDescription>
	^ SRNumberDescription new
		accessor: #lineCount;
		label: 'Number of Lines';
		priority: 400;
		default: self class defaultLineCount;
		beInteger;
		min: 1;
		yourself
]

{ #category : 'accessing-properties' }
SRMemoDescription >> lineCount [
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]
]

{ #category : 'accessing-properties' }
SRMemoDescription >> lineCount: anInteger [
	self propertyAt: #lineCount put: anInteger
]
