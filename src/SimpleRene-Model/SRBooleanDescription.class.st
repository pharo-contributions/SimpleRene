"
I am a description of the Boolean values ==true== and ==false==. My visual representation could be a check-box.
"
Class {
	#name : #SRBooleanDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRBooleanDescription class >> defaultFalseString [
	^ self defaultFalseStrings first
]

{ #category : #'accessing-defaults' }
SRBooleanDescription class >> defaultFalseStrings [
	^ #( 'false' 'f' 'no' 'n' '0' 'off' )
]

{ #category : #'accessing-defaults' }
SRBooleanDescription class >> defaultKind [
	^ Boolean
]

{ #category : #'accessing-defaults' }
SRBooleanDescription class >> defaultTrueString [
	^ self defaultTrueStrings first
]

{ #category : #'accessing-defaults' }
SRBooleanDescription class >> defaultTrueStrings [
	^ #( 'true' 't' 'yes' 'y' '1' 'on' )
]

{ #category : #testing }
SRBooleanDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRBooleanDescription class >> label [
	^ 'Boolean'
]

{ #category : #visiting }
SRBooleanDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitBooleanDescription: self
]

{ #category : #'accessing-selection' }
SRBooleanDescription >> allOptions [
	^ self options
]

{ #category : #'accessing-selection' }
SRBooleanDescription >> allOptionsWith: anObject [
	^ self options
]

{ #category : #'acessing-magritte' }
SRBooleanDescription >> descriptionFalseString [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #falseString;
		default: self class defaultFalseString;
		label: 'False String';
		priority: 410;
		yourself
]

{ #category : #'acessing-magritte' }
SRBooleanDescription >> descriptionRequired [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
SRBooleanDescription >> descriptionTrueString [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #trueString;
		default: self class defaultTrueString;
		label: 'True String';
		priority: 400;
		yourself
]

{ #category : #'accessing-properties' }
SRBooleanDescription >> falseString [
	^ self propertyAt: #falseString ifAbsent: [ self class defaultFalseString ]
]

{ #category : #'accessing-properties' }
SRBooleanDescription >> falseString: aString [
	self propertyAt: #falseString put: aString
]

{ #category : #'accessing-readonly' }
SRBooleanDescription >> falseStrings [
	^ self class defaultFalseStrings
]

{ #category : #'accessing-selection' }
SRBooleanDescription >> isExtensible [
	^ false
]

{ #category : #private }
SRBooleanDescription >> labelForOption: anObject [
	anObject == true
		ifTrue: [ ^ self trueString ].
	anObject == false
		ifTrue: [ ^ self falseString ].
	^ self undefined
]

{ #category : #'accessing-selection' }
SRBooleanDescription >> options [
	^ Array with: false with: true
]

{ #category : #'accessing-selection' }
SRBooleanDescription >> reference [
	^ self
]

{ #category : #'accessing-properties' }
SRBooleanDescription >> trueString [
	^ self propertyAt: #trueString ifAbsent: [ self class defaultTrueString ]
]

{ #category : #'accessing-properties' }
SRBooleanDescription >> trueString: aString [
	self propertyAt: #trueString put: aString
]

{ #category : #'accessing-readonly' }
SRBooleanDescription >> trueStrings [
	^ self class defaultTrueStrings
]
