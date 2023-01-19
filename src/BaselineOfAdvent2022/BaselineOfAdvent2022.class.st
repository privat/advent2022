Class {
	#name : #BaselineOfAdvent2022,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdvent2022
}

{ #category : #baselines }
BaselineOfAdvent2022 >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'Advent2022' ]
]
