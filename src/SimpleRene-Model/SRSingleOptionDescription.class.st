"
I am a description of a single option, possible values are stored within the ==options== field, but I might also be extensible so that the user can add its own option. My visual representation could be a drop-down list or a group of option-buttons.
"
Class {
	#name : #SRSingleOptionDescription,
	#superclass : #SROptionDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #accessing }
SRSingleOptionDescription class >> example [
	<gtExample>
	^ SRSingleOptionDescription new
		options: #(1 2 3);
		yourself
]

{ #category : #testing }
SRSingleOptionDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRSingleOptionDescription class >> label [
	^ 'Single-Option'
]

{ #category : #visiting }
SRSingleOptionDescription >> acceptMagritte: aVisitor [
	aVisitor visitSingleOptionDescription: self
]

{ #category : #'acessing-magritte' }
SRSingleOptionDescription >> descriptionGroupBy [
	<simpleReneDescription>
	^ SRSymbolDescription new
		selectorAccessor: #groupBy;
		label: 'Grouped by';
		priority: 260;
		default: nil;
		yourself
]

{ #category : #'accessing-properties' }
SRSingleOptionDescription >> groupBy [
	^ self propertyAt: #groupBy ifAbsent: [ nil ]
]

{ #category : #'accessing-properties' }
SRSingleOptionDescription >> groupBy: anAccessor [
	"anAccessor to be sent to the options objects for getting their group."
	
	self propertyAt: #groupBy put: anAccessor asSimpleReneAccessor
]

{ #category : #testing }
SRSingleOptionDescription >> isGrouped [
	^ self groupBy notNil
]

{ #category : #private }
SRSingleOptionDescription >> prepareOptions: aCollection [
	^ self isRequired
		ifTrue: [ super prepareOptions: aCollection ]
		ifFalse: [ (Array with: self undefinedValue) , (super prepareOptions: aCollection) ]
]

{ #category : #validating }
SRSingleOptionDescription >> validateKind: anObject [
	super validateKind: anObject.
	self validateOptionKind: anObject
]
