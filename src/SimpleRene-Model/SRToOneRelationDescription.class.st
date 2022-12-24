"
I am a description of an one-to-one relationship.
"
Class {
	#name : #SRToOneRelationDescription,
	#superclass : #SRRelationDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #testing }
SRToOneRelationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRToOneRelationDescription class >> label [
	^ '1:1 Relation'
]

{ #category : #visiting }
SRToOneRelationDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitToOneRelationDescription: self
]

{ #category : #'ToMany compatibility' }
SRToOneRelationDescription >> isDefinitive [
	"I'm really not sure what this does, but we need to respond to it to get MAElementRow to work, which was copied over from ToMany"
	^ false
]

{ #category : #'ToMany compatibility' }
SRToOneRelationDescription >> isOrdered [
	"See #isDefinitive comment"
	^ false
]

{ #category : #validating }
SRToOneRelationDescription >> validateKind: anObject [
	super validateKind: anObject.
	(self classes anySatisfy: [ :class | anObject species includesBehavior: class ])
		ifFalse: [ SRKindError description: self signal: self kindErrorMessage ]
]
