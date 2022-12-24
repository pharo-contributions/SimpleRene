Class {
	#name : #SRSingleOptionDescriptionTest,
	#superclass : #SROptionDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRSingleOptionDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRSingleOptionDescriptionTest >> actualClass [
	^ SRSingleOptionDescription
]

{ #category : #private }
SRSingleOptionDescriptionTest >> includedInstance [
	^ self optionInstances first
]

{ #category : #'tests-accessing' }
SRSingleOptionDescriptionTest >> testAllOptionsOptional [
	self description beOptional; beSorted; options: #( c b a ).
	self assert: self description allOptions = #( nil a b c ).

	self description beOptional; beUnsorted; options: #( c b a ).
	self assert: self description allOptions = #( nil c b a )
]

{ #category : #'tests-accessing' }
SRSingleOptionDescriptionTest >> testAllOptionsWithExtensible [
	self description beRequired; beUnsorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( c d a ).

	self description beRequired; beUnsorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( c d a b ).

	self description beRequired; beSorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( a c d ).

	self description beRequired; beSorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( a b c d )
]

{ #category : #'tests-accessing' }
SRSingleOptionDescriptionTest >> testAllOptionsWithOptional [
	self description beOptional; beSorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil a b c d ).

	self description beOptional; beSorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil a c d ).

	self description beOptional; beUnsorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil c d a b ).

	self description beOptional; beUnsorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil c d a )
]

{ #category : #'tests-properties' }
SRSingleOptionDescriptionTest >> testExtensible [
	self description beExtensible.
	self assert: self description isExtensible.
	self assert: self description extensible.

	self description beLimited.
	self deny: self description isExtensible.
	self deny: self description extensible
]

{ #category : #'tests-properties' }
SRSingleOptionDescriptionTest >> testGroupBy [
	self deny: self description isGrouped.
	self description groupBy: #grouping.
	self assert: self description isGrouped.

]

{ #category : #'tests-properties' }
SRSingleOptionDescriptionTest >> testGroupOf [
	self assert: SRDateDescription grouping = 'Magnitude'.

]

{ #category : #tests }
SRSingleOptionDescriptionTest >> testOptionsAndLabelsFromString [
	self description 
		undefined: 'void';
		optionsAndLabels: (Array with: 1 -> 'one' with: 2 -> 'two').

	self assert: (self description fromString: 'void') isNil.
	self assert: (self description fromString: 'one') = 1.
	self assert: (self description fromString: 'two') = 2
]

{ #category : #tests }
SRSingleOptionDescriptionTest >> testOptionsAndLabelsToString [
	self description 
		undefined: 'void';
		optionsAndLabels: (Array with: 1 -> 'one' with: 2 -> 'two').

	self assert: (self description toString: nil) = 'void'.
	self assert: (self description toString: 1) = 'one'.
	self assert: (self description toString: 2) = 'two'.
	self assert: (self description toString: 3) = '3'
]

{ #category : #'tests-validation' }
SRSingleOptionDescriptionTest >> testValidationExtensible [
	self description beLimited.
	self assert: (self description isSatisfiedBy: 'foo').
	self deny: (self description isSatisfiedBy: 'zonk').
	self deny: (self description isSatisfiedBy: 1).
	
	self description beExtensible.
	self assert: (self description isSatisfiedBy: 'foo').
	self assert: (self description isSatisfiedBy: 'zonk').
	self deny: (self description isSatisfiedBy: 1)
]
