Class {
	#name : #FAMIXStructuralEntity,
	#superclass : #FAMIXLeafEntity,
	#traits : 'FamixTAccessible + FamixTTypedStructure + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTAccessible classTrait + FamixTTypedStructure classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #FAMIXLeafEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXStructuralEntity class >> generatedSlotNames [
	<generated>
	'FAMIXStructuralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXStructuralEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTAccessible FamixTTypedStructure FamixTWithDereferencedInvocations)
]

{ #category : #meta }
FAMIXStructuralEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Extensions' }
FAMIXStructuralEntity >> accept: aVisitor [

	aVisitor visitStructuralEntity: self
]

{ #category : #'Famix-Extensions' }
FAMIXStructuralEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self declaredType: (aVisitor visit: anEntity declaredType).

]

{ #category : #'as yet unclassified' }
FAMIXStructuralEntity >> entityHasOutgoingTypeDeclarations [
	^ self declaredType isNotNil
]

{ #category : #'Famix-Extensions' }
FAMIXStructuralEntity >> hasDeclaredType [
	^ self declaredType notNil
]

{ #category : #'Famix-Extensions' }
FAMIXStructuralEntity >> isSharedVariable [

	^ false
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> namespaceScope [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FAMIXStructuralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> packageScope [

	| cs |
	cs := self typeScope.
	
	^ (cs isNil) ifTrue: [nil] ifFalse: [cs packageScope]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXStructuralEntity >> typeScope [

	^ self belongsTo typeScope 
]
