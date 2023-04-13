%include "io.inc"


%macro euclides 2
    push edx 
    cmp %2, 0
    je fin
    mov eax, %1 
    mov edx, 0
    div %2
    mov eax, edx
    fin:
    pop edx 
%endmacro

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;gcd 
    ;params
    
    mov eax , 235324
    mov ebx , 232
    
    
    
    loopp:
        cmp eax, 0
        je found
        euclides eax, ebx 
        xchg eax, ebx
        jmp loopp
        found:
        mov eax, ebx
    
    
    PRINT_UDEC 1, eax
    
    xor eax, eax
    ret
    
    