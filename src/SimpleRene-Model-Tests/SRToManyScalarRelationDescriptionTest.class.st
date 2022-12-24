Class {
	#name : #SRToManyScalarRelationDescriptionTest,
	#superclass : #SRToManyRelationDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #private }
SRToManyScalarRelationDescriptionTest >> actualClass [
	^ SRToManyScalarRelationDescription
]

{ #category : #private }
SRToManyScalarRelationDescriptionTest >> includedInstance [
	^ Array with: '1' with: '2'
]

{ #category : #running }
SRToManyScalarRelationDescriptionTest >> setUp [
	super setUp.
	self description
		reference: (SRStringDescription new
			accessor: SRNullAccessor new;
			yourself);
		classes: (Array with: String)
]
