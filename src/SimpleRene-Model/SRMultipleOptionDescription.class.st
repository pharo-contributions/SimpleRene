"
I am a description of multiple options, possible options are stored within the ==options== field, possible values are instances of ==Collection==. My visual representation could be a multi-select list or a group of check-boxes.
"
Class {
	#name : 'SRMultipleOptionDescription',
	#superclass : 'SROptionDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRMultipleOptionDescription class >> defaultDistinct [
	^ false
]

{ #category : 'accessing-defaults' }
SRMultipleOptionDescription class >> defaultKind [
	^ Collection
]

{ #category : 'accessing-defaults' }
SRMultipleOptionDescription class >> defaultOrdered [
	^ false
]

{ #category : 'testing' }
SRMultipleOptionDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRMultipleOptionDescription class >> label [
	^ 'Multiple-Option'
]

{ #category : 'visiting' }
SRMultipleOptionDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitMultipleOptionDescription: self
]

{ #category : 'actions' }
SRMultipleOptionDescription >> beDistinct [
	self distinct: true
]

{ #category : 'actions' }
SRMultipleOptionDescription >> beIndefinite [
	self distinct: false
]

{ #category : 'actions' }
SRMultipleOptionDescription >> beOrdered [
	self ordered: true
]

{ #category : 'actions' }
SRMultipleOptionDescription >> beUnordered [
	self ordered: false
]

{ #category : 'acessing-magritte' }
SRMultipleOptionDescription >> descriptionDistinct [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #distinct;
		label: 'Distinct';
		priority: 250;
		default: self class defaultDistinct;
		yourself
]

{ #category : 'acessing-magritte' }
SRMultipleOptionDescription >> descriptionOrdered [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #ordered;
		label: 'Ordered';
		priority: 260;
		default: self class defaultOrdered;
		yourself
]

{ #category : 'accessing-properties' }
SRMultipleOptionDescription >> distinct [
	^ self propertyAt: #distinct ifAbsent: [ self class defaultDistinct ]
]

{ #category : 'accessing-properties' }
SRMultipleOptionDescription >> distinct: aBoolean [
	self propertyAt: #distinct put: aBoolean
]

{ #category : 'testing' }
SRMultipleOptionDescription >> isDistinct [
	^ self distinct
]

{ #category : 'testing' }
SRMultipleOptionDescription >> isMultiple [
	^true
]

{ #category : 'testing' }
SRMultipleOptionDescription >> isOrdered [
	^ self ordered
]

{ #category : 'accessing-properties' }
SRMultipleOptionDescription >> ordered [
	^ self propertyAt: #ordered ifAbsent: [ self class defaultOrdered ]
]

{ #category : 'accessing-properties' }
SRMultipleOptionDescription >> ordered: aBoolean [
	self propertyAt: #ordered put: aBoolean
]

{ #category : 'validating' }
SRMultipleOptionDescription >> validateKind: anObject [
	self 
		tryValidation: [ super validateKind: anObject ]
	  ifPass: [ anObject do: [ :e | self validateOptionKind: e ] ]
]

{ #category : 'validating' }
SRMultipleOptionDescription >> validateRequired: anObject [
	super validateRequired: anObject.
	(self isRequired and: [ anObject isCollection and: [ anObject isEmpty ] ])
		ifTrue: [ SRRequiredError description: self signal: self requiredErrorMessage ]
]
