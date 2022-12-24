Extension { #name : #Collection }

{ #category : #'*SimpleRene-Model-dynopt' }
Collection >> simpleReneAllOptionsFor: aDescription [
	^ aDescription prepareOptions: self copy
]

{ #category : #'*SimpleRene-Model' }
Collection >> simpleReneAsMultilineString [
	^ String streamContents: [ :stream |
		self
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: Character cr ] ]
]

{ #category : #'*SimpleRene-Model' }
Collection >> simpleReneCopyWithAll: aCollection [
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #'*SimpleRene-Model' }
Collection >> simpleReneSelectMatching: aString [ 
	^ self select: [ :e | e asString beginsWith: aString ]
]
