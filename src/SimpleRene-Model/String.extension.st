Extension { #name : 'String' }

{ #category : '*SimpleRene-Model' }
String >> simpleReneMatches: aString [
	aString isEmpty ifTrue: [ ^ true ].
	^ (aString includesAnyOf: '*#')
		ifTrue: [ aString match: self ]
		ifFalse: [ self includesSubstring: aString caseSensitive: false ]
]

{ #category : '*SimpleRene-Model' }
String >> simpleReneNormalizeCamelCase [

	^ self class streamContents: [ :out |
		self do: [ :e |
			| isNewWord |
			isNewWord := e isUppercase and: [ out position > 0 and: [ out peekLast isUppercase not ] ].
			isNewWord ifTrue: [ out nextPut: Character space ].
			out nextPut: e ] ]
]
