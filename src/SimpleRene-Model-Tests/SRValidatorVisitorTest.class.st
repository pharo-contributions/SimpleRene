Class {
	#name : #SRValidatorVisitorTest,
	#superclass : #TestCase,
	#category : #'SimpleRene-Model-Tests'
}

{ #category : #tests }
SRValidatorVisitorTest >> testUndefinedValue [
	self
		shouldnt: [ 
			SRValidatorVisitor new
				validate: 'null'
				using:
					(SRBooleanDescription new
						undefinedValue: 'null';
						yourself) ]
		raise: SRKindError
]
