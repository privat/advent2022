Class {
	#name : #Cellular,
	#superclass : #Object,
	#instVars : [
		'cells',
		'abyss'
	],
	#category : #Advent2022
}

{ #category : #accessing }
Cellular >> abyss [
	^ abyss
]

{ #category : #accessing }
Cellular >> at: aPoint put: aValue [

	^ cells at: aPoint put: aValue
]

{ #category : #'as yet unclassified' }
Cellular >> bellowOf: aPoint [

	| try |
	aPoint y > abyss ifTrue: [ ^ nil ].
	try := aPoint + (0@1).
	cells at: try ifAbsent: [ ^try ].
	
	try := aPoint + (-1@1).
	cells at: try ifAbsent: [ ^try ].

	try := aPoint + (1@1).
	cells at: try ifAbsent: [ ^try ].
	
	^ aPoint.
]

{ #category : #'as yet unclassified' }
Cellular >> fallFrom: aPoint [

	| current next |
	current := aPoint.
	
	[
		next := self bellowOf: current.
		next ifNil: [ ^ nil ].
		next = current ifTrue: [ ^ current ].
		current := next.
		true.
	] whileTrue.

]

{ #category : #initialization }
Cellular >> initialize [ 

	cells := Dictionary new.
]

{ #category : #'as yet unclassified' }
Cellular >> rockFrom: from to: to [

	from to: to by: (to-from) sign do: [ :x | self at: x put: $#].
	abyss := { abyss ifNil: [from y]. from y. to y } max.
]
