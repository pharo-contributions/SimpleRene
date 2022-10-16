Extension { #name : #BlockClosure }

{ #category : #'*SimpleRene-Model' }
BlockClosure >> optionFor: anObject ifPresent: aBlock [
	aBlock value: (self cull: anObject)
]
