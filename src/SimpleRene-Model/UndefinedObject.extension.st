Extension { #name : #UndefinedObject }

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> asSimpleReneAccessor [
	^ MANullAccessor new
]

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> simpleReneDescription [
	^ MAContainer new
]

{ #category : #'*SimpleRene-Model' }
UndefinedObject >> simpleReneLabel [
	^ 'n/a'
]
