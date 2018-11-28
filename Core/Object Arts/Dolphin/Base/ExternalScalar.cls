﻿"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #ExternalScalar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ExternalScalar guid: (GUID fromString: '{704554ca-46f7-49b2-92df-edcbe398040a}')!
ExternalScalar isAbstract: true!
ExternalScalar comment: ''!
!ExternalScalar categoriesForClass!External-Data-Structured! !
!ExternalScalar methodsFor!

= anObject
	"Answer whether the receiver is equivalent to anObject."

	^anObject = self value!

displayOn: target
	"Append a textual representation of the receiver onto the <puttableStream> argument,
	target, in the format that an end-user might want to see it."

	target display: (self isNull ifFalse: [self value])!

value
	"Answer the receiver's value as a Smalltalk object of the appropriate scalar type for the subclass."

	^self subclassResponsibility!

value: anObject
	"Set the receiver's value field to the value of anObject."

	^self subclassResponsibility! !
!ExternalScalar categoriesFor: #=!comparing!public! !
!ExternalScalar categoriesFor: #displayOn:!printing!private! !
!ExternalScalar categoriesFor: #value!converting!public! !
!ExternalScalar categoriesFor: #value:!public! !

!ExternalScalar class methodsFor!

getFieldList
	^#(#value)! !
!ExternalScalar class categoriesFor: #getFieldList!constants!private! !
