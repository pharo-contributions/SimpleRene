Class {
	#name : #BaselineOfSimpleRene,
	#superclass : #BaselineOf,
	#category : #BaselineOfSimpleRene
}

{ #category : #baselines }
BaselineOfSimpleRene >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [ 
		
		spec 
			package: 'SimpleRene-Model';
			package: 'SimpleRene-ContactManager' with: [ spec requires: #('SimpleRene-Model') ];
			package: 'SimpleRene-Model-Tests' with: [ spec requires: #('SimpleRene-Model') ].
			
		spec group: 'default' with: #('Core' 'Tests').
		spec group: 'Core' with: #('SimpleRene-Model').
		spec group: 'Tests' with: #('SimpleRene-Model-Tests').
		spec group: 'All' with: #('Core' 'Tests' 'SimpleRene-ContactManager') ]
]
