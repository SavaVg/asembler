%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global main
main:
    ;radimo sa deliocem duzine 4
    GET_DEC 4, [a]
    GET_DEC 4, [b]
    ;smestamo deljenik u EDX:EAX
    mov edx, 0;ovo je dovoljno ako je deljenik pozitivan
    not edx; ovo treba dodati ako je deljenik negativan, da bi popunili edx sa svim kecevima (not od 0...0 je 1...1)
    mov eax, [a]
    idiv dword [b]
    PRINT_STRING 'kolicnik: '
    ;kolicnik ce biti u nizoj polovini deljenika
    PRINT_DEC 4, EAX
    NEWLINE
    PRINT_STRING 'ostatak: '
    ;ostatak ce biti u visojj polovini deljenika
    PRINT_DEC 4, EDX
    NEWLINE
  
    ret