%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 11
    mov edx, 0
    mov ebx, 2
    div ebx
    cmp edx, 1
    je par
    PRINT_STRING "Es par"
    ret
    par:
        PRINT_STRING "Es impar"
        ret
    ;write your code here
    xor eax, eax
    ret