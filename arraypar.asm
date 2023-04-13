%include "io.inc"
section .data 
array dd 1,2,3,4,5,6,7,8,9,10
len db 10
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, array
    mov ecx, [len]
    recorer:
        dec ecx
        cmp ecx,0
        je outthere
        mov ebx, 2
        push eax
        mov eax, [eax]
        mov edx,0
        div ebx
        cmp edx , 0
        pop eax
        je espar
        PRINT_STRING "impar "
        PRINT_UDEC 1,[eax]
        NEWLINE
        add eax, 4
        jmp recorer
        
        
    espar: 
        PRINT_STRING "par "
        PRINT_UDEC 1,[eax]
        NEWLINE
        add eax, 4
        jmp recorer
    outthere:
        PRINT_STRING "Fin"        
    ret