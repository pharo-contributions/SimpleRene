"
I represent a file using a ByteArray in the object memory. I am not practicable for big files: use me for development and testing only.
"
Class {
	#name : #SRMemoryFileModel,
	#superclass : #SRFileModel,
	#instVars : [
		'contents'
	],
	#category : #'SimpleRene-Model-Models'
}

{ #category : #comparing }
SRMemoryFileModel >> = anObject [
    ^ super = anObject and: [ self contents = anObject contents ]
]

{ #category : #accessing }
SRMemoryFileModel >> contents [
	^ contents ifNil: [ contents := ByteArray new ]
]

{ #category : #accessing }
SRMemoryFileModel >> contents: aByteArray [
	super contents: aByteArray.
	contents := aByteArray asByteArray
]

{ #category : #initialization }
SRMemoryFileModel >> finalize [
	super finalize.
	contents := nil
]

{ #category : #comparing }
SRMemoryFileModel >> hash [
	^ super hash bitXor: self contents hash
]
