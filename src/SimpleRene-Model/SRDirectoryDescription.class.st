Class {
	#name : 'SRDirectoryDescription',
	#superclass : 'SRFileDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'acessing' }
SRDirectoryDescription class >> label [
	^ 'Directory'
]

{ #category : 'visiting' }
SRDirectoryDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitDirectoryDescription: self
]
