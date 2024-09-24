%include "io.inc"
section .data

section .text
global main
main:
    ;primer1
    ;eax binarno 0000 0000 0000 0001 00000001 00000010
    ;onda je:
    ;ax: 00000001 00000010
    ;al: 00000010
    ;ah: 00000001
    ;mov eax, 65794
    
    ;primer2
    ;eax binarno 0000 0000 0000 0001 10000000 01000000
    ;onda je:
    ;ax: 10000000 01000000
    ;al: 01000000
    ;ah: 10000000
    ;eax u dec je: 2**16+2**15+2**6
    mov eax, 98368
    
    PRINT_DEC 2, ax
    NEWLINE
    PRINT_DEC 1, ah
    NEWLINE
    PRINT_DEC 1, al
    NEWLINE
    ret