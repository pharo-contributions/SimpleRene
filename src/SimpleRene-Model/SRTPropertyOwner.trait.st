Trait {
	#name : 'SRTPropertyOwner',
	#instVars : [
		'properties'
	],
	#category : 'SimpleRene-Model-Core',
	#package : 'SimpleRene-Model',
	#tag : 'Core'
}

{ #category : 'private' }
SRTPropertyOwner >> errorPropertyNotFound: aSelector [ 
	SRPropertyError signal: 'Property ' , aSelector , ' not found.'
]

{ #category : 'accessing' }
SRTPropertyOwner >> gtViewPropertiesOn: aView [
	<gtView>
	
	self properties ifEmpty: [ ^ aView empty ].
	
	^ aView columnedList
		title: 'Properties' translated;
		priority: 75;
		items: [ self properties associations ];
		column: 'Name' 
			text: [ :a | a key ]
			width: 75;
		column: 'Value' text: [ :a | a value ];
		send: [ :e | e value ];
		actionUpdateButton
]

{ #category : 'testing' }
SRTPropertyOwner >> hasProperty: aKey [
	"Test if the property ==aKey== is defined within the receiver."

	^ self properties includesKey: aKey
]

{ #category : 'copying' }
SRTPropertyOwner >> postCopyProperties [
	"Call after super postCopy"
	properties := properties copy
]

{ #category : 'accessing' }
SRTPropertyOwner >> properties [
	"Answer the property dictionary of the receiver."

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey [
	"Answer the value of the property ==aKey==, raises an error if the property doesn't exist."

	^ self propertyAt: aKey ifAbsent: [ self errorPropertyNotFound: aKey ]
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the value of the property ==aKey==, or the result of ==aBlock== if the property doesn't exist."

	^ self properties at: aKey ifAbsent: aBlock
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the value of the property ==aKey==, or if the property doesn't exist adds and answers the result of evaluating ==aBlock==."

	^ self properties at: aKey ifAbsentPut: aBlock
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey ifPresent: aBlock [
	"Lookup the property ==aKey==, if it is present, answer the value of evaluating ==aBlock== block with the value. Otherwise, answer ==nil==."

	^ self properties at: aKey ifPresent: aBlock
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey ifPresent: oneArgBlock ifAbsent: absentBlock [
	"Lookup ==aKey==, if it is present, answer the value of evaluating the oneArgBlock with the value associated with the key, otherwise answer the value of absentBlock."
	^ self properties at: aKey ifPresent: oneArgBlock ifAbsent: absentBlock
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aKey put: aValue [
	"Adds or replaces the property ==aKey== with ==aValue==."

	^ self properties at: aKey put: aValue
]

{ #category : 'accessing' }
SRTPropertyOwner >> propertyAt: aSymbol putRemovingNil: aValue [
	
	^ (aValue isNil and: [ self hasProperty: aSymbol ])
		ifTrue: [ self properties removeKey: aSymbol ]
		ifFalse: [ self propertyAt: aSymbol put: aValue ]
]
