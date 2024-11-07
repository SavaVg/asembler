%include "io.inc"

section .bss
    a: resd 1
    b: resd 1
    rez: resd 1

section .text
euklid:
    mov eax, [esp + 8]
    mov edx, 0
    PRINT_UDEC 4, eax
    NEWLINE
    mov ebx, [esp + 4]
    PRINT_UDEC 4, ebx
    NEWLINE
.petlja1b: cmp ebx, 0
    je .petlja1e
    div ebx
    mov eax, ebx
    mov ebx, edx
    ;zbog deljenika
    mov edx,0
    jmp .petlja1b
.petlja1e:
    mov [esp+12], eax
    ret    
global CMAIN
CMAIN:
    GET_UDEC 4, [a]
    GET_UDEC 4, [b]
    PUSH dword [rez]
    push dword [a]
    push dword [b]
    call euklid
    add esp, 8
    pop eax
    PRINT_UDEC 4, eax
    NEWLINE
        
    ret
