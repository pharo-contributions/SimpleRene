Class {
	#name : #MAMockAddress,
	#superclass : #Object,
	#instVars : [
		'place',
		'street',
		'plz'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #comparing }
MAMockAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self plz = anObject plz
		and: [ self place = anObject place ] ] ]
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled1 [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled1: aDescription [
	<simpleReneDescription: #descriptionNilled1>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled2 [
	<simpleReneDescription>
	^ MAStringDescription new
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionNilled2: aDescription [
	<simpleReneDescription: #descriptionNilled2>
	^ nil
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlace [
	<simpleReneDescription>
	^ MAStringDescription new
		accessor: #place;
		label: 'Place';
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlace: aDescription [
	<simpleReneDescription: #descriptionPlace>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlaceOther: aDescription [
	<simpleReneDescription: #descriptionPlace>
	^ aDescription beHidden
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionPlz [
	<simpleReneDescription>
	^ MANumberDescription new
		accessor: #plz;
		label: 'PLZ';
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress >> descriptionStreet [
	<simpleReneDescription>
	^ MAStringDescription new
		accessor: #street;
		label: 'Street';
		yourself
]

{ #category : #comparing }
MAMockAddress >> hash [
	^ self street hash
]

{ #category : #'accessing-generated' }
MAMockAddress >> place [
	^ place
]

{ #category : #'accessing-generated' }
MAMockAddress >> place: anObject [
	place := anObject
]

{ #category : #'accessing-generated' }
MAMockAddress >> plz [
	^ plz
]

{ #category : #'accessing-generated' }
MAMockAddress >> plz: anObject [
	plz := anObject
]

{ #category : #'acessing-magritte' }
MAMockAddress >> simpleReneDescriptionContainer [
	<simpleReneContainer>
	^ super simpleReneDescriptionContainer
		propertyAt: #addressContainerBase put: nil;
		yourself
]

{ #category : #'accessing-generated' }
MAMockAddress >> street [
	^ street
]

{ #category : #'accessing-generated' }
MAMockAddress >> street: anObject [
	street := anObject
]
