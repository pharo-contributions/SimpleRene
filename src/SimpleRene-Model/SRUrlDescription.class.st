Class {
	#name : 'SRUrlDescription',
	#superclass : 'SRElementDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'visiting' }
SRUrlDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitUrlDescription: self
]
