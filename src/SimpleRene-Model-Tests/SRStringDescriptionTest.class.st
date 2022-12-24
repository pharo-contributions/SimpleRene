Class {
	#name : #SRStringDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRStringDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRStringDescriptionTest >> actualClass [
	^ SRStringDescription
]

{ #category : #private }
SRStringDescriptionTest >> includedInstance [
	^ 'Lukas Renggli'
]

{ #category : #tests }
SRStringDescriptionTest >> testDisplay [

	self testDisplay: [ :e | e asString allButLast: 2 ].
	self testDisplay: #asString. "Since #asString is the default behavior, this is only showing an example of the API, not actually testing anything. In real use, you might send e.g. #allButLast"
]

{ #category : #'tests-strings' }
SRStringDescriptionTest >> testFromStringInvalid [
	"There is no invalid string input."
]
