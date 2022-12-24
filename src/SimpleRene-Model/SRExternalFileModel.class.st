"
I manage the file-data I represent on the file-system. From the programmer this looks the same as if the file would be in memory (==*MAMemoryFileModel*==), as it is transparently loaded and written out as necessary.

I delegate my actual location on disk to MAFileDatabase (see class comment).
"
Class {
	#name : #SRExternalFileModel,
	#superclass : #SRFileModel,
	#instVars : [
		'location',
		'directory'
	],
	#category : #'SimpleRene-Model'
}

{ #category : #accessing }
SRExternalFileModel class >> baseDirectoryPath [
	" deprecated: use MAFileDatabase baseDirectoryPath instead "
	^SRFileDatabase baseDirectory fullName
]

{ #category : #accessing }
SRExternalFileModel class >> baseDirectoryPath: aString [ 
	" deprecated, but still used by pier "
	SRFileDatabase baseDirectory: aString
]

{ #category : #accessing }
SRExternalFileModel class >> baseUrl [
	" deprecated: use MAFileDatabase baseDirectoryPath instead "
	^ SRFileDatabase baseUrl
]

{ #category : #accessing }
SRExternalFileModel class >> baseUrl: aString [
	" deprecated: use MAFileDatabase baseUrl instead "
	^ SRFileDatabase baseUrl: aString
]

{ #category : #comparing }
SRExternalFileModel >> = anObject [
    ^ super = anObject and: [ self directory = anObject directory ]
]

{ #category : #configuration }
SRExternalFileModel >> baseUrl [
	^ self database baseUrl
]

{ #category : #accessing }
SRExternalFileModel >> contents [
	| stream |
	^ self file exists
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]
]

{ #category : #accessing }
SRExternalFileModel >> contents: aByteArray [
	| stream |
	stream := self writeStream.
	[ stream nextPutAll: aByteArray asByteArray ]
		ensure: [ stream close ].
	super contents: aByteArray
]

{ #category : #private }
SRExternalFileModel >> database [

	^ SRFileDatabase new.
]

{ #category : #'accessing-dynamic' }
SRExternalFileModel >> directory [

	^ directory ifNil: [ directory := self database uniqueLocation ].
]

{ #category : #'accessing-dynamic' }
SRExternalFileModel >> file [
	^(self directory / self filename) asFileReference
]

{ #category : #initialization }
SRExternalFileModel >> finalize [
	|  dir |
	dir := self directory.
	dir exists
		ifTrue: [ dir deleteAll ].
	[ (dir := dir parent) hasChildren ]
		whileFalse: [ dir ensureDelete ].
	super finalize.
	location := nil
]

{ #category : #comparing }
SRExternalFileModel >> hash [
	^ super hash bitXor: self directory hash
]

{ #category : #copying }
SRExternalFileModel >> postCopy [
	| previous |
	super postCopy.
	previous := self contents.
	location := nil.
	self contents: previous
]

{ #category : #'accessing-dynamic' }
SRExternalFileModel >> readStream [
	^ self file binaryReadStream 
]

{ #category : #'accessing-dynamic' }
SRExternalFileModel >> writeStream [
	^ self file binaryWriteStream 
]
