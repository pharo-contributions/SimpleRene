Extension { #name : #Object }

{ #category : #'*SimpleRene-Model-accessing' }
Object >> basicMagritteDescription [
	^ MAPragmaBuilder for: self
]

{ #category : #'*SimpleRene-Model' }
Object >> descriptionContainer [
	"Return the default description container."
	<magritteContainer>
	^ MAPriorityContainer new
		label: self class label;
		yourself
]

{ #category : #'*SimpleRene-Model-model' }
Object >> initializeMagritte [
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadOnly
			ifFalse: [ self write: each default using: each ] ]
]

{ #category : #'*SimpleRene-Model-testing' }
Object >> isDescription [
	^ false
]

{ #category : #'*SimpleRene-Model' }
Object >> isSameAs: rhs [
	^ self isSameAs: rhs using: [ self magritteDescription ]
]

{ #category : #'*SimpleRene-Model' }
Object >> isSameAs: rhs using: valuableDescription [
	"Use #isSameAs: unless you need to cache the description for efficiency.
	CAUTION: this may not work if the description depends on the instance e.g. uses `self` in a block
	(See comment below for more details)"
	^ valuableDescription value allSatisfy: [ :desc |
			| myVal rhsVal |
			(desc accessor canRead: rhs)
				ifFalse: [ false ]
				ifTrue: [
					myVal := desc read: self.
					rhsVal := desc read: rhs.
					({ nil. desc default } includesAll: { myVal. rhsVal })
						ifTrue: [ true ]
						ifFalse: [ myVal = rhsVal ] ] ].
	"Motivation: We cache the description because profiling on a large dataset (120,000 records) showed about 66% of processing time was spent (re)building it"
]

{ #category : #'*SimpleRene-Model' }
Object >> maHash [
	^ self maHashUsing: [ self magritteDescription ]
]

{ #category : #'*SimpleRene-Model' }
Object >> maHashUsing: valuabledescription [
	"See isSameAs:using: comments"
	^ valuabledescription value children 
			inject: 0 hash 
			into: [ :hash :desc | hash bitXor: (desc read: self) hash ]
]

{ #category : #'*SimpleRene-Model' }
Object >> maLazyInstVarUsing: description [
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self instVarNamed: description accessor readSelector.
	^ description lazilyInitializeFrom: currentValue for: self.
]

{ #category : #'*SimpleRene-Model' }
Object >> maValidate [
	^ self magritteDescription validate: self
]

{ #category : #'*SimpleRene-Model-builder' }
Object >> magritteActions [
	^ (MAActionPragmaBuilder for: self) children
]

{ #category : #'*SimpleRene-Model-builder' }
Object >> magritteDescription [
	
	^  self basicMagritteDescription.

]

{ #category : #'*SimpleRene-Model-description' }
Object class >> magritteTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : #'*SimpleRene-Model' }
Object >> mementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ MACheckedMemento
]

{ #category : #'*SimpleRene-Model' }
Object >> readUsing: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	| result |
	result := aDescription accessor read: self.
	^ result ifNil: [ aDescription undefinedValue ]
]

{ #category : #'*SimpleRene-Model' }
Object >> write: anObject using: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	aDescription accessor write: anObject to: self
]
