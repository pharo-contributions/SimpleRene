Class {
	#name : #SRBlockDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRBlockDescription class >> defaultKind [
	^ BlockClosure
]

{ #category : #'accessing-defaults' }
SRBlockDescription class >> defaultLineCount [
	^ 3
]

{ #category : #testing }
SRBlockDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRBlockDescription class >> label [
	^ 'Block'
]

{ #category : #visiting }
SRBlockDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitBlockDescription: self
]

{ #category : #'accessing-magritte' }
SRBlockDescription >> descriptionLineCount [
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

{ #category : #accessing }
SRBlockDescription >> lineCount [
	^ self propertyAt: #lineCount ifAbsent: [ self class defaultLineCount ]
]

{ #category : #accessing }
SRBlockDescription >> lineCount: anInteger [
	self propertyAt: #lineCount put: anInteger
]
