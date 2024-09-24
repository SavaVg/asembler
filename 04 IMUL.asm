;odredi a*b, a/b i a%b
section .text
global main
main:;izracunati vrednost izraza a-(b+c)
%include "io.inc"
section .data
a: resb 1
b: resb 1
section .text
global main
main:
    GET_DEC 1, [a]
    GET_DEC 1, [b]
    ;sa al ne radi
    mov ax, [a]
    IMUL ax, [b]
    PRINT_DEC 1, al
    ;write your code here
    xor eax, eax
    ret