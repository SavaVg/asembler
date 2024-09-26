%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global main
main:
    ;radimo sa deliocem duzine 2
    GET_DEC 2, [a]
    GET_DEC 2, [b]
    ;smestamo deljenik u DX:AX
    mov dx, 0
    mov ax, [a]
    div word [b]
    PRINT_STRING 'kolicnik: '
    ;kolicnik ce biti u nizoj polovini deljenika
    PRINT_UDEC 2, AX
    NEWLINE
    PRINT_STRING 'ostatak: '
    ;ostatak ce biti u visojj polovini deljenika
    PRINT_UDEC 2, DX
    NEWLINE
  
    ret