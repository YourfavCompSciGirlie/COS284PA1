; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Lebogang Masenya u23535246
; Group member 03:  Mpho Siminya u21824241
; ==========================

section .data
    fmt db "%d", 0  ; Format string for printing integers
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================


    msg db "Enter plaintext to encrypt: ", 0
    msg_len equ $ - msg
    
    message db "The cipher text is: ", 0
    msg_len2 equ $ - message

    exclusive dd 0x73113777  ; XOR value

    space db ''.
    ; ==========================

section .bss
    user_input resb 4  

    ; ==========================
section .text
    global encrypt_and_print
    extern printf


;When using the below function, be sure to place whatever you want to print in the rax register first
print_int_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================


    ; Print "Enter plaintext to encrypt:"
    mov rax, 1
    mov rdi, 1
    lea rsi, [msg]
    mov rdx, msg_len
    syscall

    ; Read input
    mov rax, 0
    mov rdi, 0
    lea rsi, [user_input]
    mov rdx, 4  ; Read 4 bytes (one byte per character)
    syscall

    ; Print "The cipher text is: "
    mov rax, 1
    mov rdi, 1
    lea rsi, [message]
    mov rdx, msg_len2
    syscall

    xor ecx, ecx  ; i = 0
encrypt:
   
    movzx rbx, byte [user_input]  ; Load one byte
    rol rbx, 4                       ; Rotate left by 4 bits
    mov eax, dword [exclusive]  ; XOR with exclusive value
    xor ebx, eax
    ; Print the encrypted value
    mov rax, rbx
    call print_int_32
    ; Add space after encryption
    mov rax, 1
    mov rdi, 1
    lea rsi, [space]
    mov rdx, 1
    syscall
    jmp encrypt_

encrypt_:
    movzx rbx, byte [user_input+2]  
    rol rbx, 4                       
    mov eax, dword [exclusive]
    xor ebx, eax
    ; Print the encrypted value
    mov rax, rbx
    call print_int_32
    ; Add space after encryption
    mov rax, 1
    mov rdi, 1
    lea rsi, [space]
    mov rdx, 1
    syscall
    jmp encrypt_third

encrypt_third:
    movzx rbx, byte [user_input+3] 
    rol rbx, 4                       
    mov eax, dword [exclusive] 
    xor ebx, eax
    ; Print the encrypted value
    mov rax, rbx
    call print_int_32
    ; Add space after encryption
    mov rax, 1
    mov rdi, 1
    lea rsi, [space]
    mov rdx, 1
    syscall
    jmp encrypt_fourth

encrypt_fourth:
    movzx rbx, byte [user_input+4] 
    rol rbx, 4                      
    mov eax, dword [exclusive] 
    xor ebx, eax
    ; Print the encrypted value
    mov rax, rbx
    call print_int_32
    ; Add space after encryption
    mov rax, 1
    mov rdi, 1
    lea rsi, [space]
    mov rdx, 1
    syscall
    jmp complete

complete:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ret
