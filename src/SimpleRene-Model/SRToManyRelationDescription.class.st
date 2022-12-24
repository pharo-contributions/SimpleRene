"
I am a description of an one-to-many relationship, possible values are instances of ==Collection==.
"
Class {
	#name : #SRToManyRelationDescription,
	#superclass : #SRRelationDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRToManyRelationDescription class >> defaultDefinitive [
	^ false
]

{ #category : #'accessing-defaults' }
SRToManyRelationDescription class >> defaultKind [
	^ Collection
]

{ #category : #'accessing-defaults' }
SRToManyRelationDescription class >> defaultOrdered [
	^ false
]

{ #category : #'accessing-defaults' }
SRToManyRelationDescription class >> defaultShouldCacheDefault [
	^ true
]

{ #category : #'accessing-defaults' }
SRToManyRelationDescription class >> defaultSorted [
	^ false
]

{ #category : #testing }
SRToManyRelationDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRToManyRelationDescription class >> label [
	^ '1:m Relation'
]

{ #category : #visiting }
SRToManyRelationDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitToManyRelationDescription: self
]

{ #category : #actions }
SRToManyRelationDescription >> beDefinitive [
	self definitive: true
]

{ #category : #actions }
SRToManyRelationDescription >> beModifiable [
	self definitive: false
]

{ #category : #actions }
SRToManyRelationDescription >> beOrdered [
	self ordered: true
]

{ #category : #actions }
SRToManyRelationDescription >> beSorted [
	self sorted: true
]

{ #category : #actions }
SRToManyRelationDescription >> beUnordered [
	self ordered: false
]

{ #category : #actions }
SRToManyRelationDescription >> beUnsorted [
	self sorted: false
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> definitive [
	"Return true if the field is non-modifiable"

	^ self propertyAt: #definitive ifAbsent: [ self class defaultDefinitive ]
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> definitive: aBoolean [
	self propertyAt: #definitive put: aBoolean
]

{ #category : #'acessing-magritte' }
SRToManyRelationDescription >> descriptionDefinitive [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #definitive;
		label: 'Definitive';
		priority: 265;
		default: self class defaultDefinitive;
		yourself
]

{ #category : #'acessing-magritte' }
SRToManyRelationDescription >> descriptionOrdered [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self class defaultOrdered;
		yourself
]

{ #category : #'acessing-magritte' }
SRToManyRelationDescription >> descriptionSorted [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #sorted;
		label: 'Sorted';
		priority: 240;
		default: self class defaultSorted;
		yourself
]

{ #category : #testing }
SRToManyRelationDescription >> isDefinitive [
	"Return true if the field is non-modifiable"

	^ self definitive.
]

{ #category : #testing }
SRToManyRelationDescription >> isOrdered [
	^ self ordered
]

{ #category : #testing }
SRToManyRelationDescription >> isSorted [
	^ self sorted
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> ordered [
	^ self propertyAt: #ordered ifAbsent: [ self class defaultOrdered ]
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> ordered: aBoolean [
	self propertyAt: #ordered put: aBoolean
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> sorted [
	^ self propertyAt: #sorted ifAbsent: [ self class defaultSorted ]
]

{ #category : #'accessing-properties' }
SRToManyRelationDescription >> sorted: aBoolean [
	self propertyAt: #sorted put: aBoolean
]

{ #category : #validating }
SRToManyRelationDescription >> validateKind: anObject [

	self
		tryValidation: [ super validateKind: anObject ]
		ifPass: [ 
			anObject do: [ :object |
				(self classes anySatisfy: [ :class | object species includesBehavior: class ])
					ifFalse: [ SRKindError description: self signal: self kindErrorMessage ] ] ]
]

{ #category : #validating }
SRToManyRelationDescription >> validateRequired: anObject [
	super validateRequired: anObject.
	(self isRequired and: [ anObject isCollection and: [ anObject isEmpty ] ])
		ifTrue: [ SRRequiredError description: self signal: self requiredErrorMessage ]
]
