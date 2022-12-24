Class {
	#name : #SRFileDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRFileDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRFileDescriptionTest >> actualClass [
	^ SRFileDescription
]

{ #category : #private }
SRFileDescriptionTest >> includedInstance [
	^ SRMemoryFileModel new
		contents: 'Lukas Renggli';
		filename: 'author.txt';
		yourself
]

{ #category : #private }
SRFileDescriptionTest >> shouldSkipStringTests [
	^ true
]

{ #category : #'tests-accessing' }
SRFileDescriptionTest >> testKind [
	super testKind.
	self description kind: SRFileModelStub.
	self assert: self description kind = SRFileModelStub
]
