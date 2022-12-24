"
I am a description of strings, possible values are instances of ==String==. My visual representation could be a single line text-field. Use ==*MAMemoDescription*== for multi-line strings.
"
Class {
	#name : #SRStringDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRStringDescription class >> defaultKind [
	^ String
]

{ #category : #testing }
SRStringDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRStringDescription class >> label [
	^ 'String'
]

{ #category : #visiting }
SRStringDescription >> acceptMagritte: aVisitor [
	aVisitor visitStringDescription: self
]

{ #category : #testing }
SRStringDescription >> isSortable [
	^ true
]
