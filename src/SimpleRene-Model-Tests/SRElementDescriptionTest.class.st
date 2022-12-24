Class {
	#name : #SRElementDescriptionTest,
	#superclass : #SRDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRElementDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
SRElementDescriptionTest >> actualClass [
	^ SRElementDescription
]

{ #category : #private }
SRElementDescriptionTest >> emptyInstance [
	^ String new
]

{ #category : #private }
SRElementDescriptionTest >> includedInstance [
	self subclassResponsibility
]

{ #category : #private }
SRElementDescriptionTest >> includedInstanceString [
	^ SRStringWriter write: self includedInstance description: self descriptionInstance
]

{ #category : #private }
SRElementDescriptionTest >> invalidInstance [
	^ Object new
]

{ #category : #private }
SRElementDescriptionTest >> invalidInstanceString [
	^ self invalidInstance asString
]

{ #category : #private }
SRElementDescriptionTest >> nonIdenticalInstance [
	^ self includedInstance copy
]

{ #category : #private }
SRElementDescriptionTest >> nullInstance [
	^ nil
]

{ #category : #private }
SRElementDescriptionTest >> shouldSkipStringTests [
	^ false
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testAddCondition [
	self description
		addCondition: [ :value | value isNil ].

	self assert: self description conditions size = 1.
	self assert: self description conditions first value isString
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testAddConditionLabelled [
	self description
		addCondition: [ :value | value isNil ]
		labelled: 'ist net nil'.

	self assert: self description conditions size = 1.
	self assert: self description conditions first value = 'ist net nil'
]

{ #category : #'tests-converting' }
SRElementDescriptionTest >> testAsContainer [
	self assert: (self description asContainer size) = 1.
	self assert: (self description asContainer includes: self description)
]

{ #category : #'tests-operators' }
SRElementDescriptionTest >> testConcatenation [
	| child1 child2 concatenate |
	child1 := self description copy.
	child2 := self description copy.

	concatenate := child1 , child2.
	self assert: concatenate size = 2.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child2.

	concatenate := child1 , concatenate.
	self assert: concatenate size = 3.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child1.
	self assert: concatenate children third = child2
]

{ #category : #'tests-copying' }
SRElementDescriptionTest >> testCopy [
	super testCopy.
	self assert: self description copy default = self description default
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testDefault [
	self description default: self includedInstance.
	self assert: self description default = self includedInstance
]

{ #category : #private }
SRElementDescriptionTest >> testDisplay: aBlockOrSymbol [
	"All MAElementDescription classes should respect #display:, but rather than have a bunch of failing tests, we'll implement as needed"

	self description display: aBlockOrSymbol. 	
	self 
		assert: (description toString: self includedInstance) 
		equals: (aBlockOrSymbol value: self includedInstance).
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testFromString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self includedInstanceString)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader new)
			equals: self includedInstance
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testFromStringCollection [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString))
				= (Array
					with: self includedInstance
					with: self includedInstance).
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString)
		reader: self description stringReader)
				= (Array
					with: self includedInstance
					with: self includedInstance)
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testFromStringEvaluated [
	"This ensures that the parsing algorithm doesn't compile the input, what would cause a  security hole in the framework."

	| error |
	error := nil.
	self shouldSkipStringTests ifTrue: [ ^ self ].
	[ self description fromString: '1 / 0. nil' ]
		on: Exception 
		do: [ :err | error := err ].
	self deny: (error isKindOf: ZeroDivide)
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testFromStringInvalid [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self
		should: [ self description fromString: self invalidInstanceString ]
		raise: SRReadError
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testFromStringNull [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self emptyInstance) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader new) isNil
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testKind [
	self assert: (self includedInstance isKindOf: self description kind)
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testKindErrorMessage [
	self assert: self description kindErrorMessage notEmpty.

	self description kindErrorMessage: 'zork'.
	self assert: self description kindErrorMessage = 'zork'.

	[ self description validateKind: self invalidInstance ]
		on: SRKindError
		do: [ :err | self assert: self description kindErrorMessage = err messageText ]
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testRequiredErrorMessage [
	self assert: self description requiredErrorMessage notEmpty.

	self description requiredErrorMessage: 'zork'.
	self assert: self description requiredErrorMessage = 'zork'.

	[ self description beRequired; validateRequired: self nullInstance ]
		on: SRRequiredError
		do: [ :err | self assert: self description requiredErrorMessage = err messageText ]
]

{ #category : #'tests-testing' }
SRElementDescriptionTest >> testSatisfied [
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self nullInstance).
	self deny: (self description isSatisfiedBy: self invalidInstance)
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testStringReader [
	| object |
	self description stringReader: (object := SRStringReader new).
	self assert: self description stringReader = object
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testStringWriter [
	| object |
	self description stringWriter: (object := SRStringWriter new).
	self assert: self description stringWriter = object
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testToString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self includedInstance)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter new)
			= self includedInstanceString
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testToStringCollection [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance))
				= (Array
					with: self includedInstanceString
					with: self includedInstanceString).
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance)
		writer: self description stringWriter)
			= (Array
				with: self includedInstanceString
				with: self includedInstanceString)
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testToStringFromString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: (self description
			toString: self includedInstance))
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter)
		reader: self description stringReader)
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter new)
		reader: self description stringReader new)
				= self includedInstance
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testToStringNull [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self nullInstance)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= self description undefined
]

{ #category : #'tests-strings' }
SRElementDescriptionTest >> testToStringUndefined [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self description undefined: 'n/a'.
	self assert: (self description
		toString: self nullInstance)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= 'n/a'
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testUndefined [
	self description undefined: 'nop'.
	self assert: self description undefined = 'nop'
]

{ #category : #'tests-accessing' }
SRElementDescriptionTest >> testUndefinedValue [
	self description undefinedValue: 'null'.
	self assert: self description undefinedValue equals: 'null'.
	
	self description accessor: #yourself.
	self assert: (self nullInstance simpleReneReadUsing: self description) equals: 'null'
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidate [
	self description beRequired.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: SRValidationError.
	self
		should: [ self description validate: self invalidInstance ]
		raiseSingle: SRKindError.
	self
		should: [ self description validate: self nullInstance ]
		raiseSingle: SRRequiredError
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidateConditions [
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | object == value ]
		labelled: 'included instance test'.
	self
		shouldnt: [ self description validate: object ]
		raise: SRConditionError.
	self
		should: [ self description validate: self nonIdenticalInstance ]
		raiseSingle: SRConditionError
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidateKind [
	self
		should: [ self description validateKind: self invalidInstance ]
		raise: SRKindError.
	self
		shouldnt: [ self description validateKind: self includedInstance ]
		raise: SRKindError
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidateMultipleFailures [
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | false ] labelled: 'Condition 1';
		addCondition: [ :value | false ] labelled: 'Condition 2'.
	self
		should: [ self description validate: object ]
		raise: SRMultipleErrors
		withExceptionDo: [ :e | self assert: e collection size equals: 2 ]
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidateRequired [
	self description beOptional.
	self
		shouldnt: [ self description validateRequired: self nullInstance ]
		raise: SRRequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: SRRequiredError.

	self description beRequired.
	self
		should: [ self description validateRequired: self nullInstance ]
		raise: SRRequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: SRRequiredError
]

{ #category : #'tests-validation' }
SRElementDescriptionTest >> testValidateSpecific [
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: SRRequiredError
]
