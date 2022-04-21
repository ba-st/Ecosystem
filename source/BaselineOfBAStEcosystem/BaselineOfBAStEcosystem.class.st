Class {
	#name : #BaselineOfBAStEcosystem,
	#superclass : #BaselineOf,
	#category : #BaselineOfBAStEcosystem
}

{ #category : #baselines }
BaselineOfBAStEcosystem >> baseline: spec [

	<baseline>
	spec for: #pharo do: [ 
		self projectSpecs do: [ :projectSpec | 
			| projectName baselineName version dependencyName |

			projectName := projectSpec first.
			baselineName := projectSpec second.
			version := projectSpec third.
			dependencyName := projectName , '-Development'.
			spec
				baseline: baselineName
				with: [ 
					spec repository: ( 'github://ba-st/<1s>:<2s>' expandMacrosWith: projectName with: version ) ];
				project: dependencyName copyFrom: baselineName with: [ spec loads: 'Development' ];
				group: 'CI' with: dependencyName
			]
		]
]

{ #category : #accessing }
BaselineOfBAStEcosystem >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfBAStEcosystem >> projectSpecs [

	^ #(
		#( 'Buoy' 'Buoy' 'v6' )
		#( 'Launchpad' 'Launchpad' 'v4' )
		#( 'Hyperspace' 'Hyperspace' 'v4' )
		#( 'Stargate' 'Stargate' 'v8' )
		#( 'Superluminal' 'Superluminal' 'v4' )
		#( 'Stargate-Consul' 'StargateConsul' 'v4' )
		#( 'Sagan' 'Sagan' 'v6' )
		#( 'Ansible' 'Ansible' 'v1' )
		#( 'Mole' 'Mole' 'v3' )
		#( 'Stardust' 'Stardust' 'v1' )
		#( 'Cannon' 'Cannon' 'v1' )
		#( 'Aconcagua' 'Aconcagua' 'v8' )
		#( 'Chalten' 'Chalten' 'v8' )
		#( 'Kepler' 'Kepler' 'v5' )
		#( 'Boardwalk' 'Boardwalk' 'v6' )
		#( 'RenoirSt' 'RenoirSt' 'v7' )
		#( 'Willow' 'Willow' 'v14' )
		#( 'Willow-JQueryUI' 'WillowJQueryUI' 'v12' )
		#( 'Willow-Bootstrap' 'WillowBootstrap' 'v13' )
		#( 'Willow-Auth0' 'WillowAuth0' 'v2' )
		#( 'Willow-SemanticUI' 'WillowSemanticUI' 'release-candidate' )
		#( 'Willow-Mixpanel' 'WillowMixpanel' 'v5' )
		#( 'Willow-SpinKit' 'WillowSpinKit' 'v9' )		
		#( 'Willow-Playground' 'WillowPlayground' 'release-candidate' )
	   )
]
