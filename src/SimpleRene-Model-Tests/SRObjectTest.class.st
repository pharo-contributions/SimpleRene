Class {
	#name : #SRObjectTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #building }
SRObjectTest class >> buildTestClassFor: aClass [ 
	"Utility method to create test cases for each object. Use like:
	
	 self buildTestClassFor: MAObject "
	| thisName thisClass thisCategory parentClass |
	thisName := (aClass name , 'Test') asSymbol.
	(thisName beginsWith: 'MA') ifFalse: [ ^ self ].
	thisClass := self environment classNamed: thisName.
	thisCategory := 'SimpleRene-Tests-Model-' , (aClass category copyAfterLast: $-).
	parentClass := self = thisClass 
		ifTrue: [ self superclass ]
		ifFalse: 
			[ self environment classNamed: (aClass superclass name , 'Test') asSymbol ].
	thisClass := parentClass 
		subclass: thisName
		instanceVariableNames: (thisClass isNil 
				ifFalse: [ thisClass instanceVariablesString ]
				ifTrue: [ String new ])
		classVariableNames: ''
		poolDictionaries: ''
		category: thisCategory.
	thisClass 
		compile: 'actualClass
	^ ' , aClass name
		classified: #private.
	thisClass class 
		compile: 'isAbstract
	^ ' , aClass isAbstract asString
		classified: #testing.
	aClass subclassesDo: [ :each | self buildTestClassFor: each ]
]

{ #category : #testing }
SRObjectTest class >> isAbstract [
	^ true
]

{ #category : #accessing }
SRObjectTest class >> packageNamesUnderTest [
	^ #('SimpleRene-Model')
]

{ #category : #testing }
SRObjectTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
SRObjectTest >> actualClass [
	^ SRObject
]

{ #category : #accessing }
SRObjectTest >> instance [
	self subclassResponsibility
]

{ #category : #'tests-copying' }
SRObjectTest >> testCopy [
	self assert: self instance = self instance copy.
	self deny: self instance == self instance copy
]

{ #category : #'tests-copying' }
SRObjectTest >> testCopyProperties [
	self deny: self instance properties == self instance copy properties
]

{ #category : #'tests-comparing' }
SRObjectTest >> testEqual [
	self assert: self instance = self instance.
	self assert: self instance = self instance copy.
	self assert: self instance copy = self instance.

	self deny: self instance = 123.
	self deny: self instance = String new
]

{ #category : #'tests-comparing' }
SRObjectTest >> testHash [
	self assert: self instance hash isInteger.
	self assert: self instance hash = self instance hash.
	self assert: self instance hash = self instance copy hash
]

{ #category : #'tests-testing' }
SRObjectTest >> testIsDescription [
	self deny: self instance isSimpleReneDescription
]

{ #category : #'tests-properties' }
SRObjectTest >> testProperties [
	self assert: self instance properties notNil.
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo put: #bar.
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo ifAbsent: [ nil ].
	self instance instVarNamed: 'properties' put: nil.

	self instance propertyAt: #foo ifAbsentPut: [ #bar ].
	self instance instVarNamed: 'properties' put: nil.

	self instance hasProperty: #foo.
	self instance instVarNamed: 'properties' put: nil
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesAt [
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo) = 'bar'.
	self should: [ self instance propertyAt: #bar ] raise: SRPropertyError
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesAtIfAbsent [
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsent: [ 'baz' ]) = 'bar'.
	self assert: (self instance propertyAt: #bar ifAbsent: [ 'baz' ]) = 'baz'
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesAtIfAbsentPut [
	self assert: (self instance propertyAt: #foo put: 'bar') = 'bar'.
	self assert: (self instance propertyAt: #foo ifAbsentPut: [ 'baz' ]) = 'bar'.
	self assert: (self instance propertyAt: #foo) = 'bar'.

	self assert: (self instance propertyAt: #bar ifAbsentPut: [ 'baz' ]) = 'baz'.
	self assert: (self instance propertyAt: #bar) = 'baz'
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesAtIfPresent [
	self assert: (self instance propertyAt: #foo ifPresent: [ :value | self assert: false ]) isNil.
	self instance propertyAt: #foo put: 1.
	self assert: (self instance propertyAt: #foo ifPresent: [ :value | self assert: value = 1. 2 ]) = 2
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesAtPut [
	self instance propertyAt: #foo put: 'bar'.
	self assert: (self instance propertyAt: #foo) = 'bar'.

	self instance propertyAt: #foo put: 'baz'.
	self assert: (self instance propertyAt: #foo) = 'baz'
]

{ #category : #'tests-properties' }
SRObjectTest >> testPropertiesHas [
	self deny: (self instance hasProperty: #foo).
	self instance propertyAt: #foo put: 'bar'.
	self assert: (self instance hasProperty: #foo).
	self deny: (self instance hasProperty: #bar)
]

{ #category : #tests }
SRObjectTest >> testSanity [
	"If this test case fails, there is something wrong with the setup of the test-case."

	self
		assert: self actualClass isAbstract not
		description: 'Unable to test abstract class.'.
	self
		assert: self instance class = self actualClass
		description: 'Invalid test instance.'
]
