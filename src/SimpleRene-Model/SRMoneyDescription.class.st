"
Once you have settled on a money library, make the class it uses to model money my ==#defaultKind== via ${method:MAMoneyDescription class>>#defaultKind:}$

! Instance Creation of Money

!! Money Library
Money decoded from a string uses a float for the amount. See class comment for more info. For other e.g. ScaledDecimal precision, create and set a custom string reader which implements ==#visitMoneyDescription:== with something like this:
[[[language=smalltalk
	^ Money amount: (ScaledDecimal readFrom: (self copyWithout: $,)) currency: #USD
]]]
"
Class {
	#name : 'SRMoneyDescription',
	#superclass : 'SRElementDescription',
	#classVars : [
		'DefaultMoneyClass'
	],
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRMoneyDescription class >> defaultKind [
	^ DefaultMoneyClass
]

{ #category : 'accessing-defaults' }
SRMoneyDescription class >> defaultKind: aClass [
	"This is a hook so one can choose any Money library. An alternative would be to allow the chosen library to implement #defaultKind as an extension method and remove this setter, but that would dirty packages if multiple libraries were loaded simultaneously (not sure how much that matters in practice, especially since each of my instances can specify their kind)"
	DefaultMoneyClass := aClass
]

{ #category : 'testing' }
SRMoneyDescription class >> isAbstract [
	^ false
]

{ #category : 'accessing' }
SRMoneyDescription class >> label [
	^ 'Money'
]

{ #category : 'visiting' }
SRMoneyDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitMoneyDescription: self
]
