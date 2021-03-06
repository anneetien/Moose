Class {
	#name : #TypeCollectorTest,
	#superclass : #TestCase,
	#category : #'RoelTyper-Tests-Tests'
}

{ #category : #'typing tests' }
TypeCollectorTest >> methodWithTmpInBlock: anObject [
	|some fancy variables|
	some := 1.
	fancy := 'hola'.
	variables := #sexSymbol.
	[ |l| l := true. l ] whileFalse: [ ].
	^ self
]

{ #category : #'typing tests' }
TypeCollectorTest >> testOnBehavior [

	self shouldnt: (TypeCollector typeInstvar:  #'superclass' ofClassWithLookup: Behavior) raise: Error
]

{ #category : #'typing tests' }
TypeCollectorTest >> testOnTmpVarContainedInBlock [

	self shouldnt: (TypeCollector typeTmpsIn: (self class >> #methodWithTmpInBlock:)
		ofClass: self class) raise: Error
]

{ #category : #'typing tests' }
TypeCollectorTest >> testPoint [
	| types xTypes yTypes |
	types := TypeCollector typeInstvarsOfClass: Point.
	xTypes := types at: #x.
	self assert: ((xTypes is: Number) or: [xTypes is: Integer]).
	yTypes := types at: #y.
	self assert: ((yTypes is: Number) or: [yTypes is: Integer])
]
