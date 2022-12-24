Extension { #name : #NumberParser }

{ #category : #'*SimpleRene-Model' }
NumberParser class >> isSimpleReneValidNumber: aStringOrStream [
	| stream |
	stream := aStringOrStream readStream.
	self parse: stream onError: [ ^ false ].
	^ stream atEnd
]
