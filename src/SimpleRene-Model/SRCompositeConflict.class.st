Class {
	#name : 'SRCompositeConflict',
	#superclass : 'Object',
	#instVars : [
		'kind',
		'string'
	],
	#category : 'SimpleRene-Model-Accessor',
	#package : 'SimpleRene-Model',
	#tag : 'Accessor'
}

{ #category : 'comparing' }
SRCompositeConflict >> = rhs [
	^ self species = rhs species
]

{ #category : 'accessing' }
SRCompositeConflict >> doesNotUnderstand: aMessage [
	^ (self kind canUnderstand: aMessage selector)
		ifTrue: [ self string ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : 'comparing' }
SRCompositeConflict >> hash [
	^ self species hash
]

{ #category : 'class membership' }
SRCompositeConflict >> isKindOf: aClass [
	"This is to pass #validateKind:"
	^ (super isKindOf: aClass) or: [ self kind = aClass ]
]

{ #category : 'accessing' }
SRCompositeConflict >> kind [
	^ kind
]

{ #category : 'accessing' }
SRCompositeConflict >> kind: aClass [
	kind := aClass
]

{ #category : 'printing' }
SRCompositeConflict >> printOn: aStream [
	aStream nextPutAll: self string
]

{ #category : 'accessing' }
SRCompositeConflict >> string [
	^ string ifNil: [ '(Multiple values)' ]
]

{ #category : 'accessing' }
SRCompositeConflict >> string: aString [
	string := aString
]
