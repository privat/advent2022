Class {
	#name : #Monkey,
	#superclass : #Object,
	#instVars : [
		'id',
		'items',
		'operation',
		'operand',
		'test',
		'ifTrue',
		'ifFalse',
		'activity',
		'modulo'
	],
	#category : #Advent2022
}

{ #category : #accessing }
Monkey >> activity [

	^ activity
]

{ #category : #accessing }
Monkey >> activity: anObject [

	activity := anObject
]

{ #category : #accessing }
Monkey >> id [

	^ id
]

{ #category : #accessing }
Monkey >> id: anObject [

	id := anObject
]

{ #category : #accessing }
Monkey >> ifFalse [

	^ ifFalse
]

{ #category : #accessing }
Monkey >> ifFalse: anObject [

	ifFalse := anObject
]

{ #category : #accessing }
Monkey >> ifTrue [

	^ ifTrue
]

{ #category : #accessing }
Monkey >> ifTrue: anObject [

	ifTrue := anObject
]

{ #category : #initialization }
Monkey >> initialize [

	items := OrderedCollection new.
	activity := 0.
]

{ #category : #accessing }
Monkey >> items [

	^ items
]

{ #category : #accessing }
Monkey >> items: anObject [

	items := anObject
]

{ #category : #accessing }
Monkey >> modulo [

	^ modulo
]

{ #category : #accessing }
Monkey >> modulo: anObject [

	modulo := anObject
]

{ #category : #accessing }
Monkey >> operand [

	^ operand
]

{ #category : #accessing }
Monkey >> operand: anObject [

	operand := anObject
]

{ #category : #accessing }
Monkey >> operation [

	^ operation
]

{ #category : #accessing }
Monkey >> operation: anObject [

	operation := anObject
]

{ #category : #stepping }
Monkey >> step [

	| item next |
	item := items removeFirst.
	activity := activity + 1.

	item := item perform: operation with: (operand ifNil: [ item ]).

	modulo
		ifNil: [ "part 1" item := item // 3 ]
		ifNotNil: [ "part 2" item := item \\ modulo ].

	next := item \\ test = 0
		        ifTrue: [ ifTrue ]
		        ifFalse: ifFalse.
	next items add: item
]

{ #category : #private }
Monkey >> steps [

	[ items isEmpty ] whileFalse: [  self step ].
]

{ #category : #accessing }
Monkey >> test [

	^ test
]

{ #category : #accessing }
Monkey >> test: anObject [

	test := anObject
]
