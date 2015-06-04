SECTION .data		;	data section: All constants are defined here
ln:	db "",0xa
lenLn:	equ $-ln

yParam: db "-y",0
lenY: equ $-yParam
dParam: db "-d",0
lenD: equ $-dParam

errorMessage: db "Error: Falta un argumento", 0xa
lenError: equ $-errorMessage

errorMessage2: db "Error: Hay demasiados argumentos", 0xa
lenError2: equ $-errorMessage2

errorMessage3: db "Error: Opción inválida, por favor revise los argumentos", 0xa
lenError3: equ $-errorMessage3

errorMessage4: db "Error: Solo números son aceptados en el segundo argumento", 0xa
lenError4: equ $-errorMessage4

errorMessage5: db "Error: La longitud del segundo argumento es inválida", 0xa
lenError5: equ $-errorMessage5

errorMessage6: db "Error: Fecha inválida", 0xa
lenError6: equ $-errorMessage6

errorMessage7: db "Usted se encuentra fuera de Colombia", 0xa
lenError7: equ $-errorMessage7

errorMessage8: db "El año debe ser igual o superior a 1583", 0xa
lenError8: equ $-errorMessage8

array: times 373 db 20
lenArray: equ $-array
arrayD: times 3 db 0
lenArrayD: equ $-arrayD
arrayDM: times 3 db 0
lenArrayDM: equ $-arrayDM
tArr: db 0,3,2,5,0,3,5,1,4,6,2,4
lentArr: equ $-tArr
header: db "   D     L     M     W     J     V     S", 0xa
lenHeader: equ $-header
spaceNull: db "      ", 0
lenSpaceN: equ $-spaceNull
spaceSimple: db " ",0
lenSpaceS: equ $-spaceSimple
spaceDouble: db "  ",0
lenSpaceD: equ $-spaceDouble
spaceTriple: db "   ",0
lenSpaceT: equ $-spaceTriple
fChar: db "F ", 0
lenFChar: equ $-fChar

january: db "enero",0
lenJanuary: equ $-january
february: db "febrero",0
lenFebruary: equ $-february
march: db "marzo",0
lenMarch: equ $-march
april: db "abril",0
lenApril: equ $-april
may: db "mayo",0
lenMay: equ $-may
june: db "junio",0
lenJune: equ $-june
july: db "julio",0
lenJuly: equ $-july
august: db "agosto",0
lenAugust: equ $-august
september: db "septiembre",0
lenSeptember: equ $-september
october: db "octubre",0
lenOctober: equ $-october
november: db "noviembre",0
lenNovember: equ $-november
december: db "diciembre",0
lenDecember: equ $-december

January: db "Enero",0
LenJanuary: equ $-January
February: db "Febrero",0
LenFebruary: equ $-February
March: db "Marzo",0
LenMarch: equ $-March
April: db "Abril",0
LenApril: equ $-April
May: db "Mayo",0
LenMay: equ $-May
June: db "Junio",0
LenJune: equ $-June
July: db "Julio",0
LenJuly: equ $-July
August: db "Agosto",0
LenAugust: equ $-August
September: db "Septiembre",0
LenSeptember: equ $-September
October: db "Octubre",0
LenOctober: equ $-October
November: db "Noviembre",0
LenNovember: equ $-November
December: db "Diciembre",0
LenDecember: equ $-December

msg: db "El día ",0
lenMsg: equ $-msg

msg2: db " de ",0
lenMsg2: equ $-msg2

msg1: db " es festivo ", 0
lenMsg1: equ $-msg1

msg3: db ", trasladado del ",0
lenMsg3: equ $-msg3

msg5: db " es un día hábil", 0
lenMsg5: equ $-msg5

monday: db "lunes ",0
lenMon: equ $-monday
tuesday: db "martes ",0
lenTue: equ $-tuesday
wednesday: db "miercoles ",0
lenWed: equ $-wednesday
thursday: db "jueves ",0
lenThu: equ $-thursday
friday: db "viernes ",0
lenFri: equ $-friday
saturday: db "sábado ",0
lenSat: equ $-saturday
sunday: db "domingo ",0
lenSun: equ $-sunday

fest1: db "(Año Nuevo)", 0
lenFest1: equ $-fest1
fest2: db "(Jueves Santo)",0
lenFest2: equ $-fest2
fest3: db "(Viernes Santo)",0
lenFest3: equ $-fest3
fest4: db "(Día del Trabajo)",0
lenFest4: equ $-fest4
fest5: db "(Independencia Nacional)",0
lenFest5: equ $-fest5
fest6: db "(Batalla de Boyacá)",0
lenFest6: equ $-fest6
fest7: db "(Inmaculada Concepción)",0
lenFest7: equ $-fest7
fest8: db "(Navidad)",0
lenFest8: equ $-fest8
fest9: db "(Epifanía del Señor)",0
lenFest9: equ $-fest9
fest10: db "(Día de San José)",0
lenFest10: equ $-fest10
fest11: db "(Ascensión del Señor)",0
lenFest11: equ $-fest11
fest12: db "(Corpus Christi)",0
lenFest12: equ $-fest12
fest13: db "(Sagrado Corazón de Jesús)",0
lenFest13: equ $-fest13
fest14: db "(San Pedro y San Pablo)",0
lenFest14: equ $-fest14
fest15: db "(Asunción de la Virgen)",0
lenFest15: equ $-fest15
fest16: db "(Día de la Raza)",0
lenFest16: equ $-fest16
fest17: db "(Todos los Santos)",0
lenFest17: equ $-fest17
fest18: db "(Independencia de Cartagena)",0
lenFest18: equ $-fest18
festD: db "(Domingo)", 0
lenFestD: equ $-festD

tFest9: db ", trasladado del 6 de enero",0
lenTFest9: equ $-tFest9
tFest10: db ", trasladado del 19 de marzo",0
lenTFest10: equ $-tFest10
tFest14: db ", trasladado del 29 de junio",0
lenTFest14: equ $-tFest14
tFest15: db ", trasladado del 15 de agosto",0
lenTFest15: equ $-tFest15
tFest16: db ", trasladado del 12 de octubre",0
lenTFest16: equ $-tFest16
tFest17: db ", trasladado del 1 de noviembre",0
lenTFest17: equ $-tFest17
tFest18: db ", trasladado del 11 de noviembre",0
lenTFest18: equ $-tFest18

nParams: db "",0xa

SECTION .bss		;	bss section: All variables are defined here
countNil: resd 1
address: resd 1
div4: resd 1
div100: resd 1
div400: resd 1
y: resd 1
m: resd 1
d: resd 1
dayofweek: resd 1
i: resd 1
j: resd 1
a: resd 1
b: resd 1
c: resd 1
e: resd 1
f: resd 1
g: resd 1
h: resd 1
k: resd 1
l: resd 1
n: resd 1
dom1: resd 1
dom2: resd 1
dom3: resd 1
countDom: resd 1
countHoly: resd 1
f9: resd 1
f10: resd 1
f11: resd 1
f12: resd 1
f13: resd 1
f14: resd 1
f15: resd 1
f16: resd 1
f17: resd 1
f18: resd 1
monthOfEaster: resd 1
dayOfEaster: resd 1
last: resd 1
index: resd 1
res: resd 1
lenType: resd 1
lenParam: resd 1
year: resd 1
month: resd 1
day: resd 1
digit: resb 16
x: resb 32
utc: resb 4
type: resb 32
param: resb 32
yearS: resb 4
lenPrint: resd 1
monthS: resb 2
some: resd 1
dayS: resb 2

%macro write_string 2		;	Macro to print strings in screen
mov edx, %2
mov ecx, %1
mov eax, 4		; sys_write = 4
mov ebx, 1
int 80h
%endmacro

%macro syscall_exit 0		;	Macro to exit the program
mov eax, 1		; sys_exit = 1
mov ebx, 0
int 80h
%endmacro

SECTION .text		;	text section: All functions and procedures are implemented here
global _start

_start:

pop	eax		; Get the number of arguments
mov [nParams], eax
cmp eax, 1
jz currentYear

cmp eax, 2
jz errorMissingArg

cmp eax, 3
jg errorInvalidArg

mov edi, [esp+4]
call Length
mov [lenType], ecx

mov eax, [esp + 4]		; Validate if the first argument is "-y"
mov ebx, yParam
mov ecx, [lenType]
mov edx, lenY
call strcmp
cmp eax,0
jz isYear

mov eax, [esp + 4]		; Validate if the first argument is "-d"
mov ebx, dParam
mov ecx, [lenType]
mov edx, lenD
call strcmp
cmp eax,0
jz isDay

jmp errorCommandNo


isDay:		; Procedure to determinate if a specific day is holiday or not
pop eax
pop eax
pop	ebx
mov [param], ebx		; Validate if the length of the second argument is 8 (YYYYMMDD)
mov edi, ebx
call Length
mov [lenParam], ecx
cmp ecx, 9
jnz errorLengthI

call getYear
mov edx, yearS		; Validate if the value in the second argument is valid (MM<=12)
call atoi
mov [year], eax
mov edx, monthS
call atoi
mov [month], eax
cmp eax, 12
jg errorInvalidDate

mov edx, dayS		; Validate if the value in the second argument is valid (DD<=31)
call atoi
mov [day], eax
cmp eax, 31
jg errorInvalidDate

mov eax, 78		; Get timeZone from system (sys_gettimeofday = 78)
mov ebx, x
mov ecx, utc
int 80h

mov ebx, [utc]		; Validate if the timeZone is equal to 300 (Colombia)
cmp ebx, 300
jnz .NoColombia

call CalcCalendar
call holidaysOfYear
call HolidayMovement

mov eax, 0
mov [countHoly], eax
mov eax, [month]
dec eax
mov ebx, 31
mul ebx
mov edx, [day]
add eax, edx
mov [address], eax

mov eax, [day]		; January 1 is holiday
mov ebx, [month]
cmp eax, 1
jnz .next

cmp ebx, 1
jnz .next

write_string msg, lenMsg
movzx eax, byte[array+1]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest1, lenFest1
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next:
cmp eax, 1		; May 1 is holiday
jnz .next2

cmp ebx, 5
jnz .next2

write_string msg, lenMsg
movzx eax, byte[array+125]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest4, lenFest4
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next2:
cmp eax, 20		; July 20 is holiday
jnz .next3

cmp ebx, 7
jnz .next3

write_string msg, lenMsg
movzx eax, byte[array+206]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest5, lenFest5
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next3:
cmp eax, 7		; August 7 is holiday
jnz .next4

cmp ebx, 8
jnz .next4

write_string msg, lenMsg
movzx eax, byte[array+224]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest6, lenFest6
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next4:
cmp eax, 8		; December 8 is holiday
jnz .next5

cmp ebx, 12
jnz .next5

write_string msg, lenMsg
movzx eax, byte[array+349]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest7, lenFest7
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next5:
cmp eax, 25		; December 25 is holiday
jnz .next6

cmp ebx, 12
jnz .next6

write_string msg, lenMsg
movzx eax, byte[array+366]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest8, lenFest8
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next6:
mov edx, [monthOfEaster]		; Holy thursday is holiday
mov ecx, [dayOfEaster]
sub ecx, 3
cmp eax, ecx
jnz .next7

cmp ebx, edx
jnz .next7

write_string msg, lenMsg
mov eax, 4
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest2, lenFest2
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next7:
mov edx, [monthOfEaster]		; Holy friday is holiday
mov ecx, [dayOfEaster]
sub ecx, 2
cmp eax, ecx
jnz .next8

cmp ebx, edx
jnz .next8

write_string msg, lenMsg
mov eax, 5
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest3, lenFest3
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next8:
mov ebx, [address]		; Every sunday is holiday
movzx eax, byte[array+ebx]
cmp eax, 0
jz .entry

cmp eax, 30
jnz .next9

.entry:
write_string msg, lenMsg
mov eax, 0
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string festD, lenFestD
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next9:
mov ebx, [address]		; January 6 is holiday
mov ecx, [f9]
cmp ebx, ecx
jnz .next10

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest9, lenFest9
mov ebx, [address]
cmp ebx, 6
jnz .continue

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next10

.continue:
write_string tFest9, lenTFest9
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next10:
mov ebx, [address]		; March 19 is holiday
mov ecx, [f10]
cmp ebx, ecx
jnz .next11

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest10, lenFest10
mov ebx, [address]
cmp ebx, 81
jnz .continue2

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next11

.continue2:
write_string tFest10, lenTFest10
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next11:
mov ebx, [address]		; June 29 is holiday
mov ecx, [f11]
cmp ebx, ecx
jnz .next12

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest14, lenFest14
mov ebx, [address]
cmp ebx, 184
jnz .continue3

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next12

.continue3:
write_string tFest14, lenTFest14
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next12:
mov ebx, [address]		; August 23 is holiday
mov ecx, [f12]
cmp ebx, ecx
jnz .next13

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest15, lenFest15
mov ebx, [address]
cmp ebx, 232
jnz .continue4

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next13

.continue4:
write_string tFest15, lenTFest15
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next13:
mov ebx, [address]		; October 12 is holiday
mov ecx, [f13]
cmp ebx, ecx
jnz .next14

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest16, lenFest16
mov ebx, [address]
cmp ebx, 291
jnz .continue5

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next14

.continue5:
write_string tFest16, lenTFest16
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next14:
mov ebx, [address]		; November 1 is holiday
mov ecx, [f14]
cmp ebx, ecx
jnz .next15

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest17, lenFest17
mov ebx, [address]
cmp ebx, 311
jnz .continue6

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next15

.continue6:
write_string tFest17, lenTFest17
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next15:
mov ebx, [address]		; November 11 is holiday
mov ecx, [f15]
cmp ebx, ecx
jnz .next16

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest18, lenFest18
mov ebx, [address]
cmp ebx, 321
jnz .continue7

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next16

.continue7:
write_string tFest18, lenTFest18
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next16:
mov ebx, [address]		; 6° sunday after easter is holiday
mov ecx, [f16]
cmp ebx, ecx
jnz .next17

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest11, lenFest11
mov ebx, [address]
mov ecx, [dom1]
cmp ebx, ecx
jnz .continue8

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next17

.continue8:
write_string msg3, lenMsg3
movzx eax, byte[arrayD+0]
mov edi, digit
call intToString
call write_digit
write_string msg2, lenMsg2
movzx eax, byte[arrayDM+0]
call WhatMonth
write_string ecx, edx
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next17:
mov ebx, [address]		; 9° sunday after easter is holiday
mov ecx, [f17]
cmp ebx, ecx
jnz .next18

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest12, lenFest12
mov ebx, [address]
mov ecx, [dom2]
cmp ebx, ecx
jnz .continue9

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next18

.continue9:
write_string msg3, lenMsg3
movzx eax, byte[arrayD+1]
mov edi, digit
call intToString
call write_digit
write_string msg2, lenMsg2
movzx eax, byte[arrayDM+1]
call WhatMonth
write_string ecx, edx
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx

.next18:
mov ebx, [address]		; 10° sunday after easter is holiday
mov ecx, [f18]
cmp ebx, ecx
jnz .next19

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string fest13, lenFest13
mov ebx, [address]
mov ecx, [dom3]
cmp ebx, ecx
jnz .continue10

write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp .next19

.continue10:
write_string msg3, lenMsg3
movzx eax, byte[arrayD+2]
mov edi, digit
call intToString
call write_digit
write_string msg2, lenMsg2
movzx eax, byte[arrayDM+2]
call WhatMonth
write_string ecx, edx
write_string ln, lenLn
mov edx, [countHoly]
inc edx
mov [countHoly], edx
jmp Exit

.next19:
mov ebx, [address]		; Validate if the date is valid
movzx eax, byte[array+ebx]
cmp eax, 20
jnz .next20

jmp errorInvalidDate

.next20:
mov edx, [countHoly] 		; Validate if there aren't any holidays, so it's a normal day
cmp edx, 0
jnz Exit

write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg5, lenMsg5
write_string ln, lenLn
jmp Exit

.NoColombia:		; If the timeZone is different to 300
write_string errorMessage7, lenError7
call CalcCalendar

mov eax, [month]
dec eax
mov ebx, 31
mul ebx
mov edx, [day]
add eax, edx
mov [address], eax

mov ebx, [address]		; Every sunday is holiday
movzx eax, byte[array+ebx]
cmp eax, 0
jz .isSunday

cmp eax, 30
jnz .isNormal

.isSunday:
write_string msg, lenMsg
mov eax, 0
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg1, lenMsg1
write_string festD, lenFestD
write_string ln, lenLn
jmp Exit

.isNormal:
write_string msg, lenMsg
mov ebx, [address]
movzx eax, byte[array+ebx]
call WhatDay
write_string ecx, edx
write_string dayS, 2
write_string msg2, lenMsg2
mov eax, [month]
call WhatMonth
write_string ecx, edx
write_string msg2, lenMsg2
write_string yearS, 4
write_string msg5, lenMsg5
write_string ln, lenLn
jmp Exit

isYear:		; Procedure to calculate a calendar of a specific year
pop eax
pop eax
pop	ebx
mov [param], ebx

mov edi, ebx		; Validate if the length of the second argument is 4 (YYYY)
call Length
mov [lenParam], ecx
cmp ecx, 5
jnz errorLengthI

mov edx, [param]
call atoi
mov [year], eax

mov eax, 78		; Get timeZone from system (sys_gettimeofday = 78)
mov ebx, x
mov ecx, utc
int 80h

mov ebx, [utc]		; Validate if the timeZone is equal to 300 (Colombia)
cmp ebx, 300
jnz NoColombia

call CalcCalendar
call holidaysOfYear
call printCalendar
jmp Exit

NoColombia:		; If the timeZone is different to 300
write_string errorMessage7, lenError7
call CalcCalendar
call printCalendar
jmp Exit

getYear:		; Split second argument into year, month and day
						; Parameters are not require
						;	Return values into yearS, monthS and dayS
mov ecx, 4
mov esi, [param]
mov edi, yearS
cld
rep movsb

mov ebx, 4
mov ecx, [param]
movzx eax, byte[ecx+ebx]
mov byte[monthS+0], al
inc ebx
movzx eax, byte[ecx+ebx]
mov byte[monthS+1], al
inc ebx

movzx eax, byte[ecx+ebx]
mov byte[dayS+0], al
inc ebx
movzx eax, byte[ecx+ebx]
mov byte[dayS+1], al
ret

WhatDay:		; Return the day of the week to print
						; Parameters: eax
						;	Return in ecx the text and return in edx the length of the text
mov ecx, 10
xor edx, edx
div ecx
mov eax, edx
cmp eax, 0
jnz .next

mov ecx, sunday
mov edx, lenSun
jmp .exit

.next:
cmp eax, 1
jnz .next1

mov ecx, monday
mov edx, lenMon
jmp .exit

.next1:
cmp eax, 2
jnz .next2

mov ecx, tuesday
mov edx, lenTue
jmp .exit

.next2:
cmp eax, 3
jnz .next3

mov ecx, wednesday
mov edx, lenWed
jmp .exit

.next3:
cmp eax, 4
jnz .next4

mov ecx, thursday
mov edx, lenThu
jmp .exit

.next4:
cmp eax, 5
jnz .next5

mov ecx, friday
mov edx, lenFri
jmp .exit

.next5:
cmp eax, 6
jnz .exit

mov ecx, saturday
mov edx, lenSat

.exit:
ret

WhatMonth:		; Return the month of the year to print
							; Parameters: eax
							;	Return in ecx the text and return in edx the length of the text
cmp eax, 1
jnz .next1

mov ecx, january
mov edx, lenJanuary
jmp .exit

.next1:
cmp eax, 2
jnz .next2

mov ecx, february
mov edx, lenFebruary
jmp .exit

.next2:
cmp eax, 3
jnz .next3

mov ecx, march
mov edx, lenMarch
jmp .exit

.next3:
cmp eax, 4
jnz .next4

mov ecx, april
mov edx, lenApril
jmp .exit

.next4:
cmp eax, 5
jnz .next5

mov ecx, may
mov edx, lenMay
jmp .exit

.next5:
cmp eax, 6
jnz .next6

mov ecx, june
mov edx, lenJune
jmp .exit

.next6:
cmp eax, 7
jnz .next7

mov ecx, july
mov edx, lenJuly
jmp .exit

.next7:
cmp eax, 8
jnz .next8

mov ecx, august
mov edx, lenAugust
jmp .exit

.next8:
cmp eax, 9
jnz .next9

mov ecx, september
mov edx, lenSeptember
jmp .exit

.next9:
cmp eax, 10
jnz .next10

mov ecx, october
mov edx, lenOctober
jmp .exit

.next10:
cmp eax, 11
jnz .next11

mov ecx, november
mov edx, lenNovember
jmp .exit

.next11:
cmp eax, 12
jnz .exit

mov ecx, december
mov edx, lenDecember

.exit:
ret

intToString:		; Function to convert an int to string
								; Parameters: In eax must be the number to convert,
								; In edi must be the address of the buffer to save the string
								; Return in digit the string to print
push  edx
push  ecx
push  edi
push  ebp
mov dword[digit], 0
mov   ebp, esp
mov   ecx, 10
;push 20h		; End of line \n

.pushDigits:
xor edx, edx        ; zero-extend eax
div ecx             ; divide by 10; now edx = next digit
add edx, 30h        ; decimal value + 30h = ascii digit
push edx            ; push the whole dword, cause that's how x86 rolls
test eax, eax       ; leading zeros suck
jnz .pushDigits

.popDigits:
pop eax
stosb               ; don't write the whole dword, just the low byte
cmp esp, ebp        ; if esp==ebp, we've popped all the digits
jne .popDigits

xor   eax, eax        ; add trailing nul
stosb

mov   eax, edi
pop   ebp
pop   edi
pop   ecx
pop   edx
sub   eax, edi        ; return number of bytes written
ret

write_digit:		; Function to print digit
push eax
push ebx
push ecx
push edx
mov eax, 4		; sys_write = 4
mov ebx, 1
mov ecx, digit
mov edx, 16
int 80h
pop edx
pop ecx
pop ebx
pop eax
ret

atoi:		; Function to convert string to int
				; Parameters: In edx must be the string to convert
				; Return in eax the number
xor eax, eax		; zero a "result so far"

.top:
movzx ecx, byte [edx]		; get a character
inc edx		; ready for next one
cmp ecx, '0'		; valid?
jb .done

cmp ecx, '9'
ja .done

sub ecx, '0'		; "convert" character to number
imul eax, 10		; multiply "result so far" by ten
add eax, ecx		; add in current digit
jmp .top		; until done

.done:
cmp ecx, 0
jnz errorOnlyNumbers

ret

currentYear:		; Procedure to print the calendar of the system's year
mov eax, 78		; Get timeZone from system (sys_gettimeofday = 78)
mov ebx, x
mov ecx, utc
int 80h

mov eax, [x]		; Convert seconds to years
mov ebx, 31556926
xor edx, edx
div ebx
add eax, 1970
mov [year], eax

mov ebx, [utc]		; Validate if the timeZone is equal to 300 (Colombia)
cmp ebx, 300
jnz NoColombia

call CalcCalendar
call holidaysOfYear
call printCalendar
jmp Exit

errorOnlyNumbers:
write_string errorMessage4, lenError4
;One or more letters were typed in second argument so exit the program
jmp Error

errorMissingArg:
write_string errorMessage, lenError
;One argument is missing so exit the program
jmp Error

errorInvalidArg:
write_string errorMessage2, lenError2
;There are too many arguments so exit the program
jmp Error

errorCommandNo:
write_string errorMessage3, lenError3
;The command doesn't exist so exit the program
jmp Error

errorLengthI:
write_string errorMessage5, lenError5
;The length of the second argument is invalid so exit the program
jmp Error

errorInvalidDate:
write_string errorMessage6, lenError6
;The date is invalid so exit the program
jmp Error

errorInvalidYear:
write_string errorMessage8, lenError8
;The year is invalid so exit the program
jmp Error

strcmp:		; Function to compare two strings
					; Parameters: In eax the address of source string
					; In ebx the address of string to compare
					; In ecx the length of source string
					; In edx the length of string to compare
					; Return in eax, 0 if are equal or 1 if are different
cmp ecx, edx
jnz .lengths

mov esi, eax
mov edi, ebx
cld		; Clear the flags

repe cmpsb		; Compare each byte until find a character null
jecxz .strcmpSame

.lengths:
mov eax, 1		; The strings are different because they have different lengths
jmp .strcmpExit

.strcmpSame:
mov eax, 0		; If the strings are equal

.strcmpExit:		; Exit the Function
ret

Length:		; Function to calculate the length of a string
					; Parameters: In edi must be the address of the string
					; Return in ecx the length of the string
sub	ecx, ecx
sub	al, al
not	ecx
cld
repne	scasb
not	ecx
ret

dow:		; Function to calculate the first day of a year
				; Parameters: In eax the year, in ebx the month and in ecx the day
				; Return in eax the day of the week of the first day of the year
mov [y], eax
cmp eax, 1583
jb errorInvalidYear
mov [m], ebx
mov [d], ecx
mov eax, [m]
cmp eax, 3
jge .return

mov eax, [y]
sub eax, 1
mov [y], eax

.return:
xor edx, edx
mov eax, [y]
mov ebx, 4
div ebx
mov [div4], eax
xor edx, edx
mov eax, [y]
mov ebx, 100
div ebx
mov [div100], eax
xor edx, edx
mov eax, [y]
mov ebx, 400
div ebx
mov [div400], eax
mov ebx, [m]
sub ebx, 1
mov eax, [y]
add eax, [div4]
sub eax, [div100]
add eax, [div400]
mov ecx, [d]
add eax, ecx
movzx ecx, byte [tArr+ebx]
add eax, ecx
xor edx, edx
mov ebx, 7
div ebx
mov eax, edx
ret

CalcCalendar:		; Function to calculate the first day of a year
								; Parameters aren't not require
								; Return values in array
mov eax, 1
mov [index], eax
mov eax, [year]
mov ebx, 1
mov ecx, 1
call dow
mov [dayofweek], edx
mov ecx, 0
mov [i], ecx

.fori:
mov ecx, [i]
inc ecx
mov [i], ecx
cmp ecx, 12
jg .exitFori

mov ebx, 0
mov [j], ebx

.forj:
mov ebx, [j]
inc ebx
mov [j], ebx
cmp ebx, 31
jg .exitForj

mov eax, [i]
cmp eax, 1
jz .entry

mov eax, [i]
cmp eax, 3
jz .entry

mov eax, [i]
cmp eax, 5
jz .entry

mov eax, [i]
cmp eax, 7
jz .entry

mov eax, [i]
cmp eax, 8
jz .entry

mov eax, [i]
cmp eax, 10
jz .entry

mov eax, [i]
cmp eax, 12
jz .entry

jmp .else

.entry:
mov ebx, [index]
mov al, [dayofweek]
mov [array+ebx], al
inc ebx
mov [index], ebx
mov eax, [dayofweek]
add eax, 1
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx
jmp .otherIf

.else:
mov eax, [i]
cmp eax, 2
jnz .exitIf1

mov eax, [j]
cmp eax, 28
jg .exitIf2

mov ebx, [index]
mov al, [dayofweek]
mov [array+ebx], al
inc ebx
mov [index], ebx
mov eax, [dayofweek]
add eax, 1
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx

.exitIf2:
mov eax, [year]
mov ecx, 4
xor edx, edx
div ecx
mov eax, edx
cmp eax, 0
jnz .else2

mov eax, [year]
mov ecx, 100
xor edx, edx
div ecx
mov eax, edx
cmp eax, 0
jz .otherWay

jmp .entry2

.otherWay:
mov eax, [year]
mov ecx, 400
xor edx, edx
div ecx
mov eax, edx
cmp eax, 0
jnz .else2

.entry2:
mov eax, [j]
cmp eax, 29
jnz .exitIf3

mov ebx, [index]
mov al, [dayofweek]
mov [array+ebx], al
inc ebx
mov [index], ebx
mov eax, [dayofweek]
add eax, 1
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx

.exitIf3:
mov eax, [j]
cmp eax, 30
jz .entry3

mov eax, [j]
cmp eax, 31
jnz .exitElse2

.entry3:
mov eax, [index]
inc eax
mov [index], eax
jmp .exitElse2

.else2:
mov eax, [j]
cmp eax, 29
jz .entry4

mov eax, [j]
cmp eax, 30
jz .entry4

mov eax, [j]
cmp eax, 31
jnz .exitElse2

.entry4:
mov eax, [index]
inc eax
mov [index], eax

.exitElse2:

.exitIf1:

.otherIf:
mov eax, [i]
cmp eax, 4
jz .entry5

mov eax, [i]
cmp eax, 6
jz .entry5

mov eax, [i]
cmp eax, 11
jz .entry5

mov eax, [i]
cmp eax, 9
jz .entry5

jmp .exitIf4

.entry5:
mov eax, [j]
cmp eax, 30
jg .else3

mov ebx, [index]
mov al, [dayofweek]
mov [array+ebx], al
inc ebx
mov [index], ebx
mov eax, [dayofweek]
add eax, 1
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx
jmp .exitIf4

.else3:
mov ebx, [index]
inc ebx
mov [index], ebx

.exitIf4:
jmp .forj

.exitForj:
jmp .fori

.exitFori:
ret

holidaysOfYear:		; Function to assign the holidays of the year
									; Parameters aren't not require
									; Return values in array in positions of holidays
mov ebx, 1		; January 1
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov ebx, 125		; May 1 (4*31+1)
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov ebx, 206		; July 20 (6*31+20)
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov ebx, 224		; August 7 (7*31+7)
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov ebx, 349		; December 8 (11*31+8)
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov ebx, 366		; December 25 (11*31+25)
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; January 6
movzx ebx, byte[array+6]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 6
mov ebx, eax
mov [f9], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; March 19 (2*31 + 19)
movzx ebx, byte[array+81]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 81
mov ebx, eax
mov [f10], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 9		; June 29 (5*31 + 29)
movzx ebx, byte[array+184]
sub eax, ebx
mov ecx, 8
xor edx, edx
div ecx
mov eax, edx
add eax, 184
mov ebx, eax
mov [f11], ebx
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; August 15 (7*31 + 15)
movzx ebx, byte[array+232]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 232
mov ebx, eax
mov [f12], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; October 12 (9*31 + 12)
movzx ebx, byte[array+291]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 291
mov ebx, eax
mov [f13], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; November 1 (10*31 + 1)
movzx ebx, byte[array+311]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 311
mov ebx, eax
mov [f14], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, 8		; November 11 (10*31 + 11)
movzx ebx, byte[array+321]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 321
mov ebx, eax
mov [f15], eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

; Calculus to determinate the easter sunday
; a = year % 19
mov eax, [year]
mov ebx, 19
xor edx, edx
div ebx
mov [a], edx
; b = year / 100
mov eax, [year]
mov ebx, 100
xor edx, edx
div ebx
mov [b], eax
; c = year % 100
mov eax, [year]
mov ebx, 100
xor edx, edx
div ebx
mov [c], edx
; d = b / 4
mov eax, [b]
mov ebx, 4
xor edx, edx
div ebx
mov [d], eax
; e = b % 4
mov eax, [b]
mov ebx, 4
xor edx, edx
div ebx
mov [e], edx
; f = (b + 8) / 25
mov eax, [b]
add eax, 8
mov ebx, 25
xor edx, edx
div ebx
mov [f], eax
; g = (b - f + 1) / 3
mov eax, [b]
inc eax
sub eax, [f]
mov ebx, 3
xor edx, edx
div ebx
mov [g], eax
; h = (19*a + b - d - g + 15) % 30
mov eax, [a]
mov ebx, 19
mul ebx
add eax, [b]
sub eax, [d]
sub eax, [g]
add eax, 15
mov ebx, 30
xor edx, edx
div ebx
mov [h], edx
; i = c / 4
mov eax, [c]
mov ebx, 4
xor edx, edx
div ebx
mov [i], eax
; k = c % 4
mov eax, [c]
mov ebx, 4
xor edx, edx
div ebx
mov [k], edx
; l = (32 + 2*e + 2*i - h - k) % 7
mov eax, [e]
mov ebx, 2
mul ebx
add eax, 32
mov ecx, eax
mov eax, [i]
mov ebx, 2
mul ebx
add eax, ecx
sub eax, [h]
sub eax, [k]
mov ebx, 7
xor edx, edx
div ebx
mov [l], edx
; m = (a + 11*h + 22* l) / 451
mov eax, [h]
mov ebx, 11
mul ebx
add eax, [a]
mov ecx, eax
mov eax, [l]
mov ebx, 22
mul ebx
add eax, ecx
mov ebx, 451
xor edx, edx
div ebx
mov [m], eax
; n = h + l - 7*m + 144
mov eax, [m]
mov ebx, 7
mul ebx
mov ecx, eax
mov eax, [h]
add eax, [l]
sub eax, ecx
add eax, 144
mov [n], eax
; monthOfEaster = n / 31
mov eax, [n]
mov ebx, 31
xor edx, edx
div ebx
dec eax
mov [monthOfEaster], eax
; dayOfEaster = 1 + (n % 31)
mov eax, [n]
mov ebx, 31
xor edx, edx
div ebx
mov eax, edx
add eax, 2
mov [dayOfEaster], eax

mov eax, [monthOfEaster]		; Holy friday [(monthOfEaster - 1)*31 + dayOfEaster - 2]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
sub eax, 2
add eax, ecx
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, [monthOfEaster]		; Holy thursday [(monthOfEaster - 1)*31 + dayOfEaster - 3]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
sub eax, 3
add eax, ecx
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, [monthOfEaster]		; 6° sunday after easter [(monthOfEaster - 1)*31 + dayOfEaster + 42]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
add eax, 42
add eax, ecx
mov [index], eax
movzx eax, byte[array+eax]
mov ebx, 7
sub ebx, eax
inc ebx
mov eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov ebx, edx
add ebx, [index]
mov [f16], ebx
dec ebx
mov [dom1], ebx
movzx eax, byte[array+ebx]
add eax, 30
mov [res], eax
mov al, [res]
mov [array+ebx], al
mov ebx, [f16]
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, [monthOfEaster] 		; 9° sunday after easter [(monthOfEaster - 1)*31 + dayOfEaster + 63]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
add eax, 63
add eax, ecx
mov [index], eax
movzx eax, byte[array+eax]
mov ebx, 7
sub ebx, eax
inc ebx
mov eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov ebx, edx
add ebx, [index]
mov [f17], ebx
dec ebx
mov [dom2], ebx
movzx eax, byte[array+ebx]
add eax, 30
mov [res], eax
mov al, [res]
mov [array+ebx], al
mov ebx, [f17]
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

mov eax, [monthOfEaster]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
add eax, ecx
mov [i], eax
add eax, 70
mov [j], eax
mov ebx, 0
mov [countNil], ebx

.loop:
mov ebx, [i]
inc ebx
mov [i], ebx
mov ecx, [j]
cmp ebx, ecx
jg .exitLoop

movzx eax, byte[array+ebx]
cmp eax, 20
jnz .loop

mov ecx, [countNil]
inc ecx
mov [countNil], ecx
jmp .loop

.exitLoop:
mov eax, [monthOfEaster] 		; 10° sunday after easter [(monthOfEaster - 1)*31 + dayOfEaster + 70]
dec eax
mov ebx, 31
mul ebx
mov ecx, eax
mov eax, [dayOfEaster]
add eax, 70
add eax, [countNil]
add eax, ecx
mov [index], eax
movzx eax, byte[array+eax+1]
cmp eax, 20
jnz .continue

mov eax, [index]
movzx eax, byte[array+eax]
mov ebx, 7
sub ebx, eax
inc ebx
mov eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov ebx, edx
add ebx, [index]
mov [f18], ebx
dec ebx
mov [dom3], ebx
movzx eax, byte[array+ebx]
add eax, 30
mov [res], eax
mov al, [res]
mov [array+ebx], al
mov ebx, [f18]
inc ebx
mov [f18], ebx
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
jmp .ret

.continue:
mov eax, [index]
movzx eax, byte[array+eax]
mov ebx, 7
sub ebx, eax
inc ebx
mov eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov ebx, edx
add ebx, [index]
mov [f18], ebx
dec ebx
mov [dom3], ebx
movzx eax, byte[array+ebx]
add eax, 30
mov [res], eax
mov al, [res]
mov [array+ebx], al
mov ebx, [f18]
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al

.ret:
ret

printCalendar:		; Function to print the calendar
									; Parameters aren't not require
									; Return the calendar printed in screen
mov eax, 0
mov [dayofweek], eax
mov ebx, 0
mov [index], ebx
mov ecx, 0
mov [i], ecx

.forMonths:
mov ecx, [i]
inc ecx
mov [i], ecx
cmp ecx, 12
jg .exitForMonths

cmp ecx, 1
jnz .next1

write_string January, LenJanuary
jmp .format

.next1:
cmp ecx, 2
jnz .next2

write_string February, LenFebruary
jmp .format

.next2:
cmp ecx, 3
jnz .next3

write_string March, LenMarch
jmp .format

.next3:
cmp ecx, 4
jnz .next4

write_string April, LenApril
jmp .format

.next4:
cmp ecx, 5
jnz .next5

write_string May, LenMay
jmp .format

.next5:
cmp ecx, 6
jnz .next6

write_string June, LenJune
jmp .format

.next6:
cmp ecx, 7
jnz .next7

write_string July, LenJuly
jmp .format

.next7:
cmp ecx, 8
jnz .next8

write_string August, LenAugust
jmp .format

.next8:
cmp ecx, 9
jnz .next9

write_string September, LenSeptember
jmp .format

.next9:
cmp ecx, 10
jnz .next10

write_string October, LenOctober
jmp .format

.next10:
cmp ecx, 11
jnz .next11

write_string November, LenNovember
jmp .format

.next11:
cmp ecx, 12
jnz .forMonths

write_string December, LenDecember

.format:
write_string spaceSimple, lenSpaceS
mov eax,[year]
mov edi, digit
call intToString
call write_digit
write_string ln, lenLn
write_string header, lenHeader
mov ebx, 1
mov [j], ebx

.whilej:
mov ebx, [j]
cmp ebx, 31
jg .exitWhilej

mov eax, [i]
dec eax
mov ecx, 31
mul ecx
add eax, [j]
mov [res], eax
mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 20
jz .elseNull

mov ebx, [res]
movzx eax, byte[array+ebx]
mov ecx, 10
xor edx, edx
div ecx
mov eax, edx
cmp eax, [dayofweek]
jnz .elseNoHoly

mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 0
jz .isHoly

mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 10
jb .isNormal

.isHoly:
write_string fChar, lenFChar
mov eax, [j]
mov [last], eax
cmp eax, 10
jb .addSpaceHoly

mov edi, digit
call intToString
call write_digit
write_string spaceDouble, lenSpaceD

.contine2:
mov ebx, [index]
inc ebx
mov [index], ebx
jmp .continue

.addSpaceHoly:
write_string spaceSimple, lenSpaceS
mov eax, [j]
mov edi, digit
call intToString
call write_digit
write_string spaceDouble, lenSpaceD
jmp .contine2

.isNormal:
mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 0
jbe .continue

mov eax, [j]
mov [last], eax
cmp eax, 10
jb .addSpaceNormal

write_string spaceDouble, lenSpaceD
mov eax, [j]
mov edi, digit
call intToString
call write_digit
write_string spaceDouble, lenSpaceD

.continue3:
mov ebx, [index]
inc ebx
mov [index], ebx

.continue:
mov eax, [dayofweek]
inc eax
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx
mov ebx, [j]
inc ebx
mov [j], ebx
jmp .newRow

.addSpaceNormal:
write_string spaceTriple, lenSpaceT
mov eax, [j]
mov edi, digit
call intToString
call write_digit
write_string spaceDouble, lenSpaceD
jmp .continue3

.elseNoHoly:
write_string spaceNull, lenSpaceN
mov eax, 0
mov [last], eax
mov ebx, [index]
inc ebx
mov [index], ebx
mov eax, [dayofweek]
inc eax
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx

.newRow:
mov eax, [index]
cmp eax, 7
jz .newLine

mov ebx, [last]
cmp ebx, 31
jz .newLine

jmp .exitElseNull

.newLine:
write_string ln, lenLn
mov ebx, 0
mov [dayofweek], ebx
mov [index], ebx
jmp .exitElseNull

.elseNull:
write_string ln, lenLn
mov ebx, 0
mov [dayofweek], ebx
mov [index], ebx
mov ecx, 32
mov [j], ecx

.exitElseNull:
jmp .whilej

.exitWhilej:
write_string ln, lenLn
write_string ln, lenLn
mov ebx, 0
mov [index], ebx
jmp .forMonths

.exitForMonths:
ret

HolidayMovement:		; Function to calculate the day before a holiday
										; Parameters aren't not require
										; Return in arrayD the day before a holiday,
										; and return in arrayDM the month of the day
mov eax, 0
mov [countDom], eax
mov [dayofweek], eax
mov ebx, 0
mov [index], ebx
mov ecx, 0
mov [i], ecx

.forMonths:
mov ecx, [i]
inc ecx
mov [i], ecx
cmp ecx, 12
jg .exitForMonths

.format:
mov ebx, 1
mov [j], ebx

.whilej:
mov ebx, [j]
cmp ebx, 31
jg .exitWhilej

mov eax, [i]
dec eax
mov ecx, 31
mul ecx
add eax, [j]
mov [res], eax
mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 20
jz .elseNull

mov ebx, [res]
movzx eax, byte[array+ebx]
mov ecx, 10
xor edx, edx
div ecx
mov eax, edx
cmp eax, [dayofweek]
jnz .elseNoHoly

mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 0
jz .isHoly

mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 10
jb .isNormal

cmp eax, 30
jz .domingoHoly

.isHoly:
mov eax, [j]
mov [last], eax

.contine2:
mov ebx, [index]
inc ebx
mov [index], ebx
jmp .continue

.domingoHoly:
mov edx, [countDom]
mov al, [j]
mov byte[arrayD+edx], al
mov al, [i]
mov byte[arrayDM+edx], al
inc edx
mov [countDom], edx
jmp .isHoly

.isNormal:
mov ebx, [res]
movzx eax, byte[array+ebx]
cmp eax, 0
jbe .continue

mov eax, [j]
mov [last], eax

.continue3:
mov ebx, [index]
inc ebx
mov [index], ebx

.continue:
mov eax, [dayofweek]
inc eax
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx
mov ebx, [j]
inc ebx
mov [j], ebx
jmp .newRow

.elseNoHoly:
mov eax, 0
mov [last], eax
mov ebx, [index]
inc ebx
mov [index], ebx
mov eax, [dayofweek]
inc eax
mov ecx, 7
xor edx, edx
div ecx
mov [dayofweek], edx

.newRow:
mov eax, [index]
cmp eax, 7
jz .newLine

mov ebx, [last]
cmp ebx, 31
jz .newLine

jmp .exitElseNull

.newLine:
mov ebx, 0
mov [dayofweek], ebx
mov [index], ebx
jmp .exitElseNull

.elseNull:
mov ebx, 0
mov [dayofweek], ebx
mov [index], ebx
mov ecx, 32
mov [j], ecx

.exitElseNull:
jmp .whilej

.exitWhilej:
mov ebx, 0
mov [index], ebx
jmp .forMonths

.exitForMonths:
ret

Error:		; In case of error the program must close

Exit:		; When all procedures are done, the program exit
syscall_exit
