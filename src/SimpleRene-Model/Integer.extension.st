Extension { #name : 'Integer' }

{ #category : '*SimpleRene-Model' }
Integer >> asSimpleReneFileSize [
	"Return the receiver with the adequate file size identified."
	
	#( 'B' 'KB' 'MB' 'GB' 'TB' 'PB' 'EB' 'ZB' 'YB' )
		inject: self
		into: [ :value :each |
			value < 1024
				ifFalse: [ value // 1024 ]
				ifTrue: [ ^ value asString , ' ' , each ] ]
]
