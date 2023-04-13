%include "io.inc"

section .data
word1 db "hola mundo",0
word2 db " cruel",0
pos db 20
section .bss
result resb 100
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    xor ecx,ecx
    mov cl , byte[pos]
    mov eax, 0
    repetir:
    xor ebx,ebx
    mov bl, byte[word1+eax]
    mov byte[result+eax], bl
    inc eax
    loop repetir
    xor ebx, ebx
    xor ecx, ecx
    mover2:
       mov cl, byte[word2+ebx]
       cmp cl, 0
       je outt
       mov [result+eax], cl
       inc eax
       inc ebx
       jmp mover2
    
    outt:
    xor ebx, ebx 
    xor ecx, ecx
    mov bl, byte[pos]
    mover3:
       mov cl, byte[word1+ebx]
       cmp cl, 0
       je outt2
       mov [result+eax], cl
       inc eax
       inc ebx
       jmp mover3
    
    
    
    outt2:
    jmp print
    
    
    ret
print:
pusha 
    mov ecx, 100
    mov eax, 0
    repet:
    xor ebx,ebx
    mov bl, byte[result+eax]
    inc eax
    PRINT_CHAR bl
    loop repet
popa
ret