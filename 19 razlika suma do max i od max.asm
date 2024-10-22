%include "io.inc"
section .bss
a:resw 50000
n: resw 1
section .text
global main
main:
    GET_DEC 2, [n]
    mov eax, 0
    mov bx, -1
    mov cx, 0
    mov esi, 0
petlja1b:
    cmp ax, [n]
    je petlja1e
    GET_DEC 2, [eax*2+a]
    cmp [eax*2+a], cx
    jle nista1
    mov cx, [eax*2+a]
    mov bx, ax
nista1:
    inc ax
    jmp petlja1b
petlja1e:
    mov eax, 0
petlja2b: 
    cmp ax, bx
    je petlja2e
    add si, [eax*2+a]
    
    inc ax
    jmp petlja2b
petlja2e:

    inc eax
    
petlja3b: 
    cmp ax, [n]
    je petlja3e
    sub si, [eax*2+a]
    
    inc ax
    jmp petlja3b
petlja3e:
    PRINT_DEC 2, si
    

    ret