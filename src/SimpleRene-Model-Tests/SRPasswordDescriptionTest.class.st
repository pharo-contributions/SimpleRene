Class {
	#name : #SRPasswordDescriptionTest,
	#superclass : #SRStringDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRPasswordDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
SRPasswordDescriptionTest >> actualClass [
	^ SRPasswordDescription
]

{ #category : #tests }
SRPasswordDescriptionTest >> testIsObfuscated [
	self deny: (self description isObfuscated: '').
	self deny: (self description isObfuscated: nil).
	self deny: (self description isObfuscated: 123).
	self deny: (self description isObfuscated: '**1').
	self assert: (self description isObfuscated:  '******')
]

{ #category : #tests }
SRPasswordDescriptionTest >> testObfuscated [
	self assert: (self description obfuscated: nil) = ''.
	self assert: (self description obfuscated: 'zork') = '****'.
	self assert: (self description obfuscated: 'foobar') = '******'
]
