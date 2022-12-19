Extension { #name : #SequenceableCollection }

{ #category : #'*Advent2022' }
SequenceableCollection >> splitOnAny: aCollection [

	^ self splitOn: [ :e | aCollection includes: e ]
]
