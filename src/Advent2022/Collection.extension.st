Extension { #name : #Collection }

{ #category : #'*Advent2022' }
Collection >> product [

	^ self inject: 1 into: [ :a :b | a * b]
]
