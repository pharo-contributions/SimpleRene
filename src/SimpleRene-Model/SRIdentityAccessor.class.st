"
I am a read-only access strategy and I answer the model itself when being read.
"
Class {
	#name : #SRIdentityAccessor,
	#superclass : #SRAccessor,
	#category : #'SimpleRene-Model-Accessor'
}

{ #category : #testing }
SRIdentityAccessor class >> isAbstract [
	^ false
]

{ #category : #testing }
SRIdentityAccessor >> canRead: aModel [
	^ true
]

{ #category : #model }
SRIdentityAccessor >> read: aModel [
	^ aModel
]

{ #category : #model }
SRIdentityAccessor >> write: anObject to: aModel [ 
	SRWriteError signal: 'Not supposed to write to ' , aModel asString , '.'
]
