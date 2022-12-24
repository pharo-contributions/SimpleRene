"
A simple phone model
"
Class {
	#name : #SRPhone,
	#superclass : #Object,
	#instVars : [
		'kind',
		'number'
	],
	#category : #'SimpleRene-ContactManager'
}

{ #category : #comparing }
SRPhone >> = anObject [
	^ self species = anObject species
		and: [ self kind = anObject kind
		and: [ self number = anObject number ] ]
]

{ #category : #descriptions }
SRPhone >> descriptionKind [
	<simpleReneDescription>
	^ MAStringDescription new
		accessor: #kind;
		label: 'Kind';
		priority: 10;
		yourself
]

{ #category : #descriptions }
SRPhone >> descriptionNumber [
	<simpleReneDescription>
	
	^ MAStringDescription new
		accessor: #number;
		label: 'Number';
		priority: 20;
		yourself
]

{ #category : #comparing }
SRPhone >> hash [
	^ self kind hash bitXor: self number hash
]

{ #category : #accessing }
SRPhone >> kind [
	^ kind
]

{ #category : #accessing }
SRPhone >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
SRPhone >> number [
	^ number
]

{ #category : #accessing }
SRPhone >> number: anObject [
	number := anObject
]
