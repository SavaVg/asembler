%include "io.inc"

section .data
    n: resd 1

section .text
    global CMAIN
CMAIN:
    GET_UDEC 4, [n]
    ;deljenik
    mov eax, [n]
    mov edx,0
    ;delilac
    mov ecx, 10
    ;u ebx ce biti rezultat
    mov ebx, 0
proveri: cmp eax, 0
    je izlaz
    div ecx
    add ebx, edx
    mov edx,0
    jmp proveri
   
izlaz:
    PRINT_UDEC 4, ebx
    ret