%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global main
main:
    ;ulaz -7 20
    GET_DEC 1, [a]
    GET_DEC 1, [b]
    mov AL, [a]
    imul byte [b]
    PRINT_DEC 1, AL
    NEWLINE
    PRINT_DEC 2, AX
    NEWLINE
    PRINT_DEC 1, AH
    ret