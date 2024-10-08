%include "io.inc"

section .data
    a: resd 1
    b: resd 1

section .text
    global CMAIN
CMAIN:
    GET_UDEC 4, [a]
    GET_UDEC 4, [b]
    ;deljenik
    mov eax, [a]
    mov edx,0
    ;delilac
    mov ecx, [b]
proveri: cmp ecx, 0
    je izlaz
    div ecx
    mov eax, ecx
    mov ecx, edx
    ;zbog deljenika
    mov edx,0
    jmp proveri
izlaz:
    PRINT_UDEC 4, eax
    ret