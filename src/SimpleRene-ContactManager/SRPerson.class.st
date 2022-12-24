"
A simple modle of a person.
"
Class {
	#name : #SRPerson,
	#superclass : #Object,
	#instVars : [
		'title',
		'firstName',
		'lastName',
		'email',
		'homeAddress',
		'officeAddress',
		'picture',
		'birthday',
		'phones',
		'password'
	],
	#category : #'SimpleRene-ContactManager'
}

{ #category : #comparing }
SRPerson >> = anObject [
	^ self species = anObject species
		and: [ self title = anObject title
		and: [ self firstName = anObject firstName
		and: [ self lastName = anObject lastName
		and: [ self picture = anObject picture
		and: [ self birthday = anObject birthday
		and: [ self officeAddress = anObject officeAddress
		and: [ self homeAddress = anObject homeAddress ] ] ] ] ] ] ]
]

{ #category : #'accessing-calculated' }
SRPerson >> age [
	^ self birthday notNil
		ifTrue: [ Date current year - self birthday year ]
]

{ #category : #accessing }
SRPerson >> birthday [
	^ birthday
]

{ #category : #accessing }
SRPerson >> birthday: anObject [
	birthday := anObject
]

{ #category : #descriptions }
SRPerson >> descriptionAge [
	<simpleReneDescription>
	 ^ MANumberDescription new
		selectorAccessor: #age;
		label: 'Age';
		priority: 80;
		beReadonly;
		yourself
]

{ #category : #descriptions }
SRPerson >> descriptionBirthday [
	<simpleReneDescription>
	^ MADateDescription new
		accessor: #birthday;
		label: 'Birthday';
		priority: 70;
		yourself
]

{ #category : #descriptions }
SRPerson >> descriptionFirstName [
	<simpleReneDescription>
	
	^ MAStringDescription new
			accessor: #firstName;
			label: 'First Name';
			priority: 20;
			beRequired;
			yourself
]

{ #category : #descriptions }
SRPerson >> descriptionHomeAddress [
	<simpleReneDescription>
	
	^ MAToOneRelationDescription new
			"componentClass: MAInternalEditorMorph;"
			classes: (Array with: SRAddress);
			accessor: #homeAddress;
			label: 'Home Address';
			priority: 40;
			yourself
]

{ #category : #descriptions }
SRPerson >> descriptionLastName [
	<simpleReneDescription>
	
	^ MAStringDescription new
		accessor: #lastName;
		label: 'Last Name';
		priority: 30;
		beRequired;
		yourself
]

{ #category : #descriptions }
SRPerson >> descriptionOfficeAddress [
	<simpleReneDescription>
	
	^ MAToOneRelationDescription new
			"componentClass: MAExternalEditorComponent;"
			classes: (Array with: SRAddress);
			accessor: #officeAddress;
			label: 'Office Address';
			priority: 50;
			yourself
]

{ #category : #descriptions }
SRPerson >> descriptionPassword [
	<simpleReneDescription>
	
	^ MAPasswordDescription new
			"componentClass: MAVerifiedPasswordComponent;"
			accessor: #password;
			label: 'Password';
			priority: 100;
			yourself
]

{ #category : #descriptions }
SRPerson >> descriptionPhoneNumbers [
	<simpleReneDescription>
	
	^ MAToManyRelationDescription new
		classes: (Array with: SRPhone);
		label: 'Phone Numbers';
		default: Array new;
		accessor: #phones;
		priority: 90;
		yourself
]

{ #category : #descriptions }
SRPerson >> descriptionPicture [
	<simpleReneDescription>
	
	^ MAFileDescription new
		addCondition: [ :value | value isImage ] labelled: 'Image expected';
		accessor: #picture;
		label: 'Picture';
		priority: 60;
		yourself
]

{ #category : #descriptions }
SRPerson >> descriptionTitle [
	<simpleReneDescription>
	
	^ MASingleOptionDescription new
			options: #( 'Mr.' 'Mrs.' 'Ms.' 'Miss.' );
			accessor: #title;
			label: 'Title';
			priority: 10;
			yourself
]

{ #category : #accessing }
SRPerson >> email [
	^ email
]

{ #category : #accessing }
SRPerson >> email: anObject [
	email := anObject
]

{ #category : #accessing }
SRPerson >> firstName [
	^ firstName
]

{ #category : #accessing }
SRPerson >> firstName: anObject [
	firstName := anObject
]

{ #category : #comparing }
SRPerson >> hash [
	^ self firstName hash bitXor: self lastName hash
]

{ #category : #accessing }
SRPerson >> homeAddress [
	^ homeAddress
]

{ #category : #accessing }
SRPerson >> homeAddress: anObject [
	homeAddress := anObject
]

{ #category : #accessing }
SRPerson >> lastName [
	^ lastName
]

{ #category : #accessing }
SRPerson >> lastName: anObject [
	lastName := anObject
]

{ #category : #accessing }
SRPerson >> officeAddress [
	^ officeAddress
]

{ #category : #accessing }
SRPerson >> officeAddress: anObject [
	officeAddress := anObject
]

{ #category : #accessing }
SRPerson >> password [
	^ password
]

{ #category : #accessing }
SRPerson >> password: aString [
	password := aString
]

{ #category : #accessing }
SRPerson >> phones [
	^ phones
]

{ #category : #accessing }
SRPerson >> phones: anObject [
	phones := anObject
]

{ #category : #accessing }
SRPerson >> picture [
	^ picture
]

{ #category : #accessing }
SRPerson >> picture: anObject [
	picture := anObject
]

{ #category : #accessing }
SRPerson >> title [
	^ title
]

{ #category : #accessing }
SRPerson >> title: anObject [
	title := anObject
]
