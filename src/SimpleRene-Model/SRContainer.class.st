"
I am a container holding a collection of descriptions, all instances of subclasses of *MAElementDescription*. I keep my children within an ==OrderedCollection==, but I don't sort them according to their priority.

I fully support the collection protocol: descriptions can be added and removed. Moreover I implement most enumeration methods, so that users are able to iterate (==do:==), filter (==select:==, ==reject:==), transform (==collect:==), extract (==detect:==, ==detect:ifNone:==), and test (==allSatisfy:==, ==anySatisfy:==, ==noneSatisfy:==) my elements.
"
Class {
	#name : 'SRContainer',
	#superclass : 'SRDescription',
	#instVars : [
		'children'
	],
	#category : 'SimpleRene-Model-Description',
	#package : 'SimpleRene-Model',
	#tag : 'Description'
}

{ #category : 'accessing-defaults' }
SRContainer class >> defaultAccessor [
	^ SRIdentityAccessor new
]

{ #category : 'accessing-defaults' }
SRContainer class >> defaultCollection [
	^ OrderedCollection new
]

{ #category : 'testing' }
SRContainer class >> isAbstract [
	^ false
]

{ #category : 'example support' }
SRContainer class >> samplePersonDescription [
	^ SRPriorityContainer
		withAll:
			{(SRStringDescription new
				accessor: (SRDictionaryAccessor key: #name);
				yourself).
			(SRStringDescription new
				accessor: (SRDictionaryAccessor key: #birthplace);
				yourself)}
]

{ #category : 'example support' }
SRContainer class >> samplePersonDumbledore [
	^ {
			#name ->'Albus Percival Wulfric Brian Dumbledore'.
			#birthplace -> 'Godric''s Hollow' } asDictionary
]

{ #category : 'example support' }
SRContainer class >> samplePersonHarryPotter [
	^ {
			#name ->'Harry Potter'.
			#birthplace -> 'Godric''s Hollow' } asDictionary
]

{ #category : 'instance creation' }
SRContainer class >> with: aDescription [
	^ self new
		add: aDescription;
		yourself
]

{ #category : 'instance creation' }
SRContainer class >> withAll: aCollection [
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : 'comparing' }
SRContainer >> = anObject [
	^ super = anObject
		and: [ self children = anObject children ]
]

{ #category : 'visiting' }
SRContainer >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitContainer: self
]

{ #category : 'adding' }
SRContainer >> add: aDescription [
	self children add: aDescription
]

{ #category : 'adding' }
SRContainer >> addAll: aCollection [
	self children addAll: aCollection
]

{ #category : 'enumerating' }
SRContainer >> allSatisfy: aBlock [
	^ self children allSatisfy: aBlock
]

{ #category : 'enumerating' }
SRContainer >> anySatisfy: aBlock [
	^ self children anySatisfy: aBlock
]

{ #category : 'converting' }
SRContainer >> asContainer [
	^ self
]

{ #category : 'accessing' }
SRContainer >> at: anIndex [
	^ self children at: anIndex
]

{ #category : 'accessing' }
SRContainer >> at: anIndex ifAbsent: aBlock [
	^ self children at: anIndex ifAbsent: aBlock
]

{ #category : 'accessing' }
SRContainer >> children [
	^ children
]

{ #category : 'enumerating' }
SRContainer >> collect: aBlock [
	^ self copy
		setChildren: (self children collect: aBlock);
		yourself
]

{ #category : 'copying' }
SRContainer >> copyEmpty [
	^ self copy
		setChildren: self class defaultCollection;
		yourself
]

{ #category : 'copying' }
SRContainer >> copyFrom: aStartIndex to: anEndIndex [
	^ self copy
		setChildren: (self children
			copyFrom: aStartIndex
			to: anEndIndex);
		yourself
]

{ #category : 'copying' }
SRContainer >> copyWithout: anObject [
	^self reject: [:each | each = anObject]
]

{ #category : 'copying' }
SRContainer >> copyWithoutAll: aCollection [
	^self reject: [:each | aCollection includes: each]
]

{ #category : 'builder' }
SRContainer >> descriptionBuilder [
	^self propertyAt: #descriptionBuilder ifAbsent: [ nil ]
]

{ #category : 'builder' }
SRContainer >> descriptionBuilder: aBuilderClass [
	self propertyAt: #descriptionBuilder put: aBuilderClass
]

{ #category : 'builder' }
SRContainer >> descriptionBuilders [
	^self propertyAt: #descriptionBuilders ifAbsent: [ #() ]
]

{ #category : 'builder' }
SRContainer >> descriptionBuilders: aList [ 
	self descriptionBuilder: SRComposedDescriptionBuilder.
	self propertyAt: #descriptionBuilders put: aList
]

{ #category : 'acessing-magritte' }
SRContainer >> descriptionChildren [
	<simpleReneDescription>
	^ SRToManyRelationDescription new
		accessor: (SRSelectorAccessor read: #children write: #setChildren:);
		classes: SRElementDescription withAllConcreteClasses;
		default: self class defaultCollection;
		label: 'Elements';
		priority: 400;
		beOrdered;
		yourself
]

{ #category : 'acessing-magritte' }
SRContainer >> descriptionDefault [
	<simpleReneDescription>
	^ nil
]

{ #category : 'enumerating' }
SRContainer >> detect: aBlock [
	^ self children detect: aBlock
]

{ #category : 'enumerating' }
SRContainer >> detect: aBlock ifNone: anExceptionBlock [
	^ self children detect: aBlock ifNone: anExceptionBlock
]

{ #category : 'enumerating' }
SRContainer >> do: aBlock [
	self children do: aBlock
]

{ #category : 'enumerating' }
SRContainer >> do: aBlock separatedBy: aSeparatorBlock [
	self children do: aBlock separatedBy: aSeparatorBlock
]

{ #category : 'private' }
SRContainer >> errorNotFound: aDescription [
	self error: aDescription class label , ' not found.'
]

{ #category : 'testing' }
SRContainer >> hasChildren [
	^ self notEmpty
]

{ #category : 'comparing' }
SRContainer >> hash [
	^ super hash bitXor: self children hash
]

{ #category : 'testing' }
SRContainer >> includes: aDescription [
	^ self children includes: aDescription
]

{ #category : 'initialization' }
SRContainer >> initialize [
	super initialize.
	self setChildren: self class defaultCollection
]

{ #category : 'enumerating' }
SRContainer >> inject: anObject into: aBlock [
	^ self children inject: anObject into: aBlock
]

{ #category : 'enumerating' }
SRContainer >> intersection: aCollection [
	^ self copy
		setChildren: (self children intersection: aCollection);
		yourself
]

{ #category : 'testing' }
SRContainer >> isContainer [
	^ true
]

{ #category : 'testing' }
SRContainer >> isEmpty [
	^ self children isEmpty
]

{ #category : 'enumerating' }
SRContainer >> keysAndValuesDo: aBlock [
	self children keysAndValuesDo: aBlock
]

{ #category : 'enumerating' }
SRContainer >> noneSatisfy: aBlock [
	^ self children noneSatisfy: aBlock
]

{ #category : 'testing' }
SRContainer >> notEmpty [
	^ self children notEmpty
]

{ #category : 'copying' }
SRContainer >> postCopy [
	super postCopy.
	self setChildren: self children copy
]

{ #category : 'accessing' }
SRContainer >> print: anObject on: aStream [
	"Print the current values of all anObject's described fields. Customize the printing of a field with the #maPrintString property, which should store a valuable with the value of the field as an optional argument"
	self
		do: [ :d | 
			| value |
			value := d read: anObject.
			value ifNotNil: [ | stringValue |
				stringValue := d
					propertyAt: #maPrintString
					ifPresent: [ :map | map cull: value ]
					ifAbsent: [ d toString: value ].
				aStream nextPutAll: stringValue ] ]
		separatedBy: [ aStream space ]
]

{ #category : 'enumerating' }
SRContainer >> reject: aBlock [
	^ self copy
		setChildren: (self children reject: aBlock);
		yourself
]

{ #category : 'removing' }
SRContainer >> remove: aDescription [
	self children remove: aDescription ifAbsent: [ self errorNotFound: aDescription ]
]

{ #category : 'removing' }
SRContainer >> removeAll [
	self setChildren: self class defaultCollection
]

{ #category : 'enumerating' }
SRContainer >> select: aBlock [
	^ self copy
		setChildren: (self children select: aBlock);
		yourself
]

{ #category : 'initialization' }
SRContainer >> setChildren: aCollection [
	children := aCollection
]

{ #category : 'moving' }
SRContainer >> simpleReneMoveDown: aDescription [
	self children simpleReneMoveDown: aDescription
]

{ #category : 'moving' }
SRContainer >> simpleReneMoveUp: aDescription [
	self children simpleReneMoveUp: aDescription
]

{ #category : 'accessing' }
SRContainer >> simpleReneTemplate [
	^ self
]

{ #category : 'accessing' }
SRContainer >> size [
	^ self children size
]

{ #category : 'enumerating' }
SRContainer >> union: aContainer [
	^ self copy
		addAll: (aContainer reject: [ :each | self includes: each ]);
		yourself
]

{ #category : 'enumerating' }
SRContainer >> with: aCollection do: aBlock [
	self children with: aCollection do: aBlock
]
