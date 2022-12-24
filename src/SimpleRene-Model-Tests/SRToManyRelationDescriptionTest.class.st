Class {
	#name : #SRToManyRelationDescriptionTest,
	#superclass : #SRRelationDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRToManyRelationDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRToManyRelationDescriptionTest >> actualClass [
	^ SRToManyRelationDescription
]

{ #category : #private }
SRToManyRelationDescriptionTest >> includedInstance [
	^ Array with: self addressInstance1 with: self addressInstance2
]

{ #category : #'tests-properties' }
SRToManyRelationDescriptionTest >> testDefinitive [
	self description beDefinitive.
	self assert: self description isDefinitive.
	self assert: self description definitive.

	self description beModifiable.
	self deny: self description isDefinitive.
	self deny: self description definitive
]

{ #category : #'tests-properties' }
SRToManyRelationDescriptionTest >> testOrdered [
	self description beOrdered.
	self assert: self description isOrdered.
	self assert: self description ordered.

	self description beUnordered.
	self deny: self description isOrdered.
	self deny: self description ordered
]

{ #category : #'tests-properties' }
SRToManyRelationDescriptionTest >> testSorted [
	self description beSorted.
	self assert: self description isSorted.
	self assert: self description sorted.

	self description beUnsorted.
	self deny: self description isSorted.
	self deny: self description sorted
]
