%include "io.inc"

section .bss
    n: resw 1
        
section .text
prestupna:
    PRINT_DEC 4, esp
    NEWLINE
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
    PRINT_DEC 4, esp
    NEWLINE
    ret
nije:
    PRINT_STRING "ne"
    NEWLINE
    PRINT_DEC 4, esp
    NEWLINE
    ret

global CMAIN
CMAIN:
    PRINT_DEC 4, esp
    NEWLINE
    mov si, 4
    mov di, 25
    
    GET_DEC 2, [n]
    mov bx,0
    
petlja1b:
    cmp bx,[n]
    je petlja2e
    
    GET_UDEC 2, ax
    
    PRINT_DEC 4, esp
    NEWLINE
    call prestupna
    PRINT_DEC 4, esp
    NEWLINE
    
    inc bx
    jmp petlja1b

petlja2e:
    PRINT_DEC 4, esp
    NEWLINE
    ret