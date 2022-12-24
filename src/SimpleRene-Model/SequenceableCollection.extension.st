Extension { #name : #SequenceableCollection }

{ #category : #'*SimpleRene-Model' }
SequenceableCollection >> asSimpleReneAccessor [
	^ SRChainAccessor accessors: self
]

{ #category : #'*SimpleRene-Model' }
SequenceableCollection >> simpleReneMoveDown: anObject [
	| first second |
	first := self findFirst: [ :value | value == anObject ].
	second := (first > 0 and: [ first < self size ])
		ifTrue: [ first + 1 ]
		ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second
]

{ #category : #'*SimpleRene-Model' }
SequenceableCollection >> simpleReneMoveUp: anObject [
	| first second |

	first := self findFirst: [ :value | value == anObject ].
	second := first > 1 ifTrue: [ first - 1 ] ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second
]
