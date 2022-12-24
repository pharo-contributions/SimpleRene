Class {
	#name : #MADescriptionBuilderTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainer: aDescription [
	<magritteContainer>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainerFoo: aDescription [
	<magritteContainer>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription [
	<magritteDescription>
	^ MAToOneRelationDescription new 
		label: 'foo';
		accessor: MADictionaryAccessor new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionBar: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionRec: aDescription [
	<magritteDescription: #descriptionDescription>
	^ aDescription reference: self simpleReneMagritteDescription
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> simpleReneDescriptionContainer [
	<simpleReneContainer>
	^ super simpleReneDescriptionContainer label: 'mock'
]

{ #category : #tests }
MADescriptionBuilderTest >> testContainer [
	self assert: self simpleReneMagritteDescription label = 'mock'.
	self assert: (self simpleReneMagritteDescription hasProperty: #foo).
	self assert: (self simpleReneMagritteDescription hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testDescription [
	self assert: self simpleReneMagritteDescription size = 1.
	self assert: self simpleReneMagritteDescription children first label = 'foo'.
	self assert: (self simpleReneMagritteDescription children first hasProperty: #foo).
	self assert: (self simpleReneMagritteDescription children first hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testExtension [
	| description |
	description := MAMockAddress new simpleReneMagritteDescription
		detect: [ :each | each accessor selector = #place ].
	self assert: description isRequired.
	self assert: description isVisible not
]

{ #category : #tests }
MADescriptionBuilderTest >> testNilled [
	| description |
	description := MAMockAddress new simpleReneMagritteDescription.
	self assert: description size = 3
]

{ #category : #tests }
MADescriptionBuilderTest >> testRecursive [
	self assert: self simpleReneMagritteDescription children first reference = self simpleReneMagritteDescription
]
