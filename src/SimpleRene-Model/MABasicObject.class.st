Class {
	#name : #MABasicObject,
	#superclass : #GRObject,
	#category : #'SimpleRene-Model-Core'
}

{ #category : #'error handling' }
MABasicObject class >> defaultErrorClass [
	^ MAError
]
