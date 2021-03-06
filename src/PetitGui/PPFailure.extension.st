Extension { #name : #PPFailure }

{ #category : #'*PetitGui' }
PPFailure >> debugResult [
	context ifNil: [ ^ nil ].
	context root ifNil: [ ^ nil ].
	
	^ context root enableDebug parse: context stream reset
]

{ #category : #'*PetitGui' }
PPFailure >> gtDebugView: composite [
	<gtInspectorPresentationOrder: 40>

	| browser |
	browser := 
		composite tabulator.

	browser title: 'Debug View'.
	browser row: #tree;
			  row: #source.
	browser transmit 
		fromOutsideEntityPort; 
		toOutsidePort: #debugResult;
		transformed: [ :failure | failure debugResult  ].
				
	browser transmit 
		from: #tree;
		to: #source port: #selectionInterval;
		transformed: [:debuggingResult |
			debuggingResult ifNotNil: [
			debuggingResult start to: debuggingResult end]
		].

	browser transmit
		fromOutsidePort: #debugResult;
		to: #source;
		andShow: [ :a |  self sampleIn: a ].
	
	browser transmit 
		fromOutsidePort: #debugResult;
		to: #tree;
		andShow: [ :a | self treeViewIn: a ].
		
	browser startOn: self
]

{ #category : #'*PetitGui' }
PPFailure class >> gtExampleEmptyMessage [
	<gtExample>
	<label: 'Failure: empty'>
	
	^ self message: ''
]

{ #category : #'*PetitGui' }
PPFailure class >> gtExampleNumberExpected [
	<gtExample>
	<label: 'Failure: Number expected'>
	
	^ #digit asParser plus parse: 'a'
]

{ #category : #'*PetitGui' }
PPFailure >> sampleIn: composite [

	(composite text)
		title: 'Sample';
		display: [:res | res findStream contents ifNil: [''] ];
		allowNil.
]

{ #category : #'*PetitGui' }
PPFailure >> treeViewIn: composite [
	composite tree
		title: 'Execution Traces';
		format: [:resultNode | resultNode formattedText ];
		children: [:resultNode | resultNode children ]. 
]
