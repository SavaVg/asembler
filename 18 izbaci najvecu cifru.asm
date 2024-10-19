%include "io.inc"

; Program izbacuje sva pojavljivanja najvece cifre iz dekadnog
; zapisa unetog broja.

section .bss
; na lokaciju x ucitavamo prirodan broj ciji binarni zapis staje u 4 bajta.
; Dakle, najveci broj koji mozemo ucitati je 2^32-1=4294967295
x: resd 1 
; s obzirom da broj koji ucitavamo ima 10 cifara, za pamcenje cifara dovoljan je niz duzine 10
; iako cifru mozemo zapisati jednim bajtom, pojaviljivace se u kontekstu mnozenja i deljenja duzine 4
; pa zbog toga cemo ipak napraviti niz doubleword-ova
; na indeksu "i" niza cifre pisemo cifru sa pozicije "i" dekadnog zapisa broja [x]
; primer:  broju 4553251 odgovara niz 1, 5, 2, 3, 5, 5, 4
cifre: resd 10

section .text
global main
main:

    ; Ucitavamo broj x sa ulaza
    GET_UDEC 4, [x]
    
    ; frekventno ce nam trebati broj 10 za deljenje i mnozenje duzine 4
    ; zbog toga cemo ga staviti u neki 32-bitni registar koji nam ne treba
    mov esi, 10
    
    ; trebace nam i prostor za drzanje maksimalne cifre
    ; iako ovde mozemo izbeci duzinu 4, necemo biti shkrti
    ; i nju cemo staviti u registar koji nam ne treba
    ; 0 je idealna inicijalna vrednost za najvecu cifru
    mov edi, 0
    
    ; pripremamo se za kreiranje niza
    mov eax, [x]; treba nam [x] u eax zbog deljenja
    mov edx, 0; sa ovom i prethodnom linijom je postavljen deljenik
    
    ;treba nam jedan registar za indeksiranje niza
    ;uzecemo ebx
    ;indeks niza ujedno predstavlja i poziciju cifre u dekadnom zapisu broja
    mov ebx, 0
    
    ; narednom petljom trebimo cifre u niz i ujedno odredjujemo najvecu cifru
petlja1B:
    cmp eax, 0; ako je eax nula nema vise sta da se trebi
    je petlja1E
    ;delimo broj sa 10
    div esi
    ;prebacujemo cifru sa pozicije ebx u niz cifara na indeks ebx
    mov [ebx*4+cifre], edx 
    ;update-ujemo najvecu cifru
    cmp edx, edi ; ako je nova cifra manje ili jednaka od najvece, ne radi nista
    jbe nista1
    mov edi, edx
nista1:
    ;postavi novu poziciju
    inc ebx
    ;pripremi nov deljenik
    mov edx, 0 
    jmp petlja1B
    
petlja1E:

    ;algoritam formiranja broja
    ;broj: 4553251 niz: 1 5 5 3 2 5 1
    ;obradjuju se cifre sa kraja niza, najveca se zanemaruje
    ;0 - start
    ;0*10+4=4
    ;4*10+3=43
    ;43*10+2=432
    ;432*10+1=4321 - kraj (obradjene sve cifre iz niza)
    
    ; u ebx je pozicija za 1 veca od najvece
    ; umanjicemo ebx tako da pokazuje na najvecu poziciju u zapisu broja
    dec ebx    
    
    ; u eax ce biti rezultat, za sada je u eax nula bas kao sto nam treba
    
    ;petlja koja formira rezultat
petlja2B:
    cmp ebx,0 ;kada pozicija postane manja od 0 izlazimo iz petlje
    jl petlja2E
    cmp [ebx*4+cifre], edi ; poredimo cifru na poziciji ebx sa najvecom, ako su jednake ne radimo nista
    je nista2 
    mul esi
    add eax, [ebx*4+cifre]
nista2:
    dec ebx ;idemo na narednu poziciju (ona je za jedan manja od aktuelne)
    jmp petlja2B
    
petlja2E:   

    PRINT_DEC 4, eax
    ret