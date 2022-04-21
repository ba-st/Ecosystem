Class {
	#name : #BaselineOfBAStEcosystem,
	#superclass : #BaselineOf,
	#category : #BaselineOfBAStEcosystem
}

{ #category : #baselines }
BaselineOfBAStEcosystem >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		self setUpDependencies: spec.
		spec group: 'CI' with: #('Willow-Playground-Deployment' 'Stargate-Consul-Development')
		]
]

{ #category : #accessing }
BaselineOfBAStEcosystem >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfBAStEcosystem >> setUpDependencies: spec [

	spec
		baseline: 'WillowPlayground'
		with: [ spec repository: 'github://ba-st/Willow-Playground:release-candidate' ];
		project: 'Willow-Playground-Deployment'
		copyFrom: 'WillowPlayground'
		with: [ spec loads: 'Deployment' ].

	spec
		baseline: 'StargateConsul'
		with: [ spec repository: 'github://ba-st/Stargate-Consul:v4' ];
		project: 'Stargate-Consul-Development'
		copyFrom: 'StargateConsul'
		with: [ spec loads: 'Development' ]
]
