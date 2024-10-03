%include "io.inc"

section .data
    a: resd 1

section .text
    global CMAIN
CMAIN:
    GET_DEC 4, [a]
    ;deljenik
    mov eax, [a]
    mov edx, 0
    ;delilac
    mov ecx, 4
    
    ;deljiv sa 4
    div ecx
    cmp edx, 0
    jne no
    ;nadalje znamo da je godina deljiva sa 4
    
    ;opet deljenik jer se izmenio
    mov eax, [a]
    mov edx, 0
    ;delilac
    mov ecx, 100
    
    ;deljiv sa 100
    div ecx
    cmp edx, 0
    jne yes
    ; nadalje znamo da je godina deljiva sa 100

    ;ponovo deljenik
    mov eax, [a]
    mov edx, 0
    ;delilac   
    mov ecx, 400

    ;deljiv sa 400
    div ecx
    cmp edx, 0
    jne no

yes:
    PRINT_STRING "Da"
    NEWLINE
    jmp kraj
no:
    PRINT_STRING "Ne"
    NEWLINE
kraj:  ret