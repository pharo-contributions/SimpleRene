"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestSimpleReneModel',
	#superclass : 'PackageManifest',
	#category : 'SimpleRene-Model-Manifest',
	#package : 'SimpleRene-Model',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestSimpleReneModel class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Object #simpleReneLazyInstVarUsing: #false)) #'2019-03-23T09:33:42.523345-04:00') )
]
