%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 31
    cmp eax,2
    je EsPrimo
    mov ebx,3
    bucle: 
        cmp eax, ebx
        je EsPrimo
        mov ecx, eax
        mov edx,0
        div ebx
        mov eax, ecx
        cmp edx,0
        je NoEsPrimo
        add ebx, 2
        jmp bucle
    EsPrimo:
        PRINT_STRING "Es Primo"
        ret 
    NoEsPrimo:
        PRINT_STRING "No es Primo"
        ret 
    xor eax, eax
    ret