; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .data
    fmt db "%d", 0  ; c for char d for int's

    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Your data goes here

    msg db "Enter plaintext to encrypt: "
    msg_len equ $ - msg
    
    message db "The cipher text is: "
    msg_len2 equ $ - message

    exclusive dd 0x73113777  ; XOR value

    space db ' ', 0
    newline db 10, 0  
   ; ==========================
section .bss
    user_input resb 4  ; 4 bytes for input
    encrypted_values resd 4  ; Space to store 4 encrypted integers (32 bits each)

section .text
    global encrypt_and_print
    extern printf

print_int:

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
    ; idea was to encrypt one byte at a time
    cmp ecx, 4  ; Check if all 4 bytes are processed
    jge print_all_encrypted_values

    movzx ebx, byte [user_input + ecx]  ; Load one byte
    rol ebx, 4  ; rotation
    xor ebx, [exclusive]  ; xor operation

    
    mov [encrypted_values + ecx * 4], ebx ; created a variable to stores the ones we encrypted in there

    inc ecx
    jmp encrypt

print_all_encrypted_values:
   
    xor ecx, ecx  ;make our counter zero again

    print_loop:
    cmp ecx, 4  
    jge complete

    mov eax, [encrypted_values + ecx * 4]  ; Load the encrypted value
    call print_int  ;printing function

    ;tryna print spaces as well might be the issue but when removed either we get an infinite loop
    ;or a invalid size error
    mov rax, 1
    mov rdi, 1
    lea rsi, [space]
    mov rdx, 1
    syscall

    inc ecx
    jmp print_loop

complete:

    mov rax, 1
    mov rdi, 1
    lea rsi, [newline]
    mov rdx, 1
    syscall
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
    ret
