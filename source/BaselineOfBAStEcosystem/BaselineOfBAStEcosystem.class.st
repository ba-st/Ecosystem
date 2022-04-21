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
			spec baseline: baselineName with: [ 
				spec
					repository: ( 'github://ba-st/<1s>:<2s>' expandMacrosWith: projectName with: version );
					project: dependencyName copyFrom: baselineName with: [ spec loads: 'Development' ].
				spec group: 'CI' with: dependencyName
				]
			]
		]
]

{ #category : #accessing }
BaselineOfBAStEcosystem >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfBAStEcosystem >> projectSpecs [

	^ #( #( 'Willow-Playground' 'WillowPlayground' 'release-candidate' )
	     #( 'Stargate-Consul' 'StargateConsul' 'v4' ) )
]
