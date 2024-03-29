Class {
	#name : 'SRComposedDescriptionBuilder',
	#superclass : 'SRDescriptionBuilder',
	#category : 'SimpleRene-Model-Builder',
	#package : 'SimpleRene-Model',
	#tag : 'Builder'
}

{ #category : 'visiting' }
SRComposedDescriptionBuilder >> setBuiltDescription: aDescription [ 
	| builders |
	builders := self target simpleReneDescription descriptionBuilders.
	builtDescription := aDescription.
	builders do: [ :each | builtDescription := each buildFrom: builtDescription target: target model: model ]
]

{ #category : 'visiting' }
SRComposedDescriptionBuilder >> visitContainer: aContainer [
	| builders |
	builders := aContainer descriptionBuilders.
	builtDescription := aContainer.
	builders do: [ :each | builtDescription := each buildFrom: builtDescription target: self target model: self model ]
]

{ #category : 'visiting-description' }
SRComposedDescriptionBuilder >> visitRelationDescription: aDescription [
	| builders buildedReference relationValue |
	builders := self target simpleReneDescription descriptionBuilders.
	buildedReference := aDescription reference.
	relationValue := (target simpleReneReadUsing: aDescription).
	relationValue ifNotNil: [ 
		builders do: [ :each | buildedReference := each buildFrom: buildedReference target: relationValue model: self model ].
		aDescription reference: buildedReference].
	super visitRelationDescription: aDescription
]
