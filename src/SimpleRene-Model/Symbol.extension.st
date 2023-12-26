Extension { #name : 'Symbol' }

{ #category : '*SimpleRene-Model-converting' }
Symbol >> asSimpleReneAccessor [
	^ SRSelectorAccessor selector: self
]

{ #category : '*SimpleRene-Model' }
Symbol >> cull: receiverObject cull: argumentObject [ 
	^ receiverObject perform: self withEnoughArguments: { argumentObject }
]

{ #category : '*SimpleRene-Model' }
Symbol >> simpleReneOptionFor: anObject ifPresent: aBlock [
	aBlock value: (anObject perform: self)
]
