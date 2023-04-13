%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;recibo en eax
    mov eax, 17
    mov ebx, eax
    fac:
        dec ebx 
        cmp ebx, 1
        je outthere
        mul ebx
        jmp fac
    outthere:
        PRINT_UDEC 1,eax
        NEWLINE
        PRINT_STRING "FIN"        
    xor eax, eax
    ret