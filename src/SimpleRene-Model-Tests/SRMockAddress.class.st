Class {
	#name : #SRMockAddress,
	#superclass : #Object,
	#instVars : [
		'place',
		'street',
		'plz'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #comparing }
SRMockAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self plz = anObject plz
		and: [ self place = anObject place ] ] ]
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionNilled1 [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionNilled1: aDescription [
	<simpleReneDescription: #descriptionNilled1>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionNilled2 [
	<simpleReneDescription>
	^ SRStringDescription new
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionNilled2: aDescription [
	<simpleReneDescription: #descriptionNilled2>
	^ nil
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionPlace [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #place;
		label: 'Place';
		yourself
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionPlace: aDescription [
	<simpleReneDescription: #descriptionPlace>
	^ aDescription beRequired
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionPlaceOther: aDescription [
	<simpleReneDescription: #descriptionPlace>
	^ aDescription beHidden
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionPlz [
	<simpleReneDescription>
	^ SRNumberDescription new
		accessor: #plz;
		label: 'PLZ';
		yourself
]

{ #category : #'acessing-magritte' }
SRMockAddress >> descriptionStreet [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #street;
		label: 'Street';
		yourself
]

{ #category : #comparing }
SRMockAddress >> hash [
	^ self street hash
]

{ #category : #'accessing-generated' }
SRMockAddress >> place [
	^ place
]

{ #category : #'accessing-generated' }
SRMockAddress >> place: anObject [
	place := anObject
]

{ #category : #'accessing-generated' }
SRMockAddress >> plz [
	^ plz
]

{ #category : #'accessing-generated' }
SRMockAddress >> plz: anObject [
	plz := anObject
]

{ #category : #'acessing-magritte' }
SRMockAddress >> simpleReneDescriptionContainer [
	<simpleReneContainer>
	^ super simpleReneDescriptionContainer
		propertyAt: #addressContainerBase put: nil;
		yourself
]

{ #category : #'accessing-generated' }
SRMockAddress >> street [
	^ street
]

{ #category : #'accessing-generated' }
SRMockAddress >> street: anObject [
	street := anObject
]
