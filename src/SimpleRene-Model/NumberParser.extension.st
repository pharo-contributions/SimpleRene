Extension { #name : #NumberParser }

{ #category : #'*SimpleRene-Model' }
NumberParser class >> isValidNumber: aStringOrStream [
	| stream parser |
	stream := aStringOrStream readStream.
	parser := (Smalltalk at: #ExtendedNumberParser ifAbsent: [self]).
	parser parse: stream onError: [ ^ false ].
	^ stream atEnd
]
