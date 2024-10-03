%include "io.inc"
section .data
a: resw 1
b: resw 1
c: resw 1
pomoc: 
section .text
global CMAIN
CMAIN:
    GET_DEC 2, [a]
    GET_DEC 2, [b]
    GET_DEC 2, [c]
    mov cx, 1
    mov bx, 7;ovo je delilac
    ;sada postavljamo deljenik
    mov ax, [b]
    mov dx, 1
    imul dx;nakon ovoga deljenik je postavljen u dx:ax
    idiv bx
    CMP dx,0
    jne sledeci1
    imul cx, [a]
 sledeci1:
    mov ax, [b]
    mov dx, 1
    imul dx;nakon ovoga deljenik je postavljen u dx:ax
    idiv bx
    CMP dx,0
    jne sledeci2
    imul cx, [b]
sledeci2:
    mov ax, [c]
    mov dx, 1
    imul dx;nakon ovoga deljenik je postavljen u dx:ax
    idiv bx
    CMP dx,0
    jne stampaj
    imul cx, [c]
    
stampaj:
    PRINT_DEC 2, cx
    ret