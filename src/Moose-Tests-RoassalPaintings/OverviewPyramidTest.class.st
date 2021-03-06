"
An OverviewPyramidTest is a test class for testing the behavior of OverviewPyramid
"
Class {
	#name : #OverviewPyramidTest,
	#superclass : #MooseTestWithSmalltalkDependency,
	#category : #'Moose-Tests-RoassalPaintings-OverviewPyramid'
}

{ #category : #helpers }
OverviewPyramidTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #helpers }
OverviewPyramidTest >> prepareAnyMooseModel [

	| model importer models |
	
	models := MooseModel root allModels.
	models notEmpty ifTrue: [ ^ models anyOne ].
	model := MooseModel new.
	model name: 'AST'.
	importer := self newPharoImporterTask.
	importer importingContext mergeClassAndMetaclass.
	importer runCandidateOperator.
	importer model: model; addFromPackagesNamed: (MooseScripts packageNamesFor: 'AST*'); runWithProgress.
	^ model.
]

{ #category : #tests }
OverviewPyramidTest >> testOpen [

	| model |
	model := self prepareAnyMooseModel.
	self shouldnt: (OverviewPyramid on: model) open delete raise: Error.
]

{ #category : #tests }
OverviewPyramidTest >> testoverviewPyramidMetrics [
	self assert: (self model overviewPyramidMetrics isKindOf: OverviewPyramidMetrics)
]
