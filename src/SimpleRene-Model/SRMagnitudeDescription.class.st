"
I am an abstract description for subclasses of ==Magnitude==. The range of accepted values can be limited using the accessors ==min:== and ==max:==.
"
Class {
	#name : 'SRMagnitudeDescription',
	#superclass : 'SRElementDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRMagnitudeDescription class >> defaultMax [
	^ nil
]

{ #category : 'accessing-defaults' }
SRMagnitudeDescription class >> defaultMin [
	^ nil
]

{ #category : 'visiting' }
SRMagnitudeDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitMagnitudeDescription: self
]

{ #category : 'acessing-magritte' }
SRMagnitudeDescription >> descriptionMax [
	<simpleReneDescription>
	^ self class new
		accessor: #max;
		label: 'Maximum';
		priority: 410;
		yourself
]

{ #category : 'acessing-magritte' }
SRMagnitudeDescription >> descriptionMin [
	<simpleReneDescription>
	^ self class new
		accessor: #min;
		label: 'Min';
		priority: 400;
		yourself
]

{ #category : 'testing' }
SRMagnitudeDescription >> isSortable [
	^ true
]

{ #category : 'testing' }
SRMagnitudeDescription >> isWithinRange: anObject [
	^ (self min isNil or: [ self min <= anObject ])
		and: [ self max isNil or: [ self max >= anObject ] ]
]

{ #category : 'accessing' }
SRMagnitudeDescription >> max [
	^ self propertyAt: #max ifAbsent: [ self class defaultMax ]
]

{ #category : 'accessing' }
SRMagnitudeDescription >> max: aMagnitudeOrNil [
	"Set the maximum for accepted values, or ==nil== if open."

	self propertyAt: #max put: aMagnitudeOrNil
]

{ #category : 'accessing' }
SRMagnitudeDescription >> min [
	^ self propertyAt: #min ifAbsent: [ self class defaultMin ]
]

{ #category : 'accessing' }
SRMagnitudeDescription >> min: aMagnitudeOrNil [
	"Set the minimum for accepted values, or ==nil== if open."

	self propertyAt: #min put: aMagnitudeOrNil
]

{ #category : 'conveniance' }
SRMagnitudeDescription >> min: aMinimumObject max: aMaximumObject [
	"Set the minimum and maximum of accepted values, or ==nil== if open."

	self min: aMinimumObject; max: aMaximumObject
]

{ #category : 'accessing-messages' }
SRMagnitudeDescription >> rangeErrorMessage [
	| min max |
	^ self propertyAt: #rangeErrorMessage ifAbsent: [
		min := self toString: self min. max := self toString: self max.
		(self min notNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be between ' , min , ' and ' , max ].
		(self min notNil and: [ self max isNil ])
			ifTrue: [ ^ 'Input must be above or equeal to ' , min ].
		(self min isNil and: [ self max notNil ])
			ifTrue: [ ^ 'Input must be below or equal to ' , max ] ]
]

{ #category : 'accessing-messages' }
SRMagnitudeDescription >> rangeErrorMessage: aString [
	self propertyAt: #rangeErrorMessage put: aString
]

{ #category : 'validation-private' }
SRMagnitudeDescription >> validateSpecific: anObject [
	super validateSpecific: anObject.
	(self isWithinRange: anObject)
		ifFalse: [ SRRangeError description: self signal: self rangeErrorMessage ]
]
