"
I am a description of symbols, possible values are instances of ==Symbol==.
"
Class {
	#name : 'SRSymbolDescription',
	#superclass : 'SRStringDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRSymbolDescription class >> defaultKind [
	^ Symbol
]

{ #category : 'accessing' }
SRSymbolDescription class >> label [
	^ 'Symbol'
]

{ #category : 'visiting' }
SRSymbolDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitSymbolDescription: self
]
