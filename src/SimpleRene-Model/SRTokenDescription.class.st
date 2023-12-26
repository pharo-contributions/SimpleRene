"
I am a description of tokens all described by the referenced description, possible values are instances of ==SequenceableCollection==.
"
Class {
	#name : 'SRTokenDescription',
	#superclass : 'SRReferenceDescription',
	#instVars : [
		'separators'
	],
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRTokenDescription class >> defaultKind [
	^ Array
]

{ #category : 'accessing-defaults' }
SRTokenDescription class >> defaultSeparators [
	^ ' ,;', (String with: Character cr with: Character lf with: Character tab)
]

{ #category : 'testing' }
SRTokenDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRTokenDescription class >> label [
	^ 'Token'
]

{ #category : 'visiting' }
SRTokenDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitTokenDescription: self
]

{ #category : 'acessing-magritte' }
SRTokenDescription >> descriptionSeparators [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #separators;
		label: 'Separators';
		priority: 250;
		yourself
]

{ #category : 'accessing' }
SRTokenDescription >> separators [
	^ separators ifNil: [ separators := self class defaultSeparators ]
]

{ #category : 'accessing' }
SRTokenDescription >> separators: aString [
	"A string with the separator characters to split tokens, the first character is used as a default for printing."

	separators := aString
]
