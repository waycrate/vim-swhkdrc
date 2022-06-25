if exists("b:current_syntax")
    finish
endif

syntax include @Shell syntax/sh.vim

syn match swComment "^#.*$"
syn match swHotkey "[^ #].*" contains=swKeysym,swModifier,swHotkeySep,swSequence,swInlineComment,swIgnore
syn match swCommand "\v^\s+.*$" containedin=ALL contains=@Shell,swSequenceShell,swInternalCmd
syn match swModifier "\v\c(super|hyper|meta|alt|control|ctrl|shift|mode_switch|lock|mod1|mod2|mod3|mod4|mod5|any)" contained
syn match swKeysym "[^ :;{,}+-]\+" contained contains=swAction,swModifier
syn match swAction "[@~/]" contained
syn match swHotkeySep "[;:+]" contained
syn match swSequenceSep "[,-]" contained
syn match swImport "^include" contained
syn match swImportPath "\v^<include>.*" contains=swImport
syn match swIgnore "^ignore" contained
syn match swModeDef "^mode" contained
syn match swModeName "\v^<mode>.*" contains=swModeDef
syn match swModeEnd "^endmode"
syn match swInternalCmd "\v\@(enter|escape)(\s|$)"
syn region swSequence matchgroup=swBrace start=/{/ end=/}/ contained keepend oneline contains=swKeysym,swModifier,swHotkeySep,swSequenceSep
syn region swSequenceShell matchgroup=swBrace start=/{/ end=/}/ contained keepend oneline
syn region swInlineComment start="#" end="$" contained

hi def link swComment Comment
hi def link swInlineComment Comment
hi def link swModifier Type
hi def link swKeysym Identifier
hi def link swAction Special
hi def link swBrace Special
hi def link swHotkeySep Delimiter
hi def link swSequenceSep Delimiter
hi def link swImport Type
hi def link swImportPath String
hi def link swModeDef TypeDef
hi def link swModeEnd TypeDef
hi def link swModeName Function
hi def link swInternalCmd TypeDef
hi def link swIgnore Type

let b:current_syntax = "swhkdrc"
