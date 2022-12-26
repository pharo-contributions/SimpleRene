"
A simple address for a city located in Switzerland.

```
	| address |
	address := SRAddress example1.
	^ address simpleReneDescription do: [ :description | 
		  Transcript
			  show: description label;
			  show: ':';
			  tab;
			  show: (description toString: (address simpleReneReadUsing: description));
			  cr ]
```
"
Class {
	#name : #SRAddress,
	#superclass : #Object,
	#instVars : [
		'street',
		'region',
		'location',
		'zip'
	],
	#category : #'SimpleRene-ContactManager'
}

{ #category : #examples }
SRAddress class >> example1 [
	<sampleInstance>
	^ self new street: 'Champs elisee'; location: 'Paris'; zip: 75000 ; region: 'Bretagne'
]

{ #category : #comparing }
SRAddress >> = anObject [
	^ self species = anObject species
		and: [ self street = anObject street
		and: [ self zip = anObject zip
		and: [ self location = anObject location
		and: [ self region = anObject region ] ] ] ]
]

{ #category : #descriptions }
SRAddress >> descriptionLocation [
	<simpleReneDescription>
	
	^ SRStringDescription new
			accessor: #location;
			label: 'Location';
			priority: 30;
			yourself
]

{ #category : #descriptions }
SRAddress >> descriptionPostalID [
	<simpleReneDescription>
	
	^ SRNumberDescription new
		accessor: #zip;
		label: 'ZIP';
		priority: 20;
		min: 10000;
		max: 99999;
		yourself
]

{ #category : #descriptions }
SRAddress >> descriptionRegion [
	<simpleReneDescription>
	
	^ SRSingleOptionDescription new
		options: #( 'Zurich' 'Bern' 'Luzern' 'Uri' 'Schwyz' 'Unterwalden' 'Glarus' 'Zug' 'Freiburg' 'Solothurn' 'Basel' 'Schaffhausen' 'Appenzell' 'St. Gallen' 'Graubunden' 'Aargau' 'Thurgau' 'Ticino' 'Vaud' 'Valais' 'Neuchatel' 'Geneve' 'Jura' );
		reference: SRStringDescription new;
		accessor: #region;
		label: 'Region';
		priority: 40;
		beSorted;
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
	^ self street hash bitXor: self zip hash
]

{ #category : #accessing }
SRAddress >> location [
	^ location
]

{ #category : #accessing }
SRAddress >> location: anObject [
	location := anObject
]

{ #category : #accessing }
SRAddress >> region [

	^ region
]

{ #category : #accessing }
SRAddress >> region: anObject [
	region := anObject
]

{ #category : #accessing }
SRAddress >> street [
	^ street
]

{ #category : #accessing }
SRAddress >> street: anObject [
	street := anObject
]

{ #category : #accessing }
SRAddress >> zip [
	^ zip
]

{ #category : #accessing }
SRAddress >> zip: anInteger [ 
	zip := anInteger
]
