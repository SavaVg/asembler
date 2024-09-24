%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global main
main:
    ;ulaz 15 20
    GET_UDEC 1, [a]
    GET_UDEC 1, [b]
    mov AL, [a]
    mul byte [b]
    PRINT_UDEC 1, AL
    NEWLINE
    PRINT_UDEC 2, AX
    NEWLINE
    PRINT_UDEC 1, AH
    ret