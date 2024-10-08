%include "io.inc"

section .data
    n: resd 1

section .text
    global CMAIN
CMAIN:
    GET_DEC 4, [n]
    mov eax, 1
proveri: cmp eax, [n]
    ja izlaz
    PRINT_STRING "ne ucim racunarstvo"
    NEWLINE
    inc eax
    jmp proveri
izlaz: ret