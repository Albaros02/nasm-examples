%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;testing stack
    mov eax, 10
    call fibonacci
    PRINT_UDEC 1, eax
    ret
    fibonacci:
        cmp eax, 1
        je base 
        cmp eax, 2
        je base 
        
        dec eax 
        push eax 
        ;calling f(x-1)
        call fibonacci 
        pop ebx  
        push eax 
        dec ebx 
        mov eax, ebx 
        ;calling f(x-2)                    
        call fibonacci
        pop ebx 
        add eax, ebx
        ret 
        
        ret 
        base:
        mov eax,1 
        ret
        
    PRINT_UDEC 1, eax
    
    xor eax, eax
    ret