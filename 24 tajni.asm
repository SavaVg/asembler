%include "io.inc"

section .text

global CMAIN
CMAIN:
    GET_UDEC 4, eax
    
    sub esp, 4 ; mesto na steku za return vrednost funkcije tajni_broj
    push eax ; dodajemo na stek argument funkcije tajni_broj
    call tajni_broj ;pozivamo funkciju tajni broj
    add esp, 4 ; ne treba nam vise argument funkcije. esp sada pokazuje na return vrednost funkcije tajni_broj
    PRINT_UDEC 4, [esp] ; stampamo return vrednost funkcije tajni_broj
    NEWLINE
    
    add esp, 4; ne treba nam vise return vrednost funkcije tajni broj. esp sada ima istu vrednost kao i na pocetku funkcije CMAIN
    ret ; kako esp ima istu vrednost kao na pocetku funkcije CMAIN, mozemo da izadjemo iz funkcije CMAIN

;#####################
;#funkcija tajni broj#
;#####################
tajni_broj:
    ; na pocetku funkcije esp ima vrednost za 4 manju nego pre poziva te funkcije jer je call instrukcija push-ovala EIP na stek
    ; samim tim adresa argumenta poziva na steku je za 4 veca od aktuelne vrednosti esp-a
    mov eax, [esp+4]; kopiram argument funkcije u eax
.do:; petlja koja transformise broj sa ulaza sve dok nedodje do jednocifrenog broja, sto je u stvari tajni broj, koji ova funkcija treba da vrati
    cmp eax, 10
    jl .end ; dosli do jednocifrenog broja
    
    PRINT_UDEC 4, eax ; ukoliko zelite da vidite transformacije od datog broja do tajnog broja
    NEWLINE
    
    push eax ; postavljamo argument funcije next_broj. Ovim se esp smanjio za 4
    call next_broj ; pozivamo funkciju next_broj koja ima za cilj da transformise broj iz argumenta
    pop eax ; na mestu argumenta funcije next_broj, izvrsavanjem te funkcije, postavljena je transformisani broj. Ovim se esp uvecao za 4, pa je isti kao na pocetku izvrsavanja ove funkcije.
    
    jmp .do
    
.end: ; odredjen je tajni broj
    mov [esp + 8], eax ; postavljamo return vrednost funkcije (kao sto znamo ona je na adresi na steku koja je za 4 veca nego vrednost argumenta)
    ret ; esp ima istu vrednost kao na pocetku izvrsavanja ove funkcije pa mozemo izaci iz funkcije

;####################
;#funkcija next broj#
;####################
next_broj:
    ; na pocetku funkcije esp ima vrednost za 4 manju nego pre poziva te funkcije jer je call instrukcija push-ovala EIP na stek
    ; samim tim adresa argumenta poziva na steku je za 4 veca od aktuelne vrednosti esp-a
    mov eax, [esp+4]; kopiram argument funkcije u eax
    
    mov ebx, 10 ; broj 10 nece se nikada menjati. Treba nam zbog div (ne moze konstanta tj. immediate operand)
    mov ecx, 1; dekadna jedinica
    
    mov edx, 0; edx na nula zbog deljenja
    div ebx; skini poslednju sa eax i stavi je u edx
    
    mov edi, 0; transformisani broj (rezultat funkcije) pakujemo u edi
.do:
    ; petlja koja odredjuje rezultat
    ; u svakoj iteraciji se odredjuje cifra rezuktata na poziciji odredjenoj dekadnom jedinicom ecx (1, 10, 100, ...)
    ; kad udjemo u petlju prenos je u edx
    ; petlja se zavrsava kada eax dodje do 0
    cmp eax, 0
    je .end ; kraj petlje. rezultat je odredjen i on je u edi -ju
    
    mov esi, edx ; prenos smestamo u esi, treba nam edx radi deljenja i smestanje novog prenosa
    
    mov edx, 0; edx na nula zbog deljenja
    div ebx; skini poslednju sa eax i stavi je u edx (to je novi prenos za sledecu iteraciju)

    ; odredjujemo cifru rezultata na poziciji odredjenoj sa ecx
    add esi, edx ; saberi prenos sa aktuelnom poslednjom cifrom i stavi ga u esi (stari prenos nam vise ne treba)
    cmp esi, 10 
    jl .dopisi ; ako je zbir manji od 10, onda je odredjena cifra rezultata na poziciji ecx (ona je u esi-ju). Dopisi tu cifru u edi
    sub esi, 9 ; ako je zbir dvocifren, zbir njegovih cifara se dobija oduzimanjem broj 9 od tog zbira i to je cifra rezultata na poziciji ecx (ona je u esi-ju)
.dopisi:
    ;dopisujemo cifru iz esi-ja na broj u edi-ju sa leve strane, tj. na poziciju odredjenu sa dekadnom jedinicom ecx
    imul esi, ecx 
    add edi, esi
    
    imul ecx, 10; povecavamo dekadnu jedinicu za sledecu iteraciju (prenos je vec u edx-u. takodje, eax je spreman za sledecu iteraciju)
    jmp .do; idemo na sledecu iteraciju
    
.end:
    mov [esp +4], edi ; na mestu argumenta funkcije na steku pisemo rezultat (vrednost argumenta nam vise ne treba)
    ret ; esp nismo menjali, pa opusteno izlazimo iz funkcije
