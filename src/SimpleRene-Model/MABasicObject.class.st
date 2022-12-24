Class {
	#name : #MABasicObject,
	#superclass : #Object,
	#category : #'SimpleRene-Model-Core'
}

{ #category : #'error handling' }
MABasicObject class >> defaultErrorClass [
	^ MAError
]
