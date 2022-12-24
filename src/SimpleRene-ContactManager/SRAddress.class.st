"
A simple address for a city located in Switzerland.
"
Class {
	#name : #SRAddress,
	#superclass : #Object,
	#instVars : [
		'street',
		'plz',
		'place',
		'canton',
		'nationality'
	],
	#category : #'SimpleRene-ContactManager'
}

{ #category : #comparing }
SRAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self plz = anObject plz
		and: [ self place = anObject place
		and: [ self canton = anObject canton ] ] ] ]
]

{ #category : #accessing }
SRAddress >> canton [

	^ canton
]

{ #category : #accessing }
SRAddress >> canton: anObject [
	canton := anObject
]

{ #category : #descriptions }
SRAddress >> descriptionCanton [
	<simpleReneDescription>
	
	^ SRSingleOptionDescription new
		options: #( 'Zurich' 'Bern' 'Luzern' 'Uri' 'Schwyz' 'Unterwalden' 'Glarus' 'Zug' 'Freiburg' 'Solothurn' 'Basel' 'Schaffhausen' 'Appenzell' 'St. Gallen' 'Graubunden' 'Aargau' 'Thurgau' 'Ticino' 'Vaud' 'Valais' 'Neuchatel' 'Geneve' 'Jura' );
		reference: SRStringDescription new;
		accessor: #canton;
		label: 'Canton';
		priority: 40;
		beSorted;
		yourself
]

{ #category : #descriptions }
SRAddress >> descriptionPlace [
	<simpleReneDescription>
	
	^ SRStringDescription new
			accessor: #place;
			label: 'Place';
			priority: 30;
			yourself
]

{ #category : #descriptions }
SRAddress >> descriptionPlz [
	<simpleReneDescription>
	^ SRNumberDescription new
		accessor: #plz;
		label: 'PLZ';
		priority: 20;
		min: 1000;
		max: 9999;
		yourself
]

{ #category : #descriptions }
SRAddress >> descriptionStreet [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #street;
		label: 'Street';
		priority: 10;
		yourself
]

{ #category : #comparing }
SRAddress >> hash [
	^ self street hash bitXor: self place hash
]

{ #category : #accessing }
SRAddress >> nationality [
	^ nationality
]

{ #category : #accessing }
SRAddress >> nationality: anObject [
	nationality := anObject
]

{ #category : #accessing }
SRAddress >> place [
	^ place
]

{ #category : #accessing }
SRAddress >> place: anObject [
	place := anObject
]

{ #category : #accessing }
SRAddress >> plz [
	^ plz
]

{ #category : #accessing }
SRAddress >> plz: anObject [
	plz := anObject
]

{ #category : #accessing }
SRAddress >> street [
	^ street
]

{ #category : #accessing }
SRAddress >> street: anObject [
	street := anObject
]
