%include "io.inc"
section .data
word1 db "hola mundo",0
word2 db " cruel",0
pos db 5
section .bss
result resb 100
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    xor eax, eax
    
    ;push word1 
    ;call length
    ;mov ebx, eax
    push word2
    call length
    mov ebx,eax
    ;eax, ebx got the sizes
    
    mov ecx, [pos]
    mov esi, word1
    mov edi, result
    repite:
    movsb
    loop repite 
    
    mov esi, word2
    mov ecx, ebx
    
    repite2:
    movsb
    loop repite2 
    
    xor eax,eax
    mov esi, word1
    mov al, byte[pos]
    add esi, eax
    xor ebx,ebx
    repite3:
    mov bl, byte[esi]
    cmp bl, 0
    movsb 
    loopne repite3
    
    
    
    PRINT_STRING result
    
    xor eax, eax
    mov esp, ebp
    ret
    
length:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    mov eax, [ebp+8]
    mov ebx, 0
    xor ecx,ecx
    again:
    mov cl, byte[eax+ebx]
    cmp cl, 0
    je finl
    inc ebx
    jmp again
    
    finl:
    mov eax, ebx
    
    pop ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret