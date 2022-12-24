Class {
	#name : #SRDescriptionHolder,
	#superclass : #SRValueHolder,
	#category : #'SimpleRene-Model-Utility'
}

{ #category : #'acessing-magritte' }
SRDescriptionHolder class >> descriptionClasses [
	^ SRElementDescription withAllConcreteClasses asOrderedCollection
]

{ #category : #groups }
SRDescriptionHolder class >> groupChoice [
	^ Set new
		add: SRBooleanDescription;
		add: SRSingleOptionDescription;
		add: SRMultipleOptionDescription;
		add: SRToOneRelationDescription;
		add: SRToManyRelationDescription;
		add: SRToManyScalarRelationDescription;		
		yourself
]

{ #category : #groups }
SRDescriptionHolder class >> groupMagnitude [
	^ Set new
		add: SRNumberDescription;
		add: SRDurationDescription;
		add: SRDateDescription;
		add: SRTimeDescription;
		add: SRDateAndTimeDescription;
		yourself
]

{ #category : #groups }
SRDescriptionHolder class >> groupMisc [
	^ Set new
		add: SRFileDescription;
		add: SRClassDescription;
		add: SRTableDescription;
		yourself
]

{ #category : #groups }
SRDescriptionHolder class >> groupOf: aClass [ 
	(self groupText includes: aClass)
		ifTrue: [ ^ 'Text' ].
	(self groupChoice includes: aClass)
		ifTrue: [ ^ 'Choice' ].
	(self groupMagnitude includes: aClass)
		ifTrue: [ ^ 'Magnitude' ].
	(self groupPick includes: aClass)
		ifTrue: [ ^ 'Pick' ].
	(self groupMisc includes: aClass)
		ifTrue: [ ^ 'Miscellaneous' ].
	^ 'Other'
]

{ #category : #groups }
SRDescriptionHolder class >> groupPick [
	^ Set new
		add: SRColorDescription;
		add: SRTokenDescription;
		yourself
]

{ #category : #groups }
SRDescriptionHolder class >> groupText [
	^ Set new
		add: SRStringDescription;
		add: SRMemoDescription;
		add: SRSymbolDescription;
		add: SRPasswordDescription;
		yourself

]

{ #category : #'acessing-magritte' }
SRDescriptionHolder >> descriptionValue [
	<simpleReneDescription>
	^ SRSingleOptionDescription new
		reference: SRClassDescription new;
		options: self class descriptionClasses;
		selectorAccessor: 'contents';
		groupBy: #grouping;
		label: 'Type';
		priority: 20;
		yourself
]

{ #category : #initialization }
SRDescriptionHolder >> initialize [
	super initialize.
	self contents: self class descriptionClasses first
]
