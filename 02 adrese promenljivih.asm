%include "io.inc"
section .data
a: resd 1
b: resw 1
c: resb 1
d: resb 3
e: resd 3
f: resw 2


section .text
global main
main:
    mov eax, a
    PRINT_DEC 4,eax
    NEWLINE
    mov eax, b
    PRINT_DEC 4,eax
    NEWLINE
    mov eax, c
    PRINT_DEC 4,eax
    NEWLINE
    mov eax, d
    PRINT_DEC 4,eax
    NEWLINE
    mov eax, e
    PRINT_DEC 4,eax
    NEWLINE
    mov eax, f
    PRINT_DEC 4,eax
    NEWLINE
    
    
    
    
    ;write your code here
    xor eax, eax
    ret