%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 1
    mov ebx, 1
    mov ecx, 2 ;input  
    bucle: 
        cmp ecx, 1
        je end
        xchg eax, ebx
        add ebx, eax
        dec ecx
        jmp bucle
    end:
        PRINT_UDEC 1,eax
    xor eax, eax
    ret