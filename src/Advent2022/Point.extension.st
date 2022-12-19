Extension { #name : #Point }

{ #category : #'*Advent2022' }
Point >> to: to by: by do: aBlock [

	| current |
	current := self.
	[ (current * by) <= (to * by) ] whileTrue: [ 
		aBlock value: current.
		current := current + by.
	]
]
