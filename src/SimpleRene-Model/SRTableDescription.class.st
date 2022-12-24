"
I am a description of tables, their cells and labels. I hold a reference to the description of my cells, that are all described using the same description. Possible values include instances of *MATableModel*.
"
Class {
	#name : #SRTableDescription,
	#superclass : #SRReferenceDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRTableDescription class >> defaultColumnLabels [
	^ OrderedCollection with: 'a' with: 'b' with: 'c'
]

{ #category : #'accessing-defaults' }
SRTableDescription class >> defaultKind [
	^ SRTableModel
]

{ #category : #'accessing-defaults' }
SRTableDescription class >> defaultRowLabels [
	^ OrderedCollection with: '1' with: '2' with: '3'
]

{ #category : #testing }
SRTableDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRTableDescription class >> label [
	^ 'Table'
]

{ #category : #visiting }
SRTableDescription >> acceptMagritte: aVisitor [
	aVisitor visitTableDescription: self
]

{ #category : #accessing }
SRTableDescription >> columnCount [
	^ self columnLabels size
]

{ #category : #'accessing-properties' }
SRTableDescription >> columnLabels [
	^ self propertyAt: #columnLabels ifAbsent: [ self class defaultColumnLabels ]
]

{ #category : #'accessing-properties' }
SRTableDescription >> columnLabels: aCollection [
	self propertyAt: #columnLabels put: aCollection
]

{ #category : #'accessing-textual' }
SRTableDescription >> columnLabelsTextual [
	^ (SRStringDescription new toStringCollection: self columnLabels)
		simpleReneAsMultilineString
]

{ #category : #'accessing-textual' }
SRTableDescription >> columnLabelsTextual: aString [
	self columnLabels: (SRStringDescription new fromStringCollection: aString lines)
]

{ #category : #'acessing-magritte' }
SRTableDescription >> descriptionColumnLabels [
	<simpleReneDescription>
	^ SRMemoDescription new
		accessor: #columnLabelsTextual;
		label: 'Column Labels';
		priority: 250;
		yourself
]

{ #category : #'acessing-magritte' }
SRTableDescription >> descriptionDefault [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
SRTableDescription >> descriptionRequired [
	<simpleReneDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
SRTableDescription >> descriptionRowLabels [
	<simpleReneDescription>
	^ SRMemoDescription new
		accessor: #rowLabelsTextual;
		label: 'Row Labels';
		priority: 250;
		yourself
]

{ #category : #accessing }
SRTableDescription >> rowCount [
	^ self rowLabels size
]

{ #category : #'accessing-properties' }
SRTableDescription >> rowLabels [
	^ self propertyAt: #rowLabels ifAbsent: [ self class defaultRowLabels ]
]

{ #category : #'accessing-properties' }
SRTableDescription >> rowLabels: aCollection [
	self propertyAt: #rowLabels put: aCollection
]

{ #category : #'accessing-textual' }
SRTableDescription >> rowLabelsTextual [
	^ (SRStringDescription new toStringCollection: self rowLabels)
		simpleReneAsMultilineString
]

{ #category : #'accessing-textual' }
SRTableDescription >> rowLabelsTextual: aString [
	self rowLabels: (SRStringDescription new fromStringCollection: aString lines)
]

{ #category : #'private-validating' }
SRTableDescription >> validateChildren: anObject [ 
	anObject do: [ :row :value :each | self reference validate: each ].
]

{ #category : #'private-validating' }
SRTableDescription >> validateCounts: anObject [ 
	(anObject rowCount ~= self rowCount or: [ anObject columnCount ~= self columnCount ])
		ifTrue: [ SRKindError description: self signal: self kindErrorMessage ].
]

{ #category : #'validation-private' }
SRTableDescription >> validateSpecific: anObject [
	self
		tryValidation: [ super validateSpecific: anObject ]
		ifPass: [ 
			self validateCounts: anObject.
			self validateChildren: anObject ]
]
