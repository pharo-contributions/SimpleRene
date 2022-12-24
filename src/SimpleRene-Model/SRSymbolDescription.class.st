"
I am a description of symbols, possible values are instances of ==Symbol==.
"
Class {
	#name : #SRSymbolDescription,
	#superclass : #SRStringDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRSymbolDescription class >> defaultKind [
	^ Symbol
]

{ #category : #accessing }
SRSymbolDescription class >> label [
	^ 'Symbol'
]

{ #category : #visiting }
SRSymbolDescription >> acceptMagritte: aVisitor [
	aVisitor visitSymbolDescription: self
]
