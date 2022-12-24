Class {
	#name : #SRMockAddress2,
	#superclass : #SRMockAddress,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #'acessing-magritte' }
SRMockAddress2 >> descriptionStreet [
	"this pragma #magritteDescription is optional as the pragma will be retrieved from the super class's overridden method."
	<simpleReneDescription>
	
	^ super descriptionStreet
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
SRMockAddress2 >> simpleReneDescriptionContainer [
	"this pragma #simpleReneContainer is optional as the pragma will be retrieved from the superclass's overridden method."
	<simpleReneContainer>
	
	^ super simpleReneDescriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself
]
