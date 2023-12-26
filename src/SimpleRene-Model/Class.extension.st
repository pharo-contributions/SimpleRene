Extension { #name : 'Class' }

{ #category : '*SimpleRene-Model' }
Class >> label [
	"Answer a human-readable name of the receiving class. This implementation tries to be smart and return a nice label, unfortunately for a lot of classes this doesn't work well so subclasses might want to override this method and return soemthing more meaningfull to end-users."

	self deprecated: 'use simpleReneLabel' transformWith: '`@receiver label' 
						-> '`@receiver simpleReneLabel'.
	^ self simpleReneLabel
]

{ #category : '*SimpleRene-Model-configuration' }
Class >> simpleReneDescriptionContainer [

	"Return the default description container."

	<simpleReneContainer>
	^ SRPriorityContainer new
		  label: self simpleReneLabel;
		  yourself
]

{ #category : '*SimpleRene-Model' }
Class >> simpleReneLabel [
	"Answer a human-readable name of the receiving class. This implementation tries to be smart and return a nice label, unfortunately for a lot of classes this doesn't work well so subclasses might want to override this method and return soemthing more meaningfull to end-users."

	| start input |
	start := self name findFirst: [ :each | each isLowercase ].
	input := (self name copyFrom: (1 max: start - 1) to: self name size)
		readStream.
	^ String streamContents: [ :stream |
		[ input atEnd ] whileFalse: [
			stream nextPut: input next.
			(input atEnd or: [ input peek isLowercase ])
				ifFalse: [ stream nextPut: Character space ] ] ]
]
