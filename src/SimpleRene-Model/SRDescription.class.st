"
I am the root of the description hierarchy in Magritte and I provide most of the basic properties available to all descriptions. If you would like to annotate your model with a description have a look at the different subclasses of myself.

!Example
If your model has an instance variable called ==title== that should be used to store the title of the object, you could add the following description to your class:

=Document class>>descriptionTitle
=	^ MAStringDescription new
=		autoAccessor: #title;
=		label: 'Title';
=		priority: 20;
=		beRequired;
=		yourself.

The selector ==#title== is the name of the accessor method used by Magritte to retrieve the value from the model. In the above case Magritte creates the accessor method and the instance variable automatically, if necessary. The label is used to give the field a name and will be printed next to the input box if a visual GUI is created from this description.

The write-accessor is automatically deduced by adding a colon to the read-selector, in this example ==#title:==. You can specify your own accessor strategy using one of the subclasses of ==*MAAccessor*==. If you have multiple description within the same object, the ==#priority:== field is used to order them. Assign a low priority to have descriptions traversed first.
"
Class {
	#name : #SRDescription,
	#superclass : #SRObject,
	#instVars : [
		'accessor'
	],
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRDescription class >> defaultAccessor [
	^ SRNullAccessor new
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultComment [
	^ nil
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultConditions [
	^ Array new
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultDefault [
	^ nil
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultDisplayProperty [
	^ #asString
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultGroup [
	^ nil
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultKind [
	^ Object
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultLabel [
	^ String new
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultPersistent [
	^ true
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultPriority [
	^ 0
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultReadOnly [
	^ false
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultRequired [
	^ false
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultShouldCacheDefault [
	^ false
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultStringReader [
	^ SRStringReader
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultStringWriter [
	^ SRStringWriter
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultUndefined [
	^ String new
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultUndefinedValue [
	^ nil
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultValidator [
	^ SRValidatorVisitor
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultVisible [
	^ true
]

{ #category : #'accessing-defaults' }
SRDescription class >> defaultVisibleInReport [
	^true
]

{ #category : #'accessing-examples' }
SRDescription class >> grouping [
	^ SRDescriptionHolder groupOf: self
]

{ #category : #operators }
SRDescription >> , aDescription [
	"Concatenate the receiver and ==aDescription== to one composed description. Answer a description container containing both descriptions."

	^ self asContainer copy
		addAll: aDescription asContainer;
		yourself
]

{ #category : #operators }
SRDescription >> <= anObject [
	"Answer whether the receiver should precede ==anObject== in a priority container."

	^ self priority <= anObject priority
]

{ #category : #comparing }
SRDescription >> = anObject [
	^ super = anObject
		and: [ self accessor = anObject accessor ]
]

{ #category : #visiting }
SRDescription >> acceptMagritte: aVisitor [
	aVisitor visitDescription: self
]

{ #category : #accessing }
SRDescription >> accessor [
	"Answer the access-strategy of the model-value described by the receiver."

	^ accessor ifNil: [ accessor := self class defaultAccessor ]
]

{ #category : #accessing }
SRDescription >> accessor: anObject [
	accessor := anObject asSimpleReneAccessor
]

{ #category : #validation }
SRDescription >> addCondition: aCondition [ 
	self 
		addCondition: aCondition
		labelled: aCondition asString
]

{ #category : #validation }
SRDescription >> addCondition: aCondition labelled: aString [
	"Add ==aCondition== as an additional validation condition to the receiver and give it the label ==aString==. The first argument is either a block-context or any other object that responds to ==#value:== with ==true== or ==false==."

	self conditions: (self conditions
		copyWith: (Association
			key: aCondition
			value: aString))
]

{ #category : #validation }
SRDescription >> addCondition: aCondition labelled: aStringOrBlock ifValid: aDescription [

	self
		addCondition: [ :obj | (aDescription isSatisfiedBy: obj) not or: aCondition ] 
		labelled: aStringOrBlock
]

{ #category : #converting }
SRDescription >> asContainer [
	"Answer a description container of the receiver."

	self subclassResponsibility
]

{ #category : #actions }
SRDescription >> beHidden [
	self visible: false
]

{ #category : #actions }
SRDescription >> beOptional [
	self required: false
]

{ #category : #actions }
SRDescription >> beReadOnly [
	self readOnly: true
]

{ #category : #actions }
SRDescription >> beRequired [
	self required: true
]

{ #category : #actions }
SRDescription >> beVisible [
	self visible: true
]

{ #category : #actions }
SRDescription >> beWriteable [
	self readOnly: false
]

{ #category : #builder }
SRDescription >> canExpand [
	" used to expand a relation description into a group "
	^self propertyAt: #canExpand ifAbsent: [ self defaultCanExpand ]
]

{ #category : #builder }
SRDescription >> canExpand: aBoolean [
	" used to expand a relation description into a group "
	^self propertyAt: #canExpand put: aBoolean
]

{ #category : #accessors }
SRDescription >> chainAccessor: anArray [
	"Uses ==anArray== of selectors to read from the model."

	self accessor: (SRChainAccessor accessors: anArray)
]

{ #category : #'accessing-properties' }
SRDescription >> comment [
	"Answer a comment or help-text giving a hint what this description is used for. GUIs that are built from this description might display it as a tool-tip."

	^ self propertyAt: #comment ifAbsent: [ self class defaultComment ]
]

{ #category : #'accessing-properties' }
SRDescription >> comment: aString [
	self propertyAt: #comment put: aString
]

{ #category : #'accessing-properties' }
SRDescription >> conditions [
	"Answer a collection of additional conditions that need to be fulfilled so that the described model is valid. Internally the collection associates conditions with an error string."

	^ self propertyAt: #conditions ifAbsent: [ self class defaultConditions ]
]

{ #category : #'accessing-properties' }
SRDescription >> conditions: anArray [
	self propertyAt: #conditions put: anArray
]

{ #category : #'accessing-messages' }
SRDescription >> conflictErrorMessage [
	^ self propertyAt: #conflictErrorMessage ifAbsent: [ 'Input is conflicting with concurrent modification' ]
]

{ #category : #'accessing-messages' }
SRDescription >> conflictErrorMessage: aString [
	self propertyAt: #conflictErrorMessage put: aString
]

{ #category : #accessing }
SRDescription >> default [
	^ self undefinedValue
]

{ #category : #accessing }
SRDescription >> default: anObject [
]

{ #category : #builder }
SRDescription >> defaultCanExpand [
	" used to expand a relation description into a group "
	self isVisible ifFalse: [ ^false ].
	self isReadOnly ifTrue: [ ^false ].
	self group ifNotNil: [ ^false ].
	^true
]

{ #category : #'acessing-magritte' }
SRDescription >> defaultLabel [
	^ self accessor defaultLabelFor: self
]

{ #category : #'owning object' }
SRDescription >> describedObject [
	^ SRDynamicDescribedObject value
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionAccessor [
	<simpleReneDescription>
	^ SRToOneRelationDescription new
		reference: SRStringDescription new;
		accessor: #accessor;
		classes: SRAccessor allSubclasses;
		priority: 10;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionComment [
	<simpleReneDescription>
	^ SRMemoDescription new
		accessor: #comment;
		label: 'Comment';
		priority: 110;
		default: self class defaultComment;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionDefault [
	<simpleReneDescription>
	^ self class isAbstract
		ifFalse: [ 
			self class new
				accessor: #default;
				label: 'Default';
				priority: 130;
				default: self class defaultDefault;
				yourself ]
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionGroup [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #group;
		default: self class defaultGroup;
		label: 'Group';
		priority: 105;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionLabel [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #label;
		label: 'Label';
		priority: 100;
		default: self defaultLabel;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionName [
	<simpleReneDescription>
	^ SRSymbolDescription new
		accessor: #name;
		priority: 1;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionPriority [
	<simpleReneDescription>
	^ SRNumberDescription new
		accessor: #priority;
		label: 'Priority';
		priority: 130;
		default: self class defaultPriority;
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionReadOnly [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #readOnly;
		label: 'Read-only';
		priority: 200;
		default: self class defaultReadOnly;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionRequired [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #required;
		label: 'Required';
		priority: 220;
		default: self class defaultRequired;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionStringReader [
	<simpleReneDescription>
	^ SRSingleOptionDescription new
		accessor: #stringReader;
		label: 'String Reader';
		priority: 300;
		default: self class defaultStringReader;
		options: self class defaultStringReader withAllSubclasses;
		reference: SRClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionStringWriter [
	<simpleReneDescription>
	^ SRSingleOptionDescription new
		accessor: #stringWriter;
		label: 'String Writer';
		priority: 310;
		default: self class defaultStringWriter;
		options: self class defaultStringWriter withAllSubclasses;
		reference: SRClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionType [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #type;
		label: 'Kind';
		priority: 0;
		beReadOnly;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionUndefined [
	<simpleReneDescription>
	^ SRStringDescription new
		accessor: #undefined;
		label: 'Undefined String';
		priority: 140;
		default: self class defaultUndefined;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionUndefinedValue [
	<simpleReneDescription>
	^ SRToOneRelationDescription new
		accessor: #undefinedValue;
		priority: 150;
		default: self class defaultUndefinedValue;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionValidator [
	<simpleReneDescription>
	^ SRSingleOptionDescription new
		accessor: #validator;
		label: 'Validator';
		priority: 250;
		default: self class defaultValidator;
		options: self class defaultValidator withAllSubclasses;
		reference: SRClassDescription new;
		yourself
]

{ #category : #'acessing-magritte' }
SRDescription >> descriptionVisible [
	<simpleReneDescription>
	^ SRBooleanDescription new
		accessor: #visible;
		label: 'Visible';
		priority: 210;
		default: self class defaultVisible;
		yourself
]

{ #category : #'accessing-properties' }
SRDescription >> display: aBlockOrSymbol [
	"Transform how the model is converted to a string.
	aSymbol
		- is performed on the object
		- can optionally take the description as an argument
	aBlock
		- takes two optional arguments: the domain object and its description
		- returns the string to display
	
	NB. This string may be used to convert back to a domain object, so make sure it is suitable via the string reader in use."
	self propertyAt: #displayBlockOrSymbol put: aBlockOrSymbol.
]

{ #category : #'accessing-properties' }
SRDescription >> displayBlockOrSymbol [
	^ self propertyAt: #displayBlockOrSymbol ifAbsent: [ self class defaultDisplayProperty ]
]

{ #category : #displaying }
SRDescription >> displayStringFor: anObject [
	"Convert object to a string. If a block was passed to #display: use that, otherwise use the defaultDisplayProperty. N.B. It's probably best not to use this outside of the library insternals. It should be private except that it's used by option descriptions and string writer. The canonical way to get this info is `self reference toString: anObject`"

	^ self displayBlockOrSymbol cull: anObject cull: self.
]

{ #category : #strings }
SRDescription >> fromString: aString [
	"Answer an object being parsed from ==aString==."

	^ self fromString: aString reader: self stringReader
]

{ #category : #strings }
SRDescription >> fromString: aString reader: aReader [
	"Answer an object being parsed from ==aString== using ==aReader==."

	^ aReader read: aString readStream description: self
]

{ #category : #strings }
SRDescription >> fromStringCollection: aCollection [
	"Answer a collection of objects being parsed from ==aCollection== of strings."

	^ self fromStringCollection: aCollection reader: self stringReader
]

{ #category : #strings }
SRDescription >> fromStringCollection: aCollection reader: aReader [
	"Answer a collection of objects being parsed from ==aCollection== of strings using ==aReader==."

	^ aCollection collect: [ :each | self fromString: each reader: aReader ]
]

{ #category : #'accessing-properties' }
SRDescription >> group [
	"Answer the group of the receiving description. The group is a string used to categorize and group descriptions. Certain display interpreters with be able to use this information to improve the usability."

	^ self propertyAt: #group ifAbsent: [ self class defaultGroup ]
]

{ #category : #'accessing-properties' }
SRDescription >> group: aString [
	"Answer the group of the receiving description. The group is a string used to categorize and group descriptions. Certain display interpreters with be able to use this information to improve the usability."

	self propertyAt: #group put: aString
]

{ #category : #testing }
SRDescription >> hasChildren [
	"Answer ==true== if the receiver has any child-descriptions. A description container usually has children."

	^ false
]

{ #category : #testing }
SRDescription >> hasComment [
	"Answer ==true== if the the receiver has got a non empty comment."

	^ self comment notNil and: [ self comment isEmpty not ]
]

{ #category : #testing }
SRDescription >> hasLabel [
	"Answer ==true== if the the receiver has got a non empty label."

	^ self label notNil and: [ self label isEmpty not ]
]

{ #category : #comparing }
SRDescription >> hash [
	^ super hash bitXor: self accessor hash
]

{ #category : #testing }
SRDescription >> isContainer [
	"Answer ==true== if the receiver is a description container."

	^ false
]

{ #category : #testing }
SRDescription >> isGrouped [
	^ false
]

{ #category : #accessing }
SRDescription >> isKindDefined [
	^ self propertyAt: #kind ifPresent: [ :theKind | true] ifAbsent: [ false ]
]

{ #category : #testing }
SRDescription >> isReadOnly [
	^ self readOnly
]

{ #category : #testing }
SRDescription >> isRequired [
	^ self required
]

{ #category : #validation }
SRDescription >> isSatisfiedBy: anObject [
	"Answer ==true== if ==anObject== is a valid instance of the receiver's description."

	[ self validate: anObject ]
		on: SRValidationError
		do: [ :err | ^ false ].
	^ true
]

{ #category : #testing }
SRDescription >> isSimpleReneDescription [
	"Answer ==true== if the receiver is a description."

	^ true
]

{ #category : #testing }
SRDescription >> isSortable [
	"Answer ==true== if the described object can be trivially sorted, e.g. it answers to #<=."

	^ false
]

{ #category : #testing }
SRDescription >> isVisible [
	^ self visible
]

{ #category : #accessing }
SRDescription >> kind [
	"Answer the base-class (type) the receiver is describing. The default implementation answers the most generic class: Object, the root of the Smalltalk class hierarchy. Subclasses might refine this choice."

	^ self propertyAt: #kind ifAbsent: [ self class defaultKind ]
]

{ #category : #accessing }
SRDescription >> kind: aClass [
	self propertyAt: #kind put: aClass
]

{ #category : #'accessing-messages' }
SRDescription >> kindErrorMessage [
	^ self propertyAt: #kindErrorMessage ifAbsent: [ 'Invalid input given' ]
]

{ #category : #'accessing-messages' }
SRDescription >> kindErrorMessage: aString [
	self propertyAt: #kindErrorMessage put: aString
]

{ #category : #'accessing-properties' }
SRDescription >> label [
	"Answer the label of the receiving description. The label is mostly used as an identifier that is printed next to the input field when building a GUI from the receiver."

	^ self propertyAt: #label ifAbsent: [ self defaultLabel ]
]

{ #category : #'accessing-properties' }
SRDescription >> label: aString [
	self propertyAt: #label put: aString
]

{ #category : #'accessing-messages' }
SRDescription >> multipleErrorsMessage [
	^ self propertyAt: #multipleErrorsMessage ifAbsent: [ 'Multiple errors' ]
]

{ #category : #'accessing-messages' }
SRDescription >> multipleErrorsMessage: aString [
	self propertyAt: #multipleErrorsMessage put: aString
]

{ #category : #'accessing-configuration' }
SRDescription >> name [
	^ self propertyAt: #name ifAbsent: [ self accessor name ]
]

{ #category : #'accessing-configuration' }
SRDescription >> name: aSymbol [
	^ self propertyAt: #name put: aSymbol
]

{ #category : #copying }
SRDescription >> postCopy [
	super postCopy.
	accessor := accessor copy
]

{ #category : #printing }
SRDescription >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' label: '; print: self label.
	aStream nextPutAll: ' comment: '; print: self comment
]

{ #category : #'accessing-properties' }
SRDescription >> priority [
	"Answer a number that is the priority of the receiving description. Priorities are used to give descriptions an explicit order by sorting them according to this number."

	^ self propertyAt: #priority ifAbsent: [ self class defaultPriority ]
]

{ #category : #'accessing-properties' }
SRDescription >> priority: aNumber [
	self propertyAt: #priority put: aNumber
]

{ #category : #accessors }
SRDescription >> propertyAccessor: aSelector [
	"Uses ==aSelector== to read from the property dictionary of the model."

	self accessor: ((SRChainAccessor on: #properties) 
		accessor: (SRDictionaryAccessor key: aSelector))
]

{ #category : #convenience }
SRDescription >> read: aModel [
	^ aModel simpleReneReadUsing: self
]

{ #category : #'accessing-properties' }
SRDescription >> readOnly [
	"Test whether my model is read-only."

	^ self propertyAt: #readOnly ifAbsent: [ self class defaultReadOnly ]
]

{ #category : #'accessing-properties' }
SRDescription >> readOnly: aBoolean [
	self propertyAt: #readOnly put: aBoolean
]

{ #category : #convenience }
SRDescription >> readToString: aModel [
	^ self toString: (self read: aModel)
	"This is a common idiom, e.g. for the GUI layer, so we reified it"
]

{ #category : #'accessing-properties' }
SRDescription >> required [
	"Answer ==true== if the model described by the receiver is required, this is it cannot be ==nil==."

	^ self propertyAt: #required ifAbsent: [ self class defaultRequired ]
]

{ #category : #'accessing-properties' }
SRDescription >> required: aBoolean [
	self propertyAt: #required put: aBoolean
]

{ #category : #'accessing-messages' }
SRDescription >> requiredErrorMessage [
	^ self propertyAt: #requiredErrorMessage ifAbsent: [ 'Input is required but no input given' ]
]

{ #category : #'accessing-messages' }
SRDescription >> requiredErrorMessage: aString [
	self propertyAt: #requiredErrorMessage put: aString
]

{ #category : #accessors }
SRDescription >> selectorAccessor: aSelector [
	"Uses ==aSelector== to read from the model."

	self accessor: (SRSelectorAccessor selector: aSelector)
]

{ #category : #'accessing-properties' }
SRDescription >> shouldCacheDefault [

	^ self propertyAt: #shouldCacheDefault ifAbsent: [ self class defaultShouldCacheDefault ]
]

{ #category : #'accessing-properties' }
SRDescription >> shouldCacheDefault: aBoolean [

	^ self propertyAt: #shouldCacheDefault put: aBoolean
]

{ #category : #'accessing-strings' }
SRDescription >> stringReader [
	"Answer a Visitor that can be used to parse the model described by the receiver from a string."

	^ self propertyAt: #stringReader ifAbsent: [ self class defaultStringReader ]
]

{ #category : #'accessing-strings' }
SRDescription >> stringReader: aClass [
	self propertyAt: #stringReader put: aClass
]

{ #category : #'accessing-strings' }
SRDescription >> stringWriter [
	"Answer a Visitor that can be used to convert the model described by the receiver to a string."

	^ self propertyAt: #stringWriter ifAbsent: [ self class defaultStringWriter ]
]

{ #category : #'accessing-strings' }
SRDescription >> stringWriter: aClass [
	self propertyAt: #stringWriter put: aClass
]

{ #category : #strings }
SRDescription >> toString: anObject [
	"Answer a string being formatted from ==anObject==."

	^ self toString: anObject writer: self stringWriter
]

{ #category : #strings }
SRDescription >> toString: anObject writer: aFormatter [
	"Answer a string being formatted from ==anObject== using ==aFormatter==."

	^ aFormatter write: anObject description: self
]

{ #category : #strings }
SRDescription >> toStringCollection: aCollection [
	"Answer a collection of strings being formatted from ==aCollection==."

	^ self toStringCollection: aCollection writer: self stringWriter
]

{ #category : #strings }
SRDescription >> toStringCollection: aCollection writer: aFormatter [
	"Answer a collection of strings being formatted from ==aCollection== using ==aFormatter==."

	^ aCollection collect: [ :each | self toString: each writer: aFormatter ]
]

{ #category : #private }
SRDescription >> tryValidation: tryBlock ifPass: passBlock [
	| shouldContinue |
	shouldContinue := true.
	tryBlock on: SRValidationError do: [ :e | shouldContinue := false. e pass ].
	shouldContinue ifFalse: [ ^ self ].
	passBlock value
]

{ #category : #'accessing-configuration' }
SRDescription >> type [
	"Answer the name of the description, a human-readable string describing the type."

	^ self class label
]

{ #category : #'accessing-strings' }
SRDescription >> undefined [
	"Answer a string that is printed whenever the model described by the receiver is ==nil==."

	^ (self propertyAt: #undefined ifAbsent: [ self class defaultUndefined ])
		ifNil: [ self class defaultUndefined ]
]

{ #category : #'accessing-strings' }
SRDescription >> undefined: aString [
	self propertyAt: #undefined put: aString
]

{ #category : #'accessing-properties' }
SRDescription >> undefinedValue [

	^ (self propertyAt: #undefinedValue ifAbsent: [ self class defaultUndefinedValue ])
		ifNil: [ self class defaultUndefinedValue ]
]

{ #category : #'accessing-properties' }
SRDescription >> undefinedValue: anObject [
	self propertyAt: #undefinedValue put: anObject
]

{ #category : #validation }
SRDescription >> validate: anObject [
	"Validate ==anObject== in the context of the describing-receiver, raises an error in case of a problem. If ==anObject== is ==nil== and not required, most tests will be skipped. Do not override this message, instead have a look at ==#validateSpecific:== what is usually a better place to define the behaviour your description requires."

	self validator on: anObject description: self
]

{ #category : #'validation-private' }
SRDescription >> validateConditions: anObject [
	"Validate ==anObject== to satisfy all its custom conditions."

	self conditions do: [ :each |
		(each key value: anObject)
			ifFalse: [ SRConditionError description: self signal: each value ] ]
]

{ #category : #'validation-private' }
SRDescription >> validateKind: anObject [
	"Validate ==anObject== to be of the right kind."

	(anObject isKindOf: self kind)
		ifFalse: [ SRKindError description: self signal: self kindErrorMessage ]
]

{ #category : #'validation-private' }
SRDescription >> validateRequired: anObject [
	"Validate ==anObject== not to be ==nil== if it is required."

	(self isRequired and: [ anObject isNil ])
		ifTrue: [ SRRequiredError description: self signal: self requiredErrorMessage ]
]

{ #category : #'validation-private' }
SRDescription >> validateSpecific: anObject [
	"Validate ==anObject== to satisfy its descriptions specific validation rules. Subclasses mostly want to override this method."
]

{ #category : #'accessing-properties' }
SRDescription >> validator [
	"Answer a Visitor that can be used to validate the model described by the receiver."

	^ self propertyAt: #validator ifAbsent: [ self class defaultValidator ]
]

{ #category : #'accessing-properties' }
SRDescription >> validator: aClass [
	self propertyAt: #validator put: aClass
]

{ #category : #'accessing-properties' }
SRDescription >> visible [
	"Answer ==true== if the model described by the receiver is visible, as an opposite to hidden."

	^ self propertyAt: #visible ifAbsent: [ self class defaultVisible ]
]

{ #category : #'accessing-properties' }
SRDescription >> visible: aBoolean [
	self propertyAt: #visible put: aBoolean
]

{ #category : #'accessing-properties' }
SRDescription >> visibleInReport [

	^self propertyAt: #visibleInReport ifAbsent: [ self class defaultVisibleInReport ]
]

{ #category : #'accessing-properties' }
SRDescription >> visibleInReport: aBoolean [ 
	self propertyAt: #visibleInReport put: aBoolean
]

{ #category : #convenience }
SRDescription >> write: anObject to: aModel [
	^ aModel simpleReneWrite: anObject using: self
]

{ #category : #convenience }
SRDescription >> writeFromString: aString to: aModel [
	| value |
	value := self fromString: aString.
	^ self write: value to: aModel
	"This is a common idiom, e.g. for the GUI layer, so we reified it"
]
