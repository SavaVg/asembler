%include "io.inc"
section .data
a: resd 1
b: resd 1
c: resd 1
section .text
global main
main:
    GET_DEC 4, [a]
    GET_DEC 4, [b]
    GET_DEC 4, [c]
    mov eax, [b]
    ADD eax, [c]
    suB [a], eax
    PRINT_DEC 4, [a]
    ;write your code here
    xor eax, eax
    ret