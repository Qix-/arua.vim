" Vim syntax file for the Arua language
" Language: Arua
" Maintainer: Joshua Junon
" Latest Revision: 2016-10-07

if exists("b:current_syntax")
	finish
endif

syn sync fromstart

" Tricky Indent Stuff
syn match   aruaDecl                /\v<[^.][a-z_][a-zA-Z0-9_]*\s+([&!]*\[*[&!]*((bool|str|[uif][1-9][0-9]*)>|(\*|[A-Z][a-zA-Z0-9_]*)(\.(\*|[A-Z][a-zA-Z0-9_]*))*)\]*)*/ contains=aruaIdentifier,aruaType

" Identifiers and Types
syn match   aruaIdentifier          /\v[a-z_][a-zA-Z0-9_]*/ contained
syn match   aruaType                /\v[&!]*\[*[&!]*((bool|str|[uif][1-9][0-9]*)>|(\*|[A-Z][a-zA-Z0-9_]*)(\.(\*|[A-Z][a-zA-Z0-9_]*))*)\]*/ nextgroup=aruaTypeTemplate
syn region  aruaTypeTemplate        start=/\v\</ end=/\v\>/ contains=aruaType
syn match   aruaConstant            /\v<[A-Z_][A-Z0-9_]*>/

" Comments
syn match   aruaSourceComment       /\v\#[^\r\n]*/ skipwhite
syn match   aruaHeaderComment       /\v\#\#[^\r\n]*/ skipwhite
syn match   aruaDocComment          /\v\#:[^\r\n]*/ skipwhite

" Keywords
syn keyword aruaPubKeyword          pub nextgroup=aruaIdentKeyword,aruaTypeKeyword,aruaIdentifier skipwhite
syn keyword aruaIdentKeyword        as fn nextgroup=aruaIdentifier skipwhite
syn keyword aruaTypeKeyword         use enum trait struct on be type alias nextgroup=aruaType skipwhite
syn keyword aruaRepeatKeyword       for in while do with continue break 
syn keyword aruaConditionalKeyword  if then else case switch next ret or and not
syn match   aruaThisKeyword         /\v\@\.?[a-zA-Z_][a-zA-Z0-9_]*/

" Numerics
syn match   aruaNumericType         /\v<[iuf][1-9][0-9]*>/
syn match   aruaIntegerSuffix       /\v[ui][1-9][0-9]*/ contained
syn match   aruaInteger             /\v<[+-]?[0-9]+>/ nextgroup=aruaIntegerSuffix
syn match   aruaFloatSuffix         /\vf[1-9][0-9]*/ contained
syn match   aruaFloat               /\v<[+-]?(([1-9][0-9]*\.([1-9][0-9]*)?)|(([1-9][0-9]*)?\.[1-9][0-9]*))(e[+-]?[1-9][0-9]*)?/ nextgroup=aruaFloatSuffix

" Strings
syn region  aruaStringContainer     matchgroup=aruaString start=/\v"/ end=/\v"/ contains=aruaStringInterp,aruaStringEscape,aruaNormalChar
syn match   aruaNormalChar          /\v[^\\"]/ contained
syn match   aruaStringEscape        /\v\\([ertfvbn"\\'0]|x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})/ contained
syn region  aruaStringInterp        matchgroup=aruaStringInterpDelim start=/\v\#\{/ end=/\v\}/ contained contains=@aruaInterp

" Operators
syn match   aruaOperator            /\v\=\=?/
syn match   aruaOperator            /\v[<>!/*+%&|^-]\=?/
syn match   aruaSpecialOperator     /\v[[\](),]/

" aruaAll cluster
syn cluster aruaInterp              contains=aruaIdentKeyword,aruaRepeatKeyword,aruaConditionalKeyword,
\                                            aruaThisKeyword,aruaStringContainer,aruaOperator,aruaInteger,
\                                            aruaNumericType,aruaConstant,aruaFloat,aruaSpecialOperator

hi link     aruaPubKeyword          aruaKeyword
hi link     aruaIdentKeyword        aruaKeyword
hi link     aruaTypeKeyword         aruaKeyword
hi link     aruaNormalChar          aruaString

hi link     aruaSourceComment       Comment
hi link     aruaHeaderComment       Delimiter
hi link     aruaDocComment          SpecialComment
hi link     aruaKeyword             Keyword
hi link     aruaRepeatKeyword       Repeat
hi link     aruaConditionalKeyword  Conditional
hi link     aruaOperator            Operator
hi link     aruaSpecialOperator     SpecialChar
hi link     aruaThisKeyword         Identifier
hi link     aruaIdentifier          Identifier
hi link     aruaType                Type
hi link     aruaTypeTemplate        Type
hi link     aruaString              String
hi link     aruaStringEscape        SpecialChar
hi link     aruaStringInterpDelim   Delimiter
hi link     aruaStringInterp        Normal
hi link     aruaConstant            Constant
hi link     aruaNumericType         Type
hi link     aruaInteger             Number
hi link     aruaFloat               Float
hi link     aruaIntegerSuffix       Type
hi link     aruaFloatSuffix         Type

let b:current_syntax = "arua"
