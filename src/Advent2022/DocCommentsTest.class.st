Class {
	#name : #DocCommentsTest,
	#superclass : #TestCase,
	#category : #'Advent2022-Test'
}

{ #category : #'building suites' }
DocCommentsTest class >> buildSuite [
	| suite methods |
	suite := TestSuite named: 'Test Generated From Comments'.
	"we do not run examples in tests (as they are used just for testing and might be broken by
	design"
	methods := self package methods reject: [ :method | method methodClass isTestCase ].
	"for now skip all class side methods to be in sync with DrTests"
	methods do: [ :method | 
		method pharoDocCommentNodes do: [ :docComment | 
			suite addTest: (CommentTestCase for: docComment) ] ].
	"make sure to clean up the AST Cache to allow the GC to clean up"
	ASTCache reset.
	^ suite
]
