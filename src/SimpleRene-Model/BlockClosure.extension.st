Extension { #name : 'BlockClosure' }

{ #category : '*SimpleRene-Model' }
BlockClosure >> simpleReneOptionFor: anObject ifPresent: aBlock [
	aBlock value: (self cull: anObject)
]
