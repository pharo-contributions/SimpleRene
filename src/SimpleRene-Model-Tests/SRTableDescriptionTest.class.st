Class {
	#name : #SRTableDescriptionTest,
	#superclass : #SRReferenceDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRTableDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRTableDescriptionTest >> actualClass [
	^ SRTableDescription
]

{ #category : #private }
SRTableDescriptionTest >> includedInstance [
	^ SRTableModel rows: 3 columns: 3 contents: #( '1' '2' '3' '2' '4' '6' '3' '6' '9' )
]

{ #category : #private }
SRTableDescriptionTest >> shouldSkipStringTests [
	^ true
]
