Class {
	#name : #SRDynamicVariable,
	#superclass : #Notification,
	#category : #'SimpleRene-Model-Utility'
}

{ #category : #defaults }
SRDynamicVariable class >> defaultValue [
	^ nil
]

{ #category : #private }
SRDynamicVariable class >> use: anObject during: aBlock [
	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."
	
	^ aBlock on: self do: [ :notification | notification resume: anObject ]
]

{ #category : #evaluating }
SRDynamicVariable class >> value [
	"Answer the dynamic value of the receiver."
	
	^ self signal
]

{ #category : #defaults }
SRDynamicVariable >> defaultAction [
	^ self class defaultValue
]
