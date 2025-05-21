%include 'io.inc'
section .bss
ulaz: resd 1
section .text
global main
main:
    GET_UDEC 4, [ulaz]
    sub esp,4
    PUSH dword [ulaz]
    call mocan
    add esp, 4
    cmp dword [esp], 0
    je nije
    PRINT_STRING 'jeste'    
    jmp kraj
nije:
    PRINT_STRING 'nije'

kraj:
    add esp, 4
    ret

mocan:
    mov eax, [esp + 4]
    mov edx, 0
    mov ebx, 2
    mov ecx, ebx
    imul ecx, ecx
    sub esp, 4; treba mi za brojac
    mov dword [esp], 0
.faktorisi:
    cmp ecx, eax
    jg .izadjif
.trebi:
    mov edi, eax; sacuvaj eax
    div ebx
    cmp edx, 0
    je .povecajbrojac
    mov edx,0
    cmp dword [esp], 2
    jge .sledecibx
    jmp .nije
.povecajbrojac:
    inc dword [esp]
    jmp .trebi
.sledecibx:
    mov eax, edi
    inc ebx
    mov ecx, ebx
    imul ecx, ecx
    jmp .faktorisi
.izadjif:
    cmp eax , 1
    jne .nije
    mov dword [esp +12], 1
    add esp, 4
    ret
.nije:
    mov dword [esp +12], 0
    add esp, 4
    ret