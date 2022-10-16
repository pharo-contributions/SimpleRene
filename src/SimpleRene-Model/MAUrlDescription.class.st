Class {
	#name : #MAUrlDescription,
	#superclass : #MAElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #visiting }
MAUrlDescription >> acceptMagritte: aVisitor [
	aVisitor visitUrlDescription: self
]
