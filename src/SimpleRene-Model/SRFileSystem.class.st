Class {
	#name : #SRFileSystem,
	#superclass : #Object,
	#category : #'SimpleRene-Model'
}

{ #category : #paths }
SRFileSystem class >> extensionFor: aString [ 

	^ aString asFileReference extension.
]

{ #category : #entries }
SRFileSystem class >> fileSizeFor: filenameString [ 
	^ filenameString asFileReference size
]

{ #category : #paths }
SRFileSystem class >> fullNameFor: aString [ 

	^ aString asFileReference fullName.
]

{ #category : #locations }
SRFileSystem class >> imageDirectory [

	^ FileLocator imageDirectory.
]

{ #category : #'mime types' }
SRFileSystem class >> mimeTypesForExtension: aString [ 

	| types |
	types := MIMEType forExtensionReturnMimeTypesOrNil: aString.
	^ types ifNotNil: [ types collect: [ :e | e asString ] ].
]
