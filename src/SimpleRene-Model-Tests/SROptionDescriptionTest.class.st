Class {
	#name : #SROptionDescriptionTest,
	#superclass : #SRReferenceDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SROptionDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
SROptionDescriptionTest >> actualClass [
	^ SROptionDescription
]

{ #category : #private }
SROptionDescriptionTest >> optionInstances [
	^ Array with: 'foo' with: 'bar' with: 'zork'
]

{ #category : #running }
SROptionDescriptionTest >> setUp [
	super setUp.
	self description options: self optionInstances
]

{ #category : #'tests-accessing' }
SROptionDescriptionTest >> testAllOptions [
	self description beRequired; beSorted; options: #( c b a ).
	self assert: self description allOptions = #( a b c ).

	self description beRequired; beUnsorted; options: #( c b a ).
	self assert: self description allOptions = #( c b a )
]

{ #category : #'tests-accessing' }
SROptionDescriptionTest >> testAllOptionsWithExisting [
	self description beRequired; options: #( a b c ).
	self assert: (self description allOptionsWith: #a) = #( a b c )
]

{ #category : #'tests-accessing' }
SROptionDescriptionTest >> testAllOptionsWithNil [
	self description beRequired; options: #( a b c ).
	self assert: (self description allOptionsWith: nil) = #( a b c )
]

{ #category : #'tests-copying' }
SROptionDescriptionTest >> testCopyOptions [
	self deny: self description copy options == self description options.
	self assert: self description copy options = self description options
]

{ #category : #'tests-strings' }
SROptionDescriptionTest >> testFromStringInvalid [
	"There is no invalid string input."
]

{ #category : #'tests-accessing' }
SROptionDescriptionTest >> testOptions [
	self description options: #( a b c ).
	self assert: self description options = #( a b c )
]

{ #category : #'tests-strings' }
SROptionDescriptionTest >> testOptionsAndLabels [
	self description reference: SRNumberDescription new.
	self assert: (self description labelForOption: 1) = '1'.

	self description optionsAndLabels: (Array with: 1 -> 'one' with: 2 -> 'two').
	self assert: (self description labelForOption: 1) = 'one'.
	self assert: (self description labelForOption: 2) = 'two'.
	self assert: (self description labelForOption: 3) = '3'
]

{ #category : #'tests-accessing' }
SROptionDescriptionTest >> testOptionsTextual [
	self description optionsTextual: 'a' , (String with: Character cr) , 'b'.
	self assert: self description optionsTextual = ('a' , (String with: Character cr) , 'b').
	self assert: self description options = #( 'a' 'b' )
]

{ #category : #tests }
SROptionDescriptionTest >> testReferencePrinting [
	| label |
	self description reference: SRStringDescription new.
	self assert: (self description labelForOption: 1) = '1'.
	label := self description labelForOption: 1 @ 2.
	self assert: (label includesSubstring: '1').
	self assert: (label includesSubstring: '2').
	label := self description labelForOption: 1 -> 2.
	self assert: (label includesSubstring: '1').
	self assert: (label includesSubstring: '2').
]

{ #category : #'tests-properties' }
SROptionDescriptionTest >> testSorted [
	self description beSorted.
	self assert: self description isSorted.
	self assert: self description sorted.

	self description beUnsorted.
	self deny: self description isSorted.
	self deny: self description sorted
]
