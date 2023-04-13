%include "io.inc"
section .data
words db "casa",10,"casac",10,"perro",10,"abba",10,0 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, words
    mov ebx, eax
    loop:
        mov dl, [ebx]
        cmp dl, 10
        je isPalindrom
        cmp dl, 0
        je end
        inc ebx              
        jmp loop
    backtoloop: 
        inc ebx
        mov eax , ebx 
        jmp loop    
    isPalindrom:
        pusha 
            dec ebx 
            again:
            jmp checkchar 
            backispal:
            jmp incremento
            noespal:
               PRINT_STRING "No es palindromo" 
               NEWLINE
            endispal:                                             
        popa    
        jmp backtoloop
    incremento:
        dec ebx
        inc eax
        cmp eax, ebx
        jng again
            PRINT_STRING "Es Palindromo"
            NEWLINE
        jmp endispal
    checkchar:
        pusha 
        mov dl ,[eax]
        mov eax, 0
        mov al ,[ebx]
        cmp al, dl
        je good
        popa
        jmp noespal
        good:        
        popa
        jmp backispal
    end:
        NEWLINE
        PRINT_STRING "FIN"
    xor eax, eax
    ret