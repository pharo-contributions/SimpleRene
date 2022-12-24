Class {
	#name : #SRContainerTest,
	#superclass : #SRDescriptionTest,
	#instVars : [
		'child1',
		'child2',
		'child3'
	],
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRContainerTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRContainerTest >> actualClass [
	^ SRContainer
]

{ #category : #accessing }
SRContainerTest >> child1 [
	^ child1 ifNil: 
		[ child1 := SRStringDescription new
			accessor: #child1;
			label: 'child1';
			priority: 1;
			yourself ]
]

{ #category : #accessing }
SRContainerTest >> child2 [
	^ child2 ifNil: 
		[ child2 := SRStringDescription new
			accessor: #child2;
			label: 'child2';
			priority: 2;
			yourself ]
]

{ #category : #accessing }
SRContainerTest >> child3 [
	^ child3 ifNil: 
		[ child3 := SRStringDescription new
			accessor: #child3;
			label: 'child3';
			priority: 3;
			yourself ]
]

{ #category : #private }
SRContainerTest >> exampleInstance [
	^ SRCachedMemento new
		setDescription: self description;
		setCache: (Dictionary new
			at: self child1 put: nil;
			at: self child2 put: nil;
			at: self child3 put: nil;
			yourself);
		yourself
]

{ #category : #'tests-adding' }
SRContainerTest >> testAdd [
	self description add: self child1.
	self assert: (self description size = 1).
	self assert: (self description includes: self child1).

	self description add: self child2.
	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)
]

{ #category : #'tests-adding' }
SRContainerTest >> testAddAll [
	self description
		addAll: (Array with: self child1 with: self child2).

	self assert: (self description size = 2).
	self assert: (self description includes: self child1).
	self assert: (self description includes: self child2)
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testAllSatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description allSatisfy: [ :each | each = self child1 or: [ each = self child2 ] ]).
	self deny: (self description allSatisfy: [ :each | each = self child1 ])
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testAnySatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description anySatisfy: [ :each | each = self child2 ]).
	self deny: (self description anySatisfy: [ :each | each isNil ])
]

{ #category : #'tests-converting' }
SRContainerTest >> testAsContainer [
	self assert: self description asContainer = self description.
	self assert: self description asContainer == self description
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testAt [
	self description add: self child1; add: self child2.
	self assert: (self description at: 1) = self child1.
	self assert: (self description at: 2) = self child2.
	self should: [ self description at: 3 ] raise: Error
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testAtIfAbsent [
	self description add: self child1; add: self child2.
	self assert: (self description at: 1 ifAbsent: [ 'not' ]) = self child1.
	self assert: (self description at: 2 ifAbsent: [ 'not' ]) = self child2.
	self assert: (self description at: 3 ifAbsent: [ 'not' ]) = 'not'
]

{ #category : #'tests-accessing' }
SRContainerTest >> testChildren [
	self assert: self description children isCollection.
	self assert: self description children isEmpty
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testCollect [
	| collected |
	self description add: self child1; add: self child2.
	collected := self description collect: [ :each | each ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each | each copy ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each |
		each copy
			accessor: (SRSelectorAccessor selector: #foo);
			yourself ].
	self deny: self description = collected.
	self deny: self description == collected
]

{ #category : #'tests-operators' }
SRContainerTest >> testConcatenate [
	| concatenate |
	concatenate := self child1 , self child2.
	self assert: concatenate size = 2.
	self assert: concatenate children first = self child1.
	self assert: concatenate children second = self child2.

	concatenate := self child1 , self child2 , self child3.
	self assert: concatenate size = 3.
	self assert: concatenate children first = self child1.
	self assert: concatenate children second = self child2.
	self assert: concatenate children third = self child3
]

{ #category : #'tests-copying' }
SRContainerTest >> testCopy [
	self description add: self child1; add: self child2.
	super testCopy.

	self deny: self description copy children == self description children.
	self assert: self description copy children first = self description children first.
	self assert: self description copy children second = self description children second
]

{ #category : #'tests-copying' }
SRContainerTest >> testCopyEmpty [
	self description add: self child1; add: self child2.
	self assert: self description copyEmpty isEmpty
]

{ #category : #'tests-copying' }
SRContainerTest >> testCopyFromTo [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyFrom: 2 to: 3.

	self assert: copied ~= self description.

	self assert: copied size = 2.
	self assert: copied children first = self child2.
	self assert: copied children second = self child3
]

{ #category : #'tests-copying' }
SRContainerTest >> testCopyWithout [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithout: self child1.

	self assert: copied ~= self description.

	self assert: copied size = 2.
	self assert: copied children first = self child2.
	self assert: copied children second = self child3
]

{ #category : #'tests-copying' }
SRContainerTest >> testCopyWithoutAll [
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithoutAll: (Array with: self child1 with: self child3).

	self assert: copied ~= self description.

	self assert: copied size = 1.
	self assert: copied children first = self child2
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testDetect [
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]) = self child1.
	self should: [ self description
		detect: [ :each | self child2 = each ] ] raise: Error
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testDetectIfNone [
	self description add: self child1.
	self assert: (self description
		detect: [ :each | self child1 = each ]
		ifNone: [ 123 ]) = self child1.
	self assert: (self description
		detect: [ :each | self child2 = each ]
		ifNone: [ 123 ]) = 123
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testDo [
	| collection children |
	collection := self description class defaultCollection.
	self description add: self child1; add: self child2.
	self description do: [ :each | collection add: each ].
	children := self description children.
	self assert: children size = collection size.
	1 to: collection size do: [ :index |
		self assert: (children at: index) = (collection at: index) ]
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testDoSepratedBy [
	| collection |
	collection := OrderedCollection new.
	self description add: self child1; add: self child2.
	self description
		do: [ :each | collection add: each ]
		separatedBy: [ collection add: nil ].
	self assert: collection size = 3.
	self assert: collection first = self child1.
	self assert: collection second isNil.
	self assert: collection third = self child2
]

{ #category : #'tests-testing' }
SRContainerTest >> testEmpty [
	self assert: self description isEmpty.
	self description add: self child1.
	self deny: self description isEmpty
]

{ #category : #'tests-testing' }
SRContainerTest >> testHasChildren [
	super testHasChildren.
	self description add: self child1.
	self assert: self description hasChildren
]

{ #category : #'tests-testing' }
SRContainerTest >> testIncludes [
	self deny: (self description includes: self child1).
	self description add: self child1.
	self assert: (self description includes: self child1)
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testInjectInto [
	self description add: self child1; add: self child2.
	self assert: (self description
		inject: 'start'
		into: [ :result :each | result , ' ' , each label ]) = 'start child1 child2'
]

{ #category : #'tests-operators' }
SRContainerTest >> testIntersection [
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a intersection: b.

	self assert: (union size) = 1.
	self deny: (union includes: self child1).
	self assert: (union includes: self child2).
	self deny: (union includes: self child3)
]

{ #category : #'tests-testing' }
SRContainerTest >> testIsContainer [
	self assert: self description isContainer
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testKeysAndValuesDo [
	self description
		add: self child1;
		add: self child2.
	self description keysAndValuesDo: 
		[ :index :each | 
		index = 1 
			ifTrue: [ self assert: self child1 = each ]
			ifFalse: 
				[ index = 2 
					ifTrue: [ self assert: self child2 = each ]
					ifFalse: [ self assert: false ] ] ]
]

{ #category : #'tests-moving' }
SRContainerTest >> testMoveDown [
	self description add: self child1; add: self child2.
	self assert: self description children first = self child1.
	self assert: self description children second = self child2.

	self description simpleReneMoveDown: self child1.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1.

	self description simpleReneMoveDown: self child1.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1
]

{ #category : #'tests-moving' }
SRContainerTest >> testMoveUp [
	self description add: self child1; add: self child2.
	self assert: self description children first = self child1.
	self assert: self description children second = self child2.

	self description simpleReneMoveUp: self child2.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1.

	self description simpleReneMoveUp: self child2.
	self assert: self description children first = self child2.
	self assert: self description children second = self child1
]

{ #category : #'tests-validating' }
SRContainerTest >> testNoFailingValidation [
	| example |
	self description
		add: self child1;
		add: self child2.
	example := self exampleInstance.
	self
		shouldnt: [ example validate ]
		raise: SRValidationError
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testNoneSatisfy [
	self description add: self child1; add: self child2.
	self assert: (self description noneSatisfy: [ :each | each isNil ])
]

{ #category : #'tests-testing' }
SRContainerTest >> testNotEmpty [
	self deny: self description notEmpty.
	self description add: self child1.
	self assert: self description notEmpty
]

{ #category : #'tests-validating' }
SRContainerTest >> testOneFailingValidation [
	| example |
	self description
		add: self child1;
		add: (self child2
			addCondition: [ :v | false ];
			beRequired;
			yourself).
	example := self exampleInstance.

	self
		should: [ example validate ]
		raise: SRValidationError.
	[ example validate ]
		on: SRValidationError
		do: [ :err |
			self assert: err class = SRMultipleErrors.
			self assert: err tag = self description.
			self assert: err collection size = 1.
			self assert: err collection first tag = self child2 ]
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testReject [
	| rejected |
	self description add: self child1; add: self child2.

	rejected := self description reject: [ :each | false ].
	self assert: self description = rejected.

	rejected := self description reject: [ :each | true ].
	self assert: rejected isEmpty
]

{ #category : #'tests-removing' }
SRContainerTest >> testRemove [
	self description add: self child1; add: self child2.

	self description remove: self child1.
	self assert: self description size = 1.
	self deny: (self description includes: self child1).
	self assert: (self description includes: self child2).

	self description remove: self child2.
	self assert: self description isEmpty
]

{ #category : #'tests-removing' }
SRContainerTest >> testRemoveAll [
	self description add: self child1; add: self child2.

	self description removeAll.
	self assert: self description isEmpty
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testSelect [
	| selected |
	self description add: self child1; add: self child2.

	selected := self description select: [ :each | true ].
	self assert: self description = selected.

	selected := self description select: [ :each | false ].
	self assert: selected isEmpty
]

{ #category : #'tests-accessing' }
SRContainerTest >> testSize [
	self assert: self description size isZero.
	self description add: self child1.
	self assert: self description size = 1.
	self description add: self child2.
	self assert: self description size = 2.
	self description add: self child3.
	self assert: self description size = 3
]

{ #category : #'tests-validating' }
SRContainerTest >> testTwoFailingValidation [
	| example |
	self description
		add: (self child1
			addCondition: [ :v | false ];
			beRequired;
			yourself);
		add: (self child2
			addCondition: [ :v | false ];
			beRequired;
			yourself).
	example := self exampleInstance.

	self
		should: [ example validate ]
		raise: SRValidationError.
	[ example validate ]
		on: SRValidationError
		do: [ :err |
			self assert: err class = SRMultipleErrors.
			self assert: err tag = self description.
			self assert: err collection size = 2.
			self assert: err collection first tag = self child1.
			self assert: err collection last tag = self child2 ]
]

{ #category : #'tests-operators' }
SRContainerTest >> testUnion [
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a union: b.

	self assert: (union size) = 3.
	self assert: (union includes: self child1).
	self assert: (union includes: self child2).
	self assert: (union includes: self child3)
]

{ #category : #'tests-enumerating' }
SRContainerTest >> testWithDo [
	self description add: self child1; add: self child2.
	self description with: self description children
		do: [ :first :second | self assert: first = second ]
]
