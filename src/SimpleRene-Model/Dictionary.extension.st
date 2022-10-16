Extension { #name : #Dictionary }

{ #category : #'*SimpleRene-Model' }
Dictionary >> optionFor: anObject ifPresent: aBlock [
	self at: anObject ifPresent: aBlock

]
