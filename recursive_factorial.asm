%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;testing stack
    mov eax, 5 
    call factorial
    PRINT_UDEC 1, eax
    ret
    factorial:
        cmp eax, 1
        je base
        push eax
        dec eax
        call factorial 
        pop ebx
        mul ebx 
        ret 
        base:
        mov eax,1 
        ret
        
    PRINT_UDEC 1, eax
    
    xor eax, eax
    ret