"
Description
--------------------

Baseline for the Famix project
"
Class {
	#name : #BaselineOfFamix,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfFamix
}

{ #category : #baseline }
BaselineOfFamix >> baseline: spec [
	<baseline>
	
	repository := self packageRepositoryURL.
	
	spec
		for: #common
		do: [
			"Dependencies"
			self
				deepTraverser: spec;
				fame: spec;
				kgbTestResources: spec;
				collectionExtensions: spec;
				packageBlueprintTestResources: spec;
				referenceTestResources: spec;
				neoCSV: spec;
				roelTyper: spec.

			"Packages"
			spec
				package: 'Moose-Query' with: [ spec requires: #('Fame' 'DeepTraverser' 'CollectionExtensions') ];
				package: 'Moose-Core' with: [ spec requires: #('Fame' 'Moose-Query') ];
				package: 'Moose-Query-Extensions' with: [ spec requires: #('Moose-Query' 'Famix-Traits') ];
				package: 'Famix-Groups' with: [ spec requires: #('Moose-Core' 'NeoCSV') ];
				package: 'Famix-Traits' with: [ spec requires: #('Famix-Groups' 'Moose-Core') ];
				package: 'Famix-Traits-Extensions' with: [ spec requires: #('Famix-Traits') ];

				package: 'Famix-MetamodelBuilder-Core' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-MetamodelGeneration' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				package: 'Famix-BasicInfrastructure' with: [ spec requires: #('Famix-MetamodelBuilder-Core') ];
				package: 'Famix-Smalltalk-Utils';
				package: 'Famix-Compatibility-Generator' with: [ spec requires: #('Famix-BasicInfrastructure') ];
				package: 'Famix-Compatibility-Entities' with: [ spec requires: #('Famix-Traits' 'Famix-Smalltalk-Utils') ];
				package: 'Famix-Compatibility-Entities-Extensions' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Moose-GenericImporter' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Moose-SmalltalkImporter' with: [ spec requires: #('Moose-GenericImporter' 'RoelTyper' 'Famix-BasicInfrastructure') ];
				package: 'Famix-PharoSmalltalk-Generator' with: [ spec requires: #('Basic') ];
				package: 'Famix-PharoSmalltalk-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Smalltalk-Utils' 'Famix-Traits') ];
				package: 'Famix-PharoSmalltalk-Entities-Extensions' with: [ spec requires: #('Famix-PharoSmalltalk-Entities') ];
				package: 'Famix-PharoSmalltalk-Importer' with: [ spec requires: #('Famix-PharoSmalltalk-Entities' 'Moose-SmalltalkImporter') ];
				package: 'Famix-PharoSmalltalk-Tests' with: [ spec requires: #('Famix-PharoSmalltalk-Entities' 'Famix-Test1-Entities' 'Moose-Core') ];

				package: 'Famix-Java-Generator' with: [ spec requires: #('Basic') ];
				package: 'Famix-Java-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Java-Entities-Extensions' with: [ spec requires: #('Famix-Java-Entities') ];
				package: 'Moose-TestResources-LAN';
				package: 'Moose-TestResources-LCOM';
				package: 'Moose-Query-Test' with: [ spec requires: #('Moose-Query' 'Famix-Compatibility-Entities') ];
				package: 'Moose-Tests-Core' with: [ spec requires: #('Famix-Compatibility-Entities' 'Famix-Compatibility-Generator' 'Moose-SmalltalkImporter' 'ReferenceTestResources') ];
				package: 'Famix-Groups-Tests' with: [ spec requires: #('Famix-Groups' 'Moose-Tests-Core') ];
				package: 'Famix-Smalltalk-Utils-Tests' with: [ spec requires: #('Famix-Smalltalk-Utils') ];
				package: 'Moose-Tests-SmalltalkImporter-LAN' with: [ spec requires: #('Moose-Tests-Core' 'Moose-TestResources-LAN' 'Moose-SmalltalkImporter') ];
				package: 'Moose-Tests-SmalltalkImporter-Core' with: [ spec requires: #('Moose-Tests-SmalltalkImporter-LAN') ];
				package: 'Moose-Tests-SmalltalkImporter-KGB' with: [ spec requires: #('Moose-Tests-Core' 'KGBTestResources' 'Moose-SmalltalkImporter') ];
				package: 'Famix-Compatibility-Tests-C' with: [ spec requires: #('Famix-Compatibility-Entities') ];
				package: 'Famix-Compatibility-Tests-Java' with: [ spec requires: #('Moose-Tests-Core') ];
				package: 'Famix-Compatibility-Tests-Core' with: [ spec requires: #('Famix-Compatibility-Entities' 'Moose-Tests-SmalltalkImporter-LAN' 'Moose-Tests-SmalltalkImporter-KGB') ];
				package: 'Famix-Compatibility-Tests-Extensions' with: [ spec requires: #('Famix-Compatibility-Entities' 'PackageBlueprintTestResources' 'Moose-TestResources-LCOM' 'Moose-Tests-Core') ];
				package: 'Famix-TestGenerators' with: [ spec requires: #('Basic') ];
				package: 'Famix-MetamodelBuilder-Tests' with: [ spec requires: #('Famix-TestGenerators') ];
				package: 'Famix-Test1-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test1-Tests' with: [ spec requires: #('Famix-Test1-Entities') ];
				package: 'Famix-Test2-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits' 'Famix-Test1-Entities') ];
				package: 'Famix-Test2-Tests' with: [ spec requires: #('Famix-Test2-Entities') ];
				package: 'Famix-Test3-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test3-Tests' with: [ spec requires: #('Famix-Test3-Entities') ];
				package: 'Famix-Test4-Entities' with: [ spec requires: #('Famix-MetamodelBuilder-Core' 'Famix-Traits') ];
				package: 'Famix-Test4-Tests' with: [ spec requires: #('Famix-Test4-Entities') ];
				package: 'Famix-TestComposedSubmetamodel1-Entities' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-TestComposedSubmetamodel2-Entities' with: [ spec requires: #('Famix-Traits') ];
				package: 'Famix-TestComposedMetamodel-Entities' with: [ spec requires: #('Famix-Test2-Entities' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedSubmetamodel2-Entities') ];
				package: 'Famix-TestComposedMetamodel' with: [ spec requires: #('Famix-TestComposedMetamodel-Entities') ].

			"Groups"
			spec
				group: 'Core' with: #('Famix-Traits' 'Famix-Traits-Extensions' 'Moose-Query-Extensions');
				group: 'Basic' with: #('Famix-BasicInfrastructure' 'Famix-MetamodelGeneration');
				group: 'TestsResources' with: #('ReferenceTestResources' 'Moose-TestResources-LAN' 'Moose-TestResources-LCOM' 'KGBTestResources' 'PackageBlueprintTestResources');
				group: 'ModelCompatibility' with: #('Famix-Compatibility-Generator' 'Famix-Compatibility-Entities' 'Famix-Compatibility-Entities-Extensions' );
				group: 'ModelJava' with: #('Famix-Java-Generator' 'Famix-Java-Entities' 'Famix-Java-Entities-Extensions');
				group: 'ModelSmalltalk' with: #('Famix-PharoSmalltalk-Generator' 'Famix-PharoSmalltalk-Entities' 'Famix-PharoSmalltalk-Importer' 'Famix-PharoSmalltalk-Entities-Extensions');
				group: 'Importers' with: #('Moose-GenericImporter' 'Moose-SmalltalkImporter');
				group: 'Tests'
					with:
					#('Moose-Query-Test' 'Moose-Tests-Core' 'Famix-Smalltalk-Utils-Tests' 'Moose-Tests-SmalltalkImporter-LAN' 'Moose-Tests-SmalltalkImporter-Core' 'Moose-Tests-SmalltalkImporter-KGB' 'Famix-Groups-Tests' 'Famix-Compatibility-Tests-C' 'Famix-Compatibility-Tests-Java' 'Famix-Compatibility-Tests-Core' 'Famix-Compatibility-Tests-Extensions' 'Famix-PharoSmalltalk-Tests' 'Famix-TestGenerators' 'Famix-MetamodelBuilder-Tests' 'Famix-Test1-Entities' 'Famix-Test1-Tests' 'Famix-Test2-Entities' 'Famix-Test2-Tests' 'Famix-Test3-Entities' 'Famix-Test3-Tests' 'Famix-Test4-Entities' 'Famix-Test4-Tests' 'Famix-TestComposedSubmetamodel1-Entities' 'Famix-TestComposedSubmetamodel2-Entities' 'Famix-TestComposedMetamodel-Entities' 'Famix-TestComposedMetamodel') ].

	"We need different versions of Ring for Pharo 7 and 8."
	spec
		for: #'pharo7.x'
		do: [ spec
				baseline: 'Ring2'
				with: [ spec
						loads: 'runtimeSupport';
						repository: 'github://pavel-krivanek/Ring2:v1.2.0/src' ].
			spec
				package: 'Famix-MetamodelBuilder-Core'
					with: [ spec
						includes: #('Famix-MetamodelBuilder-Core-Pharo7');
						requires: #('Ring2') ];
				package: 'Famix-MetamodelBuilder-Core-Pharo7' ].

	spec
		for: #'pharo8.x'
		do: [ spec
				baseline: 'Ring2'
				with: [ spec
						loads: 'runtimeSupport';
						repository: 'github://pavel-krivanek/Ring2:RGPackageRenamed/src' ].
			spec package: 'Famix-MetamodelBuilder-Core' with: [ spec requires: #('Ring2') ] ]
]

{ #category : #dependencies }
BaselineOfFamix >> collectionExtensions: spec [
	spec baseline: 'CollectionExtensions' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> deepTraverser: spec [
	spec baseline: 'DeepTraverser' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> fame: spec [
	spec baseline: 'Fame' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> kgbTestResources: spec [
	spec baseline: 'KGBTestResources' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> neoCSV: spec [
	spec baseline: 'NeoCSV' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> packageBlueprintTestResources: spec [
	spec baseline: 'PackageBlueprintTestResources' with: [ spec repository: repository ]
]

{ #category : #accessing }
BaselineOfFamix >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #dependencies }
BaselineOfFamix >> referenceTestResources: spec [
	spec baseline: 'ReferenceTestResources' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFamix >> roelTyper: spec [
	spec baseline: 'RoelTyper' with: [ spec repository: repository ]
]
