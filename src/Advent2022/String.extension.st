Extension { #name : #String }

{ #category : #'*Advent2022' }
String >> asArray2D [

	| nbRows nbCols data |
	nbRows := self lineCount.
	nbCols := self size / nbRows - 1.
	data := self select: [ :c | c ~= Character cr ].
	^ Array2D rows: nbRows columns: nbCols contents: data.

]

{ #category : #'*Advent2022' }
String >> asPoint [

	| parsee |
	parsee := self splitOnAny: ',@;'.
	self assert: parsee size = 2.
	^ parsee first asInteger @ parsee second asInteger
]
