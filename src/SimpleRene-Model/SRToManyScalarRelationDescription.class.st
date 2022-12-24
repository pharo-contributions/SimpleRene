"
Like MAToManyRelationDescription but for scalar values.
"
Class {
	#name : #SRToManyScalarRelationDescription,
	#superclass : #SRToManyRelationDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #accessing }
SRToManyScalarRelationDescription class >> label [
	^ '1:m scalar Relation'
]

{ #category : #visiting }
SRToManyScalarRelationDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitToManyScalarRelationDescription: self
]
