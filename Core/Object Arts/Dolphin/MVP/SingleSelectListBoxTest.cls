"Filed out from Dolphin Smalltalk 7"!

ListBoxTest subclass: #SingleSelectListBoxTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SingleSelectListBoxTest guid: (GUID fromString: '{8E5A59A5-F500-4D07-9EA2-B1019C9302B2}')!
SingleSelectListBoxTest comment: ''!
!SingleSelectListBoxTest categoriesForClass!Unclassified! !
!SingleSelectListBoxTest methodsFor!

testSelectionModeChange
	| objects |
	self deny: presenter view isMultiSelect.
	objects := self objectsToTest.
	presenter model addAll: objects.
	self assert: presenter hasSelection not.
	self assert: presenter selectionOrNil isNil.
	"Must trigger a selection change when switching to multi-select, as otherwise observers do not know the mode change has occurred."
	self 
		should: [presenter view isMultiSelect: true]
		trigger: #selectionChanged
		against: presenter.
	self assert: presenter hasSelection not.
	self assert: presenter selectionOrNil isNil.
	self assert: presenter view selectionMode == #multi.
	self 
		shouldnt: [presenter view selectionMode: #toggle]
		trigger: #selectionChanged
		against: presenter.
	self 
		shouldnt: [presenter view selectionMode: #multi]
		trigger: #selectionChanged
		against: presenter.
	self 
		should: [presenter view isMultiSelect: false]
		trigger: #selectionChanged
		against: presenter.
	presenter selection: objects second.
	self assert: presenter view selectionsByIndex = #(2).
	self should: [presenter view getMultipleSelections] raise: Error.
	self 
		should: [presenter view isMultiSelect: true]
		trigger: #selectionChanged
		against: presenter.
	"#115: Changing list box selection mode fails if there are selections"
	self assert: presenter view selectionsByIndex = #(2)! !
!SingleSelectListBoxTest categoriesFor: #testSelectionModeChange!public!unit tests! !

!SingleSelectListBoxTest class methodsFor!

classToTest
	^ListPresenter! !
!SingleSelectListBoxTest class categoriesFor: #classToTest!helpers!private! !
