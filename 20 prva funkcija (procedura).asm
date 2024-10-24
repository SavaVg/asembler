%include "io.inc"

section .bss
    n: resw 1
        
section .text
prestupna:
    mov dx, 0
    
    div si
    cmp dx, 0
    jne nije
    
    div di   
    cmp dx, 0
    jne jeste
    
    div si
    cmp dx, 0
    jne nije
jeste:
    PRINT_STRING "da"
    NEWLINE
    ret
nije:
    PRINT_STRING "ne"
    NEWLINE
    ret

global CMAIN
CMAIN:

    mov si, 4
    mov di, 25
    
    GET_DEC 2, [n]
    mov bx,0
    
petlja1b:
    cmp bx,[n]
    je petlja2e
    
    GET_UDEC 2, ax
    
    call prestupna
    
    inc bx
    jmp petlja1b

petlja2e:

    ret