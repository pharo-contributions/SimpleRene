"
I am a description of files, their contents, filename and mime-type. Possible values include instances of *MAFileModel*. My visual representation could be a file-upload dialog.
"
Class {
	#name : #SRFileDescription,
	#superclass : #SRElementDescription,
	#category : #'SimpleRene-Model-Description'
}

{ #category : #'accessing-defaults' }
SRFileDescription class >> defaultDisplayProperty [
	^ #filename
]

{ #category : #'accessing-defaults' }
SRFileDescription class >> defaultKind [
	^ SRMemoryFileModel
]

{ #category : #testing }
SRFileDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
SRFileDescription class >> label [
	^ 'File'
]

{ #category : #visiting }
SRFileDescription >> acceptSimpleReneVisitor: aVisitor [
	aVisitor visitFileDescription: self
]

{ #category : #accessing }
SRFileDescription >> defaultDirectory [

	^ self propertyAt: #defaultDirectory ifAbsent: [ SRFileSystem imageDirectory ].
]

{ #category : #accessing }
SRFileDescription >> defaultDirectory: fileReference [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference
]
