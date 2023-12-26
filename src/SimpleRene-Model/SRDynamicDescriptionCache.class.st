"
I am a dynamic variable that caches descriptions defined in the current call stack. I prevent infinite recursion when a description refers to itself.
"
Class {
	#name : 'SRDynamicDescriptionCache',
	#superclass : 'SRDynamicVariable',
	#category : 'SimpleRene-Model-Utility',
	#package : 'SimpleRene-Model',
	#tag : 'Utility'
}

{ #category : 'defaults' }
SRDynamicDescriptionCache class >> defaultValue [
	^ IdentityDictionary new
]
