%include "io.inc"
section .data
a:resd 1
section .text
global main
main:
	GET_UDEC 4,[a]
	;deljenik edx:eax
	mov eax,[a]
	mov edx,0
	mov ebx,2
	div ebx
	cmp edx,0
	jne skok1
        ; u ovom slucaju ne treba nista vise da radimo jer je izlaz spreman i nalazi se u eax
	jmp stampaj
skok1: mov ebx,3
	mov eax,[a]
	mul ebx
	add eax,1
stampaj: PRINT_DEC 4, eax
	ret
	
	