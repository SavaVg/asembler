; program ucitava broj sa ulaza, zatim odredjuje njegovu apsolutnu vrednost i ispisuje je na izlazu

%include "io.inc"
section .text
global CMAIN
CMAIN:
    GET_DEC 2, ax
    CMP ax,0
    jge stampaj
    imul ax, -1 ;varijanta imul sa dva operanda
    
stampaj:
    PRINT_DEC 2, ax
    ret