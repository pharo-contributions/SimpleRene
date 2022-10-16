Extension { #name : #Symbol }

{ #category : #'*SimpleRene-Model-converting' }
Symbol >> asAccessor [
	^ MASelectorAccessor selector: self
]

{ #category : #'*SimpleRene-Model' }
Symbol >> cull: receiverObject cull: argumentObject [ 
	^ receiverObject perform: self withEnoughArguments: { argumentObject }
]

{ #category : #'*SimpleRene-Model' }
Symbol >> optionFor: anObject ifPresent: aBlock [
	aBlock value: (anObject perform: self)
]
