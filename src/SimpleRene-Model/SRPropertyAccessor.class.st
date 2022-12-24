"
I access an MAObject's properties.

Note that my lineage might a bit confusing because my superclass is used when a model object *is* a dictionary, but I access a dictionary *contained by* a model object.
"
Class {
	#name : #SRPropertyAccessor,
	#superclass : #SRDictionaryAccessor,
	#category : #'SimpleRene-Model-Accessor'
}

{ #category : #model }
SRPropertyAccessor >> read: aModel [
	^ aModel propertyAt: self key ifAbsent: [ nil ]
]

{ #category : #model }
SRPropertyAccessor >> write: anObject to: aModel [
	aModel propertyAt: self key put: anObject
]
