Class {
	#name : #MAMockAddress2,
	#superclass : #MAMockAddress,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'acessing-magritte' }
MAMockAddress2 >> descriptionStreet [
	"this pragma #magritteDescription is optional as the pragma will be retrieved from the super class's overridden method."
	<magritteDescription>
	
	^ super descriptionStreet
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress2 >> simpleReneDescriptionContainer [
	"this pragma #simpleReneContainer is optional as the pragma will be retrieved from the superclass's overridden method."
	<simpleReneContainer>
	
	^ super simpleReneDescriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself
]
