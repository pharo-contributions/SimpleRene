"
I am a description of a password string, possible values are instances of ==String==. My visual representation could be a password field, where there are stars printed instead of the characters the user enters.
"
Class {
	#name : #SRPasswordDescription,
	#superclass : #SRStringDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #accessing }
SRPasswordDescription class >> label [
	^ 'Password'
]

{ #category : #visiting }
SRPasswordDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitPasswordDescription: self
]

{ #category : #testing }
SRPasswordDescription >> isObfuscated: anObject [
	^ anObject notNil
		and: [ anObject isString
		and: [ anObject isEmpty not
		and: [ anObject allSatisfy: [ :each | each = $* ] ] ] ]
]

{ #category : #testing }
SRPasswordDescription >> isSortable [
	^ false
]

{ #category : #operators }
SRPasswordDescription >> obfuscated: anObject [
	^ String new: (self toString: anObject) size withAll: $*
]
