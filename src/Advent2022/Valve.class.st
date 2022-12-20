Class {
	#name : #Valve,
	#superclass : #Object,
	#instVars : [
		'name',
		'rate',
		'distances',
		'neighbors',
		'bit'
	],
	#category : #Advent2022
}

{ #category : #accessing }
Valve >> bit [

	^ bit
]

{ #category : #accessing }
Valve >> bit: anObject [

	bit := anObject
]

{ #category : #accessing }
Valve >> distances [

	^ distances
]

{ #category : #accessing }
Valve >> distances: anObject [

	distances := anObject
]

{ #category : #accessing }
Valve >> name [

	^ name
]

{ #category : #accessing }
Valve >> name: anObject [

	name := anObject
]

{ #category : #accessing }
Valve >> neighbors [

	^ neighbors
]

{ #category : #accessing }
Valve >> neighbors: anObject [

	neighbors := anObject
]

{ #category : #printing }
Valve >> printOn: aStream [

	super printOn: aStream.
	aStream space.
	aStream nextPutAll: name.
]

{ #category : #accessing }
Valve >> rate [

	^ rate
]

{ #category : #accessing }
Valve >> rate: anObject [

	rate := anObject
]
