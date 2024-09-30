%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global main
main:
    ;ulaz -7 20
    GET_DEC 2, [a]
    GET_DEC 2, [b]
    ;pripremam deljenik
    mov ax, [a]
    ;kako imul sa jednim operandom rezultat smesta u dx:ax, to cemo njega iskoristi kako bi pisali u dx:ax
    ;mi zelimo da se dx:ax tumaci isto kao i ax (sto je zapravo broj a sa ulaza)
    ;zato samo treba ax da pomnozimo sa 1 pomocu imul-a
    ; operand od imula sa jednim operandom ne moze da bude neposredni, zato 1 zapisujemo u npr. bx
    mov bx, 1
    imul bx     
    idiv word [b]
    PRINT_DEC 1, Ax
    NEWLINE
    PRINT_DEC 2, dX
    ret