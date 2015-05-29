SECTION .data		; data section
	ln:	db "",0xa
	lenLn:	equ $-ln		; "$" means "here"
							; len is a value, not an address
	nParams: db "",0xa
	date db __DATE__,0ax, 0xD
	dParam: db "-d",0
	lenD: equ $-dParam
	yParam: db "-y",0
	lenY: equ $-yParam

	errorMessage: db "Error: One argument is missing", 0xa
	lenError: equ $-errorMessage

	errorMessage2: db "Error: There are too many arguments", 0xa
	lenError2: equ $-errorMessage2

	errorMessage3: db "Error: Command not found, please check arguments", 0xa
	lenError3: equ $-errorMessage3

	errorMessage4: db "Error: Only numbers are accepted in the second argument", 0xa
	lenError4: equ $-errorMessage4

	binSh: db "/bin/sh"
	lenBinSh: equ $-binSh
	;ltime db __TIME__,0ax
	;utcTime db __UTC_TIME__,0ax
	lenDate: equ $-date
	array: times 373 db 20
	lenArray: equ $-array
	tArr: db 0,3,2,5,0,3,5,1,4,6,2,4
	header: db "D    L    M    W    J    V    S"
	lenHeader: equ $-header
	;lenLTime: equ $-ltime
	;lenUtcTime: equ $-utcTime

SECTION .bss
	div4 resd 1
	div100 resd 1
	div400 resd 1
	y resd 1
	m resd 1
	d resd 1
	dayofweek resd 1
	i resd 1
	j resd 1
	a resd 1
	b resd 1
	c resd 1
	e resd 1
	f resd 1
	g resd 1
	h resd 1
	k resd 1
	l resd 1
	n resd 1
	monthOfEaster resd 1
	dayOfEaster resd 1

	index resd 1
	res resd 1
	lenType resd 1
	lenParam resd 1
	year resd 1
	month resd 1
	day resd 1
	lenPrint resd 1
	digit: resb 16
	;x: resb 16
	;y: resb 4
	type: resb 32
	param: resb 32


	%macro write_string 2
  	mov edx, %2
    mov ecx, %1
    mov eax, 4
    mov ebx, 1
    int 80h
	%endmacro

	%macro syscall_exit 0
		mov eax, 01h    ; exit()
		xor ebx, ebx    ; exit code ---- 0=normal
		int 80h					; interrupt 80 hex, call kernel
	%endmacro

SECTION .text		; code section
	global _start	; make label available to linker

_start:				; standard  gcc  entry point

	;write_string date, lenDate

	;mov edx,lenUtcTime
	;mov ecx,utcTime
	;mov	ebx,1		; arg1, where to write, screen
	;mov	eax,4		; write sysout command to int 80 hex
	;int	0x80		; interrupt 80 hex, call kernel

	;mov edx,lenLTime
	;mov ecx,ltime
	;mov	ebx,1		; arg1, where to write, screen
	;mov	eax,4		; write sysout command to int 80 hex
	;int	0x80		; interrupt 80 hex, call kernel

	pop	eax		; Get the number of arguments
	mov [nParams], eax
	cmp eax, 1
	jz currentYear
	cmp eax, 2
	jz errorMissingArg
	cmp eax, 3
	jg errorInvalidArg

	;mov eax, dword[nParams]
	;mov edi, digit
	;call intToString
	;call write_digit
	;pop	ebx		; Get the program name
	;pop	ebx		; Get the first actual argument ("-y or -d")
	;mov [type], ebx
	mov edi, [esp+4]
	call Length
	mov [lenType], ecx

	mov eax, [esp + 4]
	mov ebx, dParam
	mov ecx, [lenType]
	mov edx, lenD
	call strcmp
	cmp eax,0
	jz isDay
	mov eax, [esp + 4]
	mov ebx, yParam
	mov ecx, [lenType]
	mov edx, lenY
	call strcmp
	cmp eax,0
	jz isYear
	jmp errorCommandNo


isDay:
	;Procedimiento para decir si un dia especifico es festivo o no
	jmp Exit

isYear:
;GetZoneTime

	;mov eax, 78
	;mov ebx, x
	;mov ecx, y
	;int 80h

	;mov eax, [y]
	;mov eax, [lenType]
	;mov edi, digit
	;call intToString
	;call write_digit

	pop eax
	pop eax
	;Validar si el argumento es -y o -d
	pop	ebx		; "year or date"
	mov [param], ebx
	;Validar si el argumento es solo compuesto por numeros y tienen la longitud necesaria
	;call printf
	mov edx, [param]
	call atoi
	mov [year], eax

	call CalcCalendar
	call holidaysOfYear
	call printArray

	;-------
	;mov eax, [year]
	;mov ebx, 1h
	;mov ecx, 1h

	;call dow

	;Mov only a number to array
	;mov al, 5
	;mov [array+3], al
	;movzx eax, byte[array+3]
	;mov edi, digit
	;call intToString
	;call write_digit


	;mov edi, ebx
	;call Length
	;write_string ebx, ecx

	mov eax, 2
  int 80h
  and eax, eax                       ; rax contains the PID
                                     ; if zero = child
                                     ; if non-zero = child pid for parent process
  js Error                           ; if negative then there was an error
  jnz Parent                         ; childs pid returned, go to parent

; The child process
Child:

	xor eax, eax             ; zeroing out registers
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx            ; 3rd arg done
	xor esi, esi
	xor edi, edi

	mov ebx, binSh 	; 1st arg done

	;working on args array

	push eax     ;push 0 onto the stack
	push 0x68732e65
	push 0x74614474
	push 0x65672f2e
	mov esi,esp      ;mov the address of the top of the stack into esi


	;prepare the argurments array for execution
	push eax
	push esi ;address of where our arguments are
	push ebx ;address of where //bin/ls is
	mov ecx, esp

	;give to the kernel
	mov eax, 11
	int 80h

	syscall_exit

Parent:

	mov edi, eax
	xor esi, esi
	xor edx, edx
	xor ecx, ecx
	mov eax, 114
	int 80h
  ;wait for child to terminate
	write_string ln, lenLn

	jmp Exit

; execve("/usr/bin", NULL)
; args[] = {"/usr/bin", "getDate.sh", NULL}


printf:
	xor ecx, ecx
	mov ecx, -1

while:
	inc ecx
	cmp byte[ebx+ecx],0
	jne while

	write_string ebx, ecx

	write_string ln, lenLn

	ret

intToString:
	push  edx
	push  ecx
	push  edi
	push  ebp
	mov dword[digit], 0
	mov   ebp, esp
	mov   ecx, 10
	push 20h  ;End of line \n

	.pushDigits:
		xor edx, edx        ; zero-extend eax
	  div ecx             ; divide by 10; now edx = next digit
	  add edx, 30h        ; decimal value + 30h => ascii digit
	  push edx             ; push the whole dword, cause that's how x86 rolls
	  test eax, eax        ; leading zeros suck
	  jnz .pushDigits

	.popDigits:
		pop eax
	  stosb                 ; don't write the whole dword, just the low byte
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

write_digit:
	push eax
	push ebx
	push ecx
	push edx
	mov eax, 4                  ; system call ;4 = sys_write
	mov ebx, 1                  ; file descriptor 1 = stdout
	mov ecx, digit              ; store *address* of digit into ecx
	mov edx, 16                 ; byte size of 16
	int 80h
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

atoi:
	xor eax, eax ; zero a "result so far"
	.top:
	movzx ecx, byte [edx] ; get a character
	inc edx ; ready for next one
	cmp ecx, '0' ; valid?
	jb .done
	cmp ecx, '9'
	ja .done
	sub ecx, '0' ; "convert" character to number
	imul eax, 10 ; multiply "result so far" by ten
	add eax, ecx ; add in current digit
	jmp .top ; until done
	.done:
	cmp ecx, 0
	jnz errorOnlyNumbers
	ret

currentYear:
	;Procedimiento para mostrar calendario del año actual, sin argumentos
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
	;There are too many arguments so exit the program
	jmp Error

; Compara dos Strings haciendo uso de los llamados ESI:EDI del
; procesador que permiten la operacion con strings en memoria
; (cmpsb) o (cmosw para comparar de a 2 bytes)
;
; Parametros:
;   EAX => char * [Direccion SRC]
;   EBX => char * [Direccion DES]
;   ECX => int [Length SRC]
;   EDX => int [Length DES]
;
; Retorno:
;   EAX => 0 si son iguales; 1 si no son iguales
;
strcmp:
	cmp ecx, edx
	jnz .lengths
	; mueve a esi el str1 [eax]
	mov esi, eax
	; mueve a edi el str2 [ebx]
	mov edi, ebx

	; se limpia el flag de direccion de strings
	cld

	; el flag de ZERO se setea si ambos str son iguales o se limpia si no
	repe cmpsb ; va comparando bytes en memoria, hasta el caracter NULL

	jecxz .strcmpSame

	.lengths:
	mov eax, 1 ; movemos 1 a eax, es decir no son iguales
	jmp .strcmpExit ; retorna el resulatado [EAX]

	.strcmpSame:
		mov eax, 0 ; movemos 0 a eax, es decir son iguales

	.strcmpExit:
	  ret

Length:
	sub	ecx, ecx
	sub	al, al
	not	ecx
	cld
	repne	scasb
	not	ecx
	;dec	ecx
	ret

dow:
	;EAX IS STORED Y
	;EBX IS STORED M
	;ECX IS STORED D
	mov [y], eax
	mov [m], ebx
	mov [d], ecx
	;lea esi, [tArr]
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
	;mov eax, [tArr+ebx*4] ;Times position because a doubleword has 4 bytes
	;movzx eax, byte [tArr+ebx] ;Mov a byte from the array to a register
	xor edx, edx
	mov ebx, 7
	div ebx
	mov eax, edx
	;Return in EDX or EAX
	ret

CalcCalendar:
	;year = []
  ;year << nil
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

	;_If gigant
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
	;mov al, 5
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

printArray:
	mov ebx, 0
	mov [index], ebx
	.for:
	mov ebx, [index]
	cmp ebx, lenArray
	jge .exitFor
	movzx eax, byte[array+ebx]
	mov edi, digit
	call intToString
	call write_digit
	inc ebx
	mov [index], ebx
	jmp .for
	.exitFor:
	ret

holidaysOfYear:
;1 de enero - Año Nuevo
;Jueves Santo
;Viernes Santo
;1 de mayo – Día del Trabajo
;20 de julio – Independencia Nacional 7 de agosto – Batalla de Boyacá
;8 de diciembre - Inmaculada Concepción 25 de diciembre - Navidad

; 1 de enero
mov ebx, 1
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[1] *= -1

;1 de mayo
mov ebx, 125     ;4*31+1
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[4*31 + 1] *= -1

;20 de julio
mov ebx, 206     ;6*31+20
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[6*31 + 20] *= -1

;8 de diciembre
mov ebx, 349     ;11*31+8
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[11*31 + 8] *= -1

;7 de agosto
mov ebx, 224     ;7*31+7
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[7*31 + 7] *= -1

;25 de diciembre
mov ebx, 366     ;11*31+25
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[11*31 + 25] *= -1

; 6 de enero - Epifanía del Señor
; 19 de marzo - Día de San José
; !!Ascensión del Señor (Sexto domingo después de Pascua)
; !!Corpus Christi (Octavo domingo después de Pascua)
; !!Sagrado Corazón de Jesús (Noveno domingo después de Pascua)
; !!jueves y viernes santo (semana anterior a pascua)
; 29 de Junio San Pedro y San Pablo
; 15 de agosto - Asunción de la Virgen!
; 12 de octubre - Día de la Raza
; 1 de noviembre - Todos los Santos
; 11 de noviembre - Independencia de Cartagena.

; ;6 de enero
mov eax, 8
movzx ebx, byte[array+6]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 6
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[6] + 1) % 7) + (6)] *= -1

; ;19 de marzo
mov eax, 8
movzx ebx, byte[array+81]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 81
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[2*31 + 19] + 1) % 7) + (2*31 + 19)] *= -1


; ;29 de Junio
mov eax, 8
movzx ebx, byte[array+184]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 184
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[5*31 + 29] + 1) % 7) + (5*31 + 29)] *= -1

; ;15 de agosto
mov eax, 8
movzx ebx, byte[array+232]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 232
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[7*31 + 15] + 1) % 7) + (7*31 + 15)] *= -1

; ;12 de octubre
mov eax, 8
movzx ebx, byte[array+291]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 291
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[9*31 + 12] + 1) % 7) + (9*31 + 12)] *= -1

; ;1 de noviembre
mov eax, 8
movzx ebx, byte[array+311]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 311
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[10*31 + 1] + 1) % 7) + (10*31 + 1)] *= -1

; ;11 de noviembre
mov eax, 8
movzx ebx, byte[array+321]
sub eax, ebx
mov ecx, 7
xor edx, edx
div ecx
mov eax, edx
add eax, 321
mov ebx, eax
movzx eax, byte[array+ebx]
mov ecx, 10
add eax, ecx
mov [res], eax
mov al, [res]
mov [array+ebx], al
;y[((7 - y[10*31 + 11] + 1) % 7) + (10*31 + 11)] *= -1

; ;Calculo del domingo de pascua
;a = anio % 19
mov eax, [year]
mov ebx, 19
xor edx, edx
div ebx
mov [a], edx
;b = anio / 100
mov eax, [year]
mov ebx, 100
xor edx, edx
div ebx
mov [b], eax
;c = anio % 100
mov eax, [year]
mov ebx, 100
xor edx, edx
div ebx
mov [c], edx
;d = b / 4
mov eax, [b]
mov ebx, 4
xor edx, edx
div ebx
mov [d], eax
;e = b % 4
mov eax, [b]
mov ebx, 4
xor edx, edx
div ebx
mov [e], edx
;f = (b + 8) / 25
mov eax, [b]
add eax, 8
mov ebx, 25
xor edx, edx
div ebx
mov [f], eax
;g = (b - f + 1) / 3
mov eax, [b]
inc eax
sub eax, [f]
mov ebx, 3
xor edx, edx
div ebx
mov [g], eax
;h = (19*a + b - d - g + 15) % 30
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
;i = c / 4
mov eax, [c]
mov ebx, 4
xor edx, edx
div ebx
mov [i], eax
;k = c % 4
mov eax, [c]
mov ebx, 4
xor edx, edx
div ebx
mov [k], edx
;l = (32 + 2*e + 2*i - h - k) % 7
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
;m = (a + 11*h + 22* l) / 451
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
;n = h + l - 7*m + 144
mov eax, [m]
mov ebx, 7
mul ebx
mov ecx, eax
mov eax, [h]
add eax, [l]
sub eax, ecx
add eax, 144
mov [n], eax
;monthOfEaster = n / 31
mov eax, [n]
mov ebx, 31
xor edx, edx
div ebx
dec eax
mov [monthOfEaster], eax
;dayOfEaster = 1 + (n % 31)
mov eax, [n]
mov ebx, 31
xor edx, edx
div ebx
mov eax, edx
add eax, 2
mov [dayOfEaster], eax
;monthOfEaster -= 1
;dayOfEaster += 1

;y[(monthOfEaster - 1)*31 + dayOfEaster - 2] *= -1 ;viernes santo
mov eax, [monthOfEaster]
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
;y[(monthOfEaster - 1)*31 + dayOfEaster - 3] *= -1 ; jueves santo
mov eax, [monthOfEaster]
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

;dia de la ascencion
	mov eax, [monthOfEaster]
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
	movzx eax, byte[array+ebx]
	mov ecx, 10
	add eax, ecx
	mov [res], eax
	mov al, [res]
	mov [array+ebx], al

	;y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 42] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 42)] *= -1

	;corpus Christi
	mov eax, [monthOfEaster]
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
	movzx eax, byte[array+ebx]
	mov ecx, 10
	add eax, ecx
	mov [res], eax
	mov al, [res]
	mov [array+ebx], al
	;y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 63] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 63)] *= -1

	;sagrado corazon
	mov eax, [monthOfEaster]
	dec eax
	mov ebx, 31
	mul ebx
	mov ecx, eax
	mov eax, [dayOfEaster]
	add eax, 70
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
	movzx eax, byte[array+ebx]
	mov ecx, 10
	add eax, ecx
	mov [res], eax
	mov al, [res]
	mov [array+ebx], al
;y[((7 - y[(monthOfEaster - 1)*31 + dayOfEaster + 70] + 1) % 7) + ((monthOfEaster - 1)*31 + dayOfEaster + 70)] *= -1

	ret

Error:

Exit:
	syscall_exit
