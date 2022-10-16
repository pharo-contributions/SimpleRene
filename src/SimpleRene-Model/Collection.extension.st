Extension { #name : #Collection }

{ #category : #'*SimpleRene-Model' }
Collection >> asMultilineString [
	^ String streamContents: [ :stream |
		self
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: Character cr ] ]
]

{ #category : #'*SimpleRene-Model' }
Collection >> copyWithAll: aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #'*SimpleRene-Model' }
Collection >> copyWithoutFirst: anObject [
	| done |
	done := false.
	^ self reject: [ :each |
		(each = anObject
			and: [ done not ])
				and: [ done := true ] ]
]

{ #category : #'*SimpleRene-Model' }
Collection >> copyWithoutFirstOccurrenceOf: anObject [
	| done |
	done := false.
	^ self reject: [ :each |
		each = anObject
			and: [ done not
			and: [ done := true ] ] ]
]

{ #category : #'*SimpleRene-Model-dynopt' }
Collection >> maAllOptionsFor: aDescription [
	^ aDescription prepareOptions: self copy
]

{ #category : #'*SimpleRene-Model' }
Collection >> maSelectMatching: aString [ 
	^ self select: [ :e | e asString startsWith: aString ]
]
