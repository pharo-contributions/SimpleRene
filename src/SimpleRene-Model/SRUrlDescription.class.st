Class {
	#name : #SRUrlDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #visiting }
SRUrlDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitUrlDescription: self
]
