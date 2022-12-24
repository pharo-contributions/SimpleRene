Class {
	#name : #SRDescriptionTest,
	#superclass : #SRObjectTest,
	#instVars : [
		'description'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #testing }
SRDescriptionTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #private }
SRDescriptionTest >> actualClass [
	^ SRDescription
]

{ #category : #'acessing-magritte' }
SRDescriptionTest >> description [
	^ description
]

{ #category : #private }
SRDescriptionTest >> descriptionInstance [
	^ self actualClass new
		accessor: SRNullAccessor new;
		yourself
]

{ #category : #accessing }
SRDescriptionTest >> instance [
	^ description
]

{ #category : #running }
SRDescriptionTest >> setUp [
	super setUp.
	description := self descriptionInstance.
	self assert: description accessor notNil
]

{ #category : #asserting }
SRDescriptionTest >> should: aBlock raiseSingle: aClass [ 
	self should: aBlock raiseSingle: aClass withExceptionDo: [ :e | ]
]

{ #category : #asserting }
SRDescriptionTest >> should: aBlock raiseSingle: aClass withExceptionDo: exceptionBlock [
	self should: aBlock
		raise: SRMultipleErrors
		withExceptionDo: [ :e | 
			self assert: e collection size equals: 1.
			e collection first isKindOf: aClass.
			exceptionBlock value: e collection first ].
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testAccessor [
	self description accessor: (SRSelectorAccessor selector: #foo).
	self assert: self description accessor selector = #foo
]

{ #category : #'tests-converting' }
SRDescriptionTest >> testAsContainer [
	self subclassResponsibility
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testComment [
	self description comment: 'bar'.
	self assert: self description comment = 'bar'
]

{ #category : #'tests-copying' }
SRDescriptionTest >> testCopyAccessor [
	self assert: self description copy accessor = self description accessor.
	self deny: self description copy accessor == self description accessor
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testDefaultLabel [
	self assert: self description label = ''.
	self description accessor: #foo.
	self assert: self description label = 'Foo'
]

{ #category : #'tests-identity' }
SRDescriptionTest >> testDictionaryKey [
	| dictionary |
	dictionary := Dictionary new.

	dictionary at: self instance put: 1.
	self assert: (dictionary at: self instance) = 1.

	dictionary at: self instance put: 2.
	self assert: (dictionary at: self instance) = 2
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testGroup [
	self assert: self description group isNil.
	self description group: 'foo'.
	self assert: self description group = 'foo'
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testHasChildren [
	self deny: self description hasChildren
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testHasComment [
	self description comment: nil.
	self deny: self description hasComment.

	self description comment: ''.
	self deny: self description hasComment.

	self description comment: 'comment'.
	self assert:  self description hasComment
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testHasLabel [
	self description label: nil.
	self deny: self description hasLabel.

	self description label: ''.
	self deny: self description hasLabel.

	self description label: 'label'.
	self assert:  self description hasLabel
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testIsContainer [
	self deny: self description isContainer
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testIsDescription [
	self assert: self description isSimpleReneDescription
]

{ #category : #'tests-testing' }
SRDescriptionTest >> testIsSortable [
	self assert: (self description isSortable or: [ self description isSortable not ])
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testLabel [
	self description label: 'foo'.
	self assert: self description label = 'foo'
]

{ #category : #'tests-accessing' }
SRDescriptionTest >> testPriority [
	self description priority: 123.
	self assert: self description priority = 123
]

{ #category : #'tests-actions' }
SRDescriptionTest >> testReadOnly [
	self description beReadOnly.
	self assert: self description readOnly.
	self assert: self description isReadOnly.

	self description beWriteable.
	self deny: self description readOnly.
	self deny: self description isReadOnly
]

{ #category : #'tests-actions' }
SRDescriptionTest >> testRequired [
	self description beRequired.
	self assert: self description required.
	self assert: self description isRequired.

	self description beOptional.
	self deny: self description required.
	self deny: self description isRequired
]

{ #category : #'tests-identity' }
SRDescriptionTest >> testSetElement [
	| set |
	set := Set new.

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance).

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance)
]

{ #category : #'tests-actions' }
SRDescriptionTest >> testVisible [
	self description beHidden.
	self deny: self description visible.
	self deny: self description isVisible.

	self description beVisible.
	self assert: self description visible.
	self assert: self description isVisible
]
