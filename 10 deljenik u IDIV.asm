%include "io.inc"
section .data
a: resd 1
b: resd 1
section .text
global CMAIN
CMAIN:
    GET_DEC 2, [a]
    GET_DEC 2, [b]
    ;treba izracunati kolicnik i ostatak pri deljenju a sa b
    ;deljenik stavljamo u dx:ax
    ; u ax definitivno treba da bude a i tu nema problema
    mov ax, [a]
    ; ako je a negativan svi bitovi od dx treba da budu 1
    ; u suprotnom svi nula
    
    ;stavimo da su svi bitovi od dx nula
    mov dx, 0
    ;proverimo da li je a tj. ax veci ili jednak od nule
    cmp ax, 0
    ;ako jeste ne treba da menjamo dx, tj. dx:ax je spreman i mozemo da predjemo (skocimo) na deljenje sto je pod labelom podeli
    jge nastavi
    ;ovo ce se izvrsiti (nece biti preskoceno) ako je a manje od nule, bas kao sto treba (not ce od svih nula u dx, napraviti sve keceve)
    not dx
    
podeli: idiv word [b]

    PRINT_STRING 'kolicnik: '
    PRINT_DEC 2, AX

    NEWLINE

    PRINT_STRING 'ostatak: '
    PRINT_DEC 2, DX
    
    NEWLINE
    ret