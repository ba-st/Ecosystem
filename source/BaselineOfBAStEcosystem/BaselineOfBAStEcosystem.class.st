Class {
	#name : 'BaselineOfBAStEcosystem',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBAStEcosystem',
	#package : 'BaselineOfBAStEcosystem'
}

{ #category : 'baselines' }
BaselineOfBAStEcosystem >> baseline: spec [

  <baseline>
  spec for: #pharo do: [
      self projectSpecs do: [ :projectSpec |
          | projectName baselineName version dependencyName |
          projectName := projectSpec first.
          baselineName := projectSpec second.
          version := projectSpec third.
          dependencyName := '<1s>-Development' expandMacrosWith: projectName.
          spec
            baseline: baselineName
            with: [
                spec repository:
                    ( 'github://ba-st/<1s>:<2s>' expandMacrosWith: projectName with: version ) ];
            project: dependencyName copyFrom: baselineName with: [ spec loads: 'Development' ];
            group: 'CI' with: dependencyName
        ]
    ]
]

{ #category : 'accessing' }
BaselineOfBAStEcosystem >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : 'baselines' }
BaselineOfBAStEcosystem >> projectSpecs [

	^ #(
		#( 'Buoy' 'Buoy' 'v8' )
		#( 'Bell' 'Bell' v4 )
		#( 'Launchpad' 'Launchpad' 'v7' )
		#( 'Hyperspace' 'Hyperspace' 'v7' )
		#( 'Stargate' 'Stargate' 'v11' )
		#( 'Superluminal' 'Superluminal' 'v7' )
		#( 'Stargate-Consul' 'StargateConsul' 'v7' )
		#( 'Sagan' 'Sagan' 'v11' )
		#( 'Ansible' 'Ansible' 'v4' )
		#( 'Mole' 'Mole' 'v4' )
		#( 'Stardust' 'Stardust' 'v2' )
		#( 'Cannon' 'Cannon' 'v2' )
		#( 'Aconcagua' 'Aconcagua' 'v11' )
		#( 'Chalten' 'Chalten' 'v11' )
		#( 'Kepler' 'Kepler' 'v8' )
		#( 'Boardwalk' 'Boardwalk' 'v8' )
		#( 'RenoirSt' 'RenoirSt' 'v9' )
		#( 'Willow' 'Willow' 'v16' )
		#( 'Willow-JQueryUI' 'WillowJQueryUI' 'v14' )
		#( 'Willow-Bootstrap' 'WillowBootstrap' 'v15' )
		#( 'Willow-Auth0' 'WillowAuth0' 'v4' )
		#( 'Willow-SemanticUI' 'WillowSemanticUI' 'release-candidate' )
		#( 'Willow-Mixpanel' 'WillowMixpanel' 'v7' )
		#( 'Willow-SpinKit' 'WillowSpinKit' 'v11' )		
		#( 'Willow-Playground' 'WillowPlayground' 'release-candidate' )
	   )
]
