%include "io.inc"
section .data
a:resw 1000
n: resw 1
section .text
global main
main:
    GET_DEC 2, [n]
    mov eax, 0
ucitaj:
    cmp ax, [n]
    je ISKOCI
    GET_DEC 2, [eax*2+a]
    inc ax
    jmp ucitaj
ISKOCI:
    dec ax
ispisi:
    cmp ax, 0
    jl kraj
    PRINT_DEC 2, [eax*2+a]
    NEWLINE
    dec ax
    jmp ispisi
    
kraj:
    
    ret