Class {
	#name : #MADescriptionBuilderTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainer: aDescription [
	<simpleReneContainer>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionContainerFoo: aDescription [
	<simpleReneContainer>
	
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription [
	<simpleReneDescription>
	^ MAToOneRelationDescription new 
		label: 'foo';
		accessor: MADictionaryAccessor new;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescription: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionBar: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> descriptionDescriptionRec: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription reference: self simpleReneDescription
]

{ #category : #'acessing-magritte' }
MADescriptionBuilderTest >> simpleReneDescriptionContainer [
	<simpleReneContainer>
	^ super simpleReneDescriptionContainer label: 'mock'
]

{ #category : #tests }
MADescriptionBuilderTest >> testContainer [
	self assert: self simpleReneDescription label equals: 'mock'.
	self assert: (self simpleReneDescription hasProperty: #foo).
	self assert: (self simpleReneDescription hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testDescription [
	self assert: self simpleReneDescription size = 1.
	self assert: self simpleReneDescription children first label = 'foo'.
	self assert: (self simpleReneDescription children first hasProperty: #foo).
	self assert: (self simpleReneDescription children first hasProperty: #bar)
]

{ #category : #tests }
MADescriptionBuilderTest >> testExtension [
	| description |
	description := MAMockAddress new simpleReneDescription
		detect: [ :each | each accessor selector = #place ].
	self assert: description isRequired.
	self assert: description isVisible not
]

{ #category : #tests }
MADescriptionBuilderTest >> testNilled [
	| description |
	description := MAMockAddress new simpleReneDescription.
	self assert: description size equals: 3
]

{ #category : #tests }
MADescriptionBuilderTest >> testRecursive [
	self assert: self simpleReneDescription children first reference equals: self simpleReneDescription
]
