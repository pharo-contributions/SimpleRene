"
I am a visitor responsible for visiting SimpleRene descriptions. I am an abstract class providing a default implementation for concrete visitors.

My key entry point is `visit:`, which starts the visiting process. Other visiting messages, like `visitAll:`, send `visit:` at some point.

My 'visiting-description' protocol reflects the hierarchy of `SRDescription` and its subclasses. Visiting a class which my subclasses doesn't handle specifically automatically defaults to a less-specific implementation e.g. Boolean -> Element -> Description. This code, along with the corresponding #acceptSimpleReneVisitor:` methods, was automatically created using code on my class-side.
"
Class {
	#name : 'SRVisitor',
	#superclass : 'SRBasicObject',
	#category : 'SimpleRene-Model-Visitor',
	#package : 'SimpleRene-Model',
	#tag : 'Visitor'
}

{ #category : 'private' }
SRVisitor class >> buildVisitorHierarchyForClass: aClass selector: aBlock classified: aSelector [
	" self 
			buildVisitorHierarchyForClass: SRDescription 
			selector: [ :class | 'visit' , (class name allButFirst: 2) , ':' ] 
			classified: #'visiting-description' "

	| visitSourceCode acceptSourceCode classesOwnedBySimpleRene |
	classesOwnedBySimpleRene := aClass withAllSubclasses select: [ :class | class category beginsWith: 'SimpleRene' ].
	classesOwnedBySimpleRene do: [ :class | | visitSelector |
			visitSelector := aBlock value: class.
			visitSourceCode := String streamContents: [ :stream |
					stream nextPutAll: visitSelector; nextPutAll: ' aDescription'; cr.
					class = aClass ifFalse: [
						stream tab; nextPutAll: 'self '; nextPutAll: (aBlock value: class superclass); nextPutAll: ' anObject' ] ].
			self compile: visitSourceCode classified: aSelector.
				
			acceptSourceCode := String streamContents: [ :stream |
					stream nextPutAll: 'acceptSimpleReneVisitor: aVisitor'; cr.
					stream tab; nextPutAll: 'aVisitor '; nextPutAll: visitSelector; nextPutAll: ' self' ].
			class compile: acceptSourceCode classified: #visiting ]
]

{ #category : 'visiting' }
SRVisitor >> visit: anObject [
	"Visit ==anObject== with the receiving visitor."
	| errors |
	errors := OrderedCollection new.
	[
		anObject acceptSimpleReneVisitor: self.
	]
		on: SRValidationError
		do: [ :err | 
			errors add: err. 
			err resume ].
		
	errors isEmpty ifFalse: [
		SRMultipleErrors
			description: anObject 
			errors: errors
			signal: anObject label ]
]

{ #category : 'visiting' }
SRVisitor >> visitAll: aCollection [
	"Visit all elements of ==aCollection== with the receiving visitor."

	aCollection do: [ :each | self visit: each ]
]

{ #category : 'visiting-description' }
SRVisitor >> visitBlockDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitBooleanDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitClassDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitColorDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitContainer: anObject [
	self visitDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitDateAndTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitDateDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitDescription: anObject [

]

{ #category : 'visiting-description' }
SRVisitor >> visitDirectoryDescription: anObject [
	self visitFileDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitDurationDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitElementDescription: anObject [
	self visitDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitFileDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitMagnitudeDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitMemoDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : 'visit-money' }
SRVisitor >> visitMoneyDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitMultipleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitNumberDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitOptionDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitPasswordDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitPriorityContainer: anObject [
	self visitContainer: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitReferenceDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitRelationDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitReportContainer: anObject [
	self visitContainer: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitSingleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitStringDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitSymbolDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitTableDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitTableReference: anObject [
	^ self visitReferenceDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitTimeStampDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitToManyRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitToManyScalarRelationDescription: anObject [
	self visitToManyRelationDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitToOneRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : 'visiting-description' }
SRVisitor >> visitTokenDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : 'visiting-descriptions' }
SRVisitor >> visitUrlDescription: aMAUrlDescription [ 
	self visitElementDescription: aMAUrlDescription
]
