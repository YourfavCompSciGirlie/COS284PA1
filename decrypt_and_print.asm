; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================


section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here

    pl_txt db "The plaintext is: ", 0
    pl_len equ $ - pl_txt
    exclusive dd 0x73113777

    ; ==========================


section .text
    global decrypt_and_print
    extern printf

print_char_32:

    movzx rdi, al
    mov rsi, rdi
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================


    ; Print "The plaintext is: "
    mov rax, 1
    mov rdi, 1
    lea rsi, [pl_txt]
    mov rdx, pl_len
    syscall

    ;below we will be encrypted each integer might be wrong thou still working on it 

    mov eax, edi         ;loading 1st
    xor eax, [exclusive] ; XOR 
    ror eax, 4           ; rotation 
    call print_char_32   ; print


    mov eax, esi         ; l_2
    ror eax, 4              ;wanted to check if order mattered
    xor eax, [exclusive]  
    call print_char_32    

    mov eax, edx         
    xor eax, [exclusive]  
    ror eax, 4           
    call print_char_32   

    mov eax, ecx         
    xor eax, [exclusive] 
    ror eax, 4          
    call print_char_32   

  


    xor rax, rax
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
    ret
