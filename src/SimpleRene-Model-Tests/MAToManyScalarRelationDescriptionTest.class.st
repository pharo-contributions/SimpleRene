Class {
	#name : #MAToManyScalarRelationDescriptionTest,
	#superclass : #MAToManyRelationDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #private }
MAToManyScalarRelationDescriptionTest >> actualClass [
	^ MAToManyScalarRelationDescription
]

{ #category : #private }
MAToManyScalarRelationDescriptionTest >> includedInstance [
	^ Array with: '1' with: '2'
]

{ #category : #running }
MAToManyScalarRelationDescriptionTest >> setUp [
	super setUp.
	self description
		reference: (MAStringDescription new
			accessor: MANullAccessor new;
			yourself);
		classes: (Array with: String)
]
