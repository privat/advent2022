Class {
	#name : #IntervalSet,
	#superclass : #Collection,
	#instVars : [
		'contents',
		'clamp'
	],
	#category : #Advent2022
}

{ #category : #initialization }
IntervalSet >> add: from to: to [

	"(IntervalSet new add: 1 to: 3; asArray) >>> {1. 2. 3}"
	"(IntervalSet new add: 1 to: 3; add: 5 to: 6; asArray) >>> {1. 2. 3. 5. 6}"
	"(IntervalSet new add: 5 to: 6; add: 1 to: 3; asArray) >>> {1. 2. 3. 5. 6}"

	"(IntervalSet new add: 1 to: 2; add: 2 to: 3; asArray) >>> {1. 2. 3.}"
	"(IntervalSet new add: 1 to: 2; add: 1 to: 3; asArray) >>> {1. 2. 3.}"
	"(IntervalSet new add: 1 to: 2; add: 0 to: 3; asArray) >>> {0. 1. 2. 3.}"

	"(IntervalSet new add: 1 to: 2; add: 4 to: 5; add: 2 to: 4; asArray) >>> {1. 2. 3. 4. 5}"
	"(IntervalSet new add: 1 to: 2; add: 4 to: 5; add: 0 to: 6; asArray) >>> {0. 1. 2. 3. 4. 5. 6}"

	| newContent f t added |
	newContent := OrderedCollection new.
	f := from max: clamp first.
	t := to min: clamp last.
	added := false.
	contents do: [ :i | 
		(i first > t and: [ added not ]) ifTrue: [ 
			newContent add: (f to: t).
			added := true ].
		(i last < f or: [ i first > t ])
			ifTrue: [ newContent add: i ]
			ifFalse: [ 
				f := f min: i first.
				t := t max: i last. ] ].
	added ifFalse: [ newContent add: (f to: t) ].
	contents := newContent.
]

{ #category : #accessing }
IntervalSet >> clamp: anInterval [
	
	clamp := anInterval
]

{ #category : #enumerating }
IntervalSet >> do: aBlock [

	contents do: [ :i | i do: aBlock ].
]

{ #category : #initialization }
IntervalSet >> initialize [ 

	contents := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
IntervalSet >> intervals [

	^ contents copy
]

{ #category : #accessing }
IntervalSet >> size [

	^ contents sum: #size.
]
