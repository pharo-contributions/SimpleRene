"
I am a description of colors, possible values are instances of ==Color==. My visual representation could be a color-chooser.
"
Class {
	#name : 'SRColorDescription',
	#superclass : 'SRElementDescription',
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRColorDescription class >> defaultKind [
	^ Color
]

{ #category : 'testing' }
SRColorDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRColorDescription class >> label [
	^ 'Color'
]

{ #category : 'visiting' }
SRColorDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitColorDescription: self
]
