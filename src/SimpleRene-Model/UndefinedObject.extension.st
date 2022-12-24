Extension { #name : #UndefinedObject }

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> asSimpleReneAccessor [
	^ SRNullAccessor new
]

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> simpleReneDescription [
	^ SRContainer new
]

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> simpleReneLabel [
	^ 'n/a'
]
