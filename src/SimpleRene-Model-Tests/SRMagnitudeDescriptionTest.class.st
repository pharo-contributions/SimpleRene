Class {
	#name : #SRMagnitudeDescriptionTest,
	#superclass : #SRElementDescriptionTest,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #testing }
SRMagnitudeDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
SRMagnitudeDescriptionTest >> actualClass [
	^ SRMagnitudeDescription
]

{ #category : #private }
SRMagnitudeDescriptionTest >> excludedInstance [
	self subclassResponsibility
]

{ #category : #private }
SRMagnitudeDescriptionTest >> maxInstance [
	self subclassResponsibility
]

{ #category : #private }
SRMagnitudeDescriptionTest >> minInstance [
	self subclassResponsibility
]

{ #category : #tests }
SRMagnitudeDescriptionTest >> testInfToInf [
	self assert: self description min isNil.
	self assert: self description max isNil.

	self assert: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #tests }
SRMagnitudeDescriptionTest >> testInfToVal [
	self description max: self includedInstance.

	self assert: self description min isNil.
	self assert: self description max = self includedInstance.

	self assert: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self deny: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #'tests-accessing' }
SRMagnitudeDescriptionTest >> testMax [
	self description max: self maxInstance.
	self assert: self description max = self maxInstance
]

{ #category : #'tests-accessing' }
SRMagnitudeDescriptionTest >> testMin [
	self description min: self minInstance.
	self assert: self description min = self minInstance
]

{ #category : #'tests-accessing' }
SRMagnitudeDescriptionTest >> testMinMax [
	self description min: self minInstance max: self maxInstance.
	self assert: self description min = self minInstance.
	self assert: self description max = self maxInstance
]

{ #category : #'tests-validation' }
SRMagnitudeDescriptionTest >> testRangeErrorMessage [
	self description
		min: self minInstance;
		max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.

	self description rangeErrorMessage: 'zork'.
	self assert: self description rangeErrorMessage = 'zork'.

	self
		should: [ self description validate: self excludedInstance ]
		raiseSingle: SRRangeError
		withExceptionDo: [ :err | self assert: self description rangeErrorMessage = err messageText ]
]

{ #category : #'tests-validation' }
SRMagnitudeDescriptionTest >> testRangeErrorMessageGenerated [
	self description min: nil max: nil.
	self assert: self description rangeErrorMessage isNil.
	
	self description min: nil max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.
	
	self description min: self minInstance max: nil.
	self assert: self description rangeErrorMessage notEmpty.

	self description min: self minInstance max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty
]

{ #category : #tests }
SRMagnitudeDescriptionTest >> testValToInf [
	self description min: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max isNil.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #tests }
SRMagnitudeDescriptionTest >> testValToVal [
	self description min: self includedInstance.
	self description max: self includedInstance.

	self assert: self description min = self includedInstance.
	self assert: self description max = self includedInstance.

	self deny: (self description isSatisfiedBy: self minInstance).
	self assert: (self description isSatisfiedBy: self includedInstance).
	self deny: (self description isSatisfiedBy: self maxInstance)
]

{ #category : #'tests-validation' }
SRMagnitudeDescriptionTest >> testValidateSpecific [
	super testValidateSpecific.
	self description
		min: self minInstance;
		max: self maxInstance.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: SRRangeError.
	self
		should: [ self description validate: self excludedInstance ]
		raiseSingle: SRRangeError
]
