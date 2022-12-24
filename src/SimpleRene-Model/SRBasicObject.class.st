Class {
	#name : #SRBasicObject,
	#superclass : #Object,
	#category : #'SimpleRene-Model-Core'
}

{ #category : #'error handling' }
SRBasicObject class >> defaultErrorClass [
	^ SRError
]
