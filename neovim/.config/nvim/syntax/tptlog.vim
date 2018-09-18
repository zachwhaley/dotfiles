" Vim syntax file
" Language: TippingPoint log files
" Maintainer: Zachary Whaley <Zachary_Whaley@trendmicro.com>

if exists("b:current_syntax")
  finish
endif

syn keyword tptlogError ERROR CRIT

syn match tptlogIP contained '\(\d\{1,3\}[.]\)\{3\}\(\d\{1,3\}\)'
syn match tptlogURL contained '\w\+://\S\+'
syn match tptlogUUID contained '[0-9a-f]\{8\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{4\}-[0-9a-f]\{12\}'
syn match tptlogVersion contained '\(\d\+[.]\)\{3\}\d\+i\='

syn match tptlogBegin display '^' nextgroup=tptlogNumber
syn match tptlogNumber contained display '\d\+\s*' nextgroup=tptlogTimeStamp,tptlogDate,tptlogDateRFC3339

syn match tptlogTimeStamp contained display '\d\+\.\d\+\s*' nextgroup=tptlogHost

syn match tptlogDate contained display '[[:lower:][:upper:]][[:lower:][:upper:]][[:lower:][:upper:]] [ 0-9]\d *' nextgroup=tptlogHour
syn match tptlogHour contained display '\d\d:\d\d:\d\d\s*' nextgroup=tptlogHost

syn match tptlogDateRFC3339 contained display '\d\{4}-\d\d-\d\d\s*' nextgroup=tptlogRFC3339T,tptlogHourRFC3339
syn match tptlogRFC3339T contained display '\cT' nextgroup=tptlogHourRFC3339
syn match tptlogHourRFC3339 contained display '\c\d\d:\d\d:\d\d\.\d\+\s*' nextgroup=tptlogHost

syn match tptlogHost contained display '\S*\s*' nextgroup=tptlogLabel
syn match tptlogLabel contained display '\s*[^:]*:\s*' nextgroup=tptlogText contains=tptlogError
syn match tptlogText contained display '.*' contains=tptlogIP,tptlogURL,tptlogUUID,tptlogVersion

hi def link tptlogNumber Comment
hi def link tptlogTimeStamp Number
hi def link tptlogDate Constant
hi def link tptlogHour Type
hi def link tptlogDateRFC3339 Constant
hi def link tptlogHourRFC3339 Type
hi def link tptlogRFC3339T Normal
hi def link tptlogHost Identifier
hi def link tptlogLabel Type
hi def link tptlogText Normal
hi def link tptlogError ErrorMsg
hi def link tptlogIP Constant
hi def link tptlogURL Underlined
hi def link tptlogUUID Constant
hi def link tptlogVersion Constant

let b:current_syntax = "tptlog"
