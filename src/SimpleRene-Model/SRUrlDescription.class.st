Class {
	#name : #SRUrlDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #visiting }
SRUrlDescription >> acceptMagritte: aVisitor [
	aVisitor visitUrlDescription: self
]
