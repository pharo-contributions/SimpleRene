Class {
	#name : 'SRActionDescription',
	#superclass : 'SRObject',
	#instVars : [
		'enableBlock',
		'model',
		'comment',
		'priority',
		'label',
		'action',
		'icon',
		'isMutator',
		'shortcut'
	],
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'testing' }
SRActionDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRActionDescription class >> maPragma [
	"Annotate constructor methods with this pragma to get picked up by SimpleRene; similar to #simpleReneDescription"
	^ #simpleReneActionDescription
]

{ #category : 'comparing' }
SRActionDescription >> <= anObject [

	^ self priority <= anObject priority
]

{ #category : 'comparing' }
SRActionDescription >> = anObject [
	^ super = anObject and: [ self action = anObject action ]
]

{ #category : 'accessing' }
SRActionDescription >> action [

	^ action
]

{ #category : 'accessing' }
SRActionDescription >> action: aValuable [

	action := aValuable.
]

{ #category : 'accessing' }
SRActionDescription >> comment [

	^ comment ifNil: [ '' ]
]

{ #category : 'accessing' }
SRActionDescription >> comment: aString [

	comment := aString.
]

{ #category : 'accessing' }
SRActionDescription >> enableBlock [
	^ enableBlock ifNil: [ true ]
]

{ #category : 'accessing' }
SRActionDescription >> enableBlock: aBlock [
	"aBlock
		- one argument (optional); the model object
		- returns a boolean indicating whether the button should be enabled"
	
	enableBlock := aBlock.
]

{ #category : 'comparing' }
SRActionDescription >> hash [
	^ super hash bitXor: self action hash
]

{ #category : 'accessing' }
SRActionDescription >> icon [
	^ icon ifNotNil: [ self iconNamed: icon ]
]

{ #category : 'accessing' }
SRActionDescription >> icon: aSymbol [
	"Browse available via `Smalltalk ui icons`"
	icon := aSymbol
]

{ #category : 'initialization' }
SRActionDescription >> initialize [

	super initialize.
	enableBlock := [ true ].
]

{ #category : 'testing' }
SRActionDescription >> isEnabled [

	^ enableBlock cull: model.
]

{ #category : 'accessing' }
SRActionDescription >> isLabelVisible [
	"Experiment: Are label and icon 'either-or', or might a user want both?"
	^ self propertyAt: #isLabelVisible ifAbsent: [ true ].
]

{ #category : 'accessing' }
SRActionDescription >> isLabelVisible: aBoolean [
	self propertyAt: #isLabelVisible put: aBoolean
]

{ #category : 'accessing' }
SRActionDescription >> isMutator [
	^ isMutator ifNil: [ true ]
]

{ #category : 'accessing' }
SRActionDescription >> isMutator: anObject [
	"Does the action I describe potentially change the object it acts on?"
	isMutator := anObject
]

{ #category : 'accessing' }
SRActionDescription >> label [

	^ label ifNil: [ action asString capitalized normalizeCamelCase ].
]

{ #category : 'accessing' }
SRActionDescription >> label: aString [

	label := aString.
]

{ #category : 'private' }
SRActionDescription >> performOn: aModel [

	action cull: aModel.
]

{ #category : 'accessing' }
SRActionDescription >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' label: '; print: self label.
	aStream nextPutAll: ' comment: '; print: self comment
]

{ #category : 'accessing' }
SRActionDescription >> priority [

	^ priority ifNil: [ 0 ]
]

{ #category : 'accessing' }
SRActionDescription >> priority: anInteger [ 

	priority := anInteger.
]

{ #category : 'accessing' }
SRActionDescription >> selector [
	self 
		deprecated: 'Renamed to #action because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector' 
						-> '`@receiver action'.
	^ self action
]

{ #category : 'accessing' }
SRActionDescription >> selector: aValuable [
		self 
		deprecated: 'Renamed to #action: because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector: `@arg' 
						-> '`@receiver action: `@arg'.

	self action: aValuable.
]

{ #category : 'accessing' }
SRActionDescription >> shortcut [
	^ shortcut
]

{ #category : 'accessing' }
SRActionDescription >> shortcut: anObject [
	shortcut := anObject
]
