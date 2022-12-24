Class {
	#name : #SRDirectoryDescription,
	#superclass : #SRFileDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #acessing }
SRDirectoryDescription class >> label [
	^ 'Directory'
]

{ #category : #visiting }
SRDirectoryDescription >> acceptMagritte: aVisitor [
	aVisitor visitDirectoryDescription: self
]
