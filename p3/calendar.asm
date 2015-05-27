SECTION .data		; data section
	ln:	db "",0xa
	lenLn:	equ $-ln		; "$" means "here"
							; len is a value, not an address
	type: db "",0xa
	param: db "",0xa
	nParams: db "",0xa
	date db __DATE__,0ax, 0xD

	errorMessage: db "Error: One argument is missed", 0xa
	lenError: equ $-errorMessage

	errorMessage2: db "Error: There are too many arguments", 0xa
	lenError2: equ $-errorMessage2

	binSh: db "/bin/sh"
	lenBinSh: equ $-binSh
	;ltime db __TIME__,0ax
	;utcTime db __UTC_TIME__,0ax
	lenDate: equ $-date
	;lenLTime: equ $-ltime
	;lenUtcTime: equ $-utcTime

SECTION .bss
	lenType resd 1
	lenParam resd 1
	year resd 1
	month resd 1
	day resd 1
	buffer: resb 10
	lenPrint resd 1
	digit: resb 16

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
	jz errorMissedArg
	cmp eax, 3
	jg errorInvalidArg

	;mov eax, dword[nParams]
	;mov edi, digit
	;call intToString
	;call write_digit
	pop	ebx		; Get the program name
	pop	ebx		; Get the first actual argument ("-y or -d")
	mov [type], ebx
	;Validar si el argumento es -y o -d
	call printf
	pop	ebx		; "year or date"
	mov [param], ebx
	;Validar si el argumento es solo compuesto por numeros y tienen la longitud necesaria
	call printf

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
	mov   ebp, esp
	mov   ecx, 10
	push 0x0a  ;End of line \n

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
	mov eax, 4                  ; system call #4 = sys_write
	mov ebx, 1                  ; file descriptor 1 = stdout
	mov ecx, digit              ; store *address* of digit into ecx
	mov edx, 16                 ; byte size of 16
	int 80h
	ret

currentYear:
	;Procedimiento para mostrar calendario del año actual, sin argumentos
	jmp Exit

errorMissedArg:
	write_string errorMessage, lenError
	;One argument is missed so exit the program
	jmp Error

errorInvalidArg:
	write_string errorMessage2, lenError2
	;There are too many arguments so exit the program
	jmp Error

Error:

Exit:
	syscall_exit
