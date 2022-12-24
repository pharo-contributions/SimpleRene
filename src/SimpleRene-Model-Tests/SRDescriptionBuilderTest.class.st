Class {
	#name : #SRDescriptionBuilderTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionContainer: aDescription [
	<simpleReneContainer>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionContainerFoo: aDescription [
	<simpleReneContainer>
	
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionDescription [
	<simpleReneDescription>
	^ SRToOneRelationDescription new 
		label: 'foo';
		accessor: SRDictionaryAccessor new;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionDescription: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionDescriptionBar: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription
		propertyAt: #bar put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> descriptionDescriptionRec: aDescription [
	<simpleReneDescription: #descriptionDescription>
	^ aDescription reference: self simpleReneDescription
]

{ #category : #'acessing-magritte' }
SRDescriptionBuilderTest >> simpleReneDescriptionContainer [
	<simpleReneContainer>
	^ super simpleReneDescriptionContainer label: 'mock'
]

{ #category : #tests }
SRDescriptionBuilderTest >> testContainer [
	self assert: self simpleReneDescription label equals: 'mock'.
	self assert: (self simpleReneDescription hasProperty: #foo).
	self assert: (self simpleReneDescription hasProperty: #bar)
]

{ #category : #tests }
SRDescriptionBuilderTest >> testDescription [
	self assert: self simpleReneDescription size = 1.
	self assert: self simpleReneDescription children first label = 'foo'.
	self assert: (self simpleReneDescription children first hasProperty: #foo).
	self assert: (self simpleReneDescription children first hasProperty: #bar)
]

{ #category : #tests }
SRDescriptionBuilderTest >> testExtension [
	| description |
	description := SRMockAddress new simpleReneDescription
		detect: [ :each | each accessor selector = #place ].
	self assert: description isRequired.
	self assert: description isVisible not
]

{ #category : #tests }
SRDescriptionBuilderTest >> testNilled [
	| description |
	description := SRMockAddress new simpleReneDescription.
	self assert: description size equals: 3
]

{ #category : #tests }
SRDescriptionBuilderTest >> testRecursive [
	self assert: self simpleReneDescription children first reference equals: self simpleReneDescription
]
