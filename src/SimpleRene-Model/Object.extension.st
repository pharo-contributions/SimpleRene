Extension { #name : #Object }

{ #category : #'*SimpleRene-Model-accessing' }
Object >> basicSimpleReneDescription [
	^ SRPragmaBuilder for: self
]

{ #category : #'*SimpleRene-Model-model' }
Object >> initializeSimpleRene [
	"Initializes the receiving object with the default values of its description."

	self simpleReneDescription do: [ :each |
		each isReadOnly
			ifFalse: [ self simpleReneWrite: each default using: each ] ]
]

{ #category : #'*SimpleRene-Model-testing' }
Object >> isSimpleReneDescription [
	^ false
]

{ #category : #'*SimpleRene-Model' }
Object >> isSimpleReneSameAs: rhs [
	^ self isSimpleReneSameAs: rhs using: [ self simpleReneDescription ]
]

{ #category : #'*SimpleRene-Model' }
Object >> isSimpleReneSameAs: rhs using: valuableDescription [
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

{ #category : #'*SimpleRene-Model-builder' }
Object >> simpleReneActions [
	^ (SRActionPragmaBuilder for: self) children
]

{ #category : #'*SimpleRene-Model-builder' }
Object >> simpleReneDescription [
	
	^  self basicSimpleReneDescription

]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneDescriptionContainer [

	"Return the default description container."

	<simpleReneContainer>
	^ SRPriorityContainer new
		  label: self class simpleReneLabel;
		  yourself
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneHash [
	^ self simpleReneHashUsing: [ self simpleReneDescription ]
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneHashUsing: valuabledescription [
	"See isSameAs:using: comments"
	^ valuabledescription value children 
			inject: 0 hash 
			into: [ :hash :desc | hash bitXor: (desc read: self) hash ]
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneLazyInstVarUsing: description [
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self instVarNamed: description accessor readSelector.
	^ description lazilyInitializeFrom: currentValue for: self.
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneMementoClass [
	"Return a class to be used to remember or cache the receiver, namely a memento object."

	^ SRCheckedMemento
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneReadUsing: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	| result |
	result := aDescription accessor read: self.
	^ result ifNil: [ aDescription undefinedValue ]
]

{ #category : #'*SimpleRene-Model-description' }
Object class >> simpleReneTemplate [
	"Allow subclasses to have a prototype instance for creating a Magritte description (especially reference description)."
	^self new
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneValidate [
	^ self simpleReneDescription validate: self
]

{ #category : #'*SimpleRene-Model' }
Object >> simpleReneWrite: anObject using: aDescription [
	"This hook is needed so that e.g. mementos and adaptive models can implement their own behavior. All other entry points e.g. MADescription>>#read: should come through here"

	aDescription accessor write: anObject to: self
]
