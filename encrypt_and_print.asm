; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .data
    fmt db "%d ", 0  ; Format string for printing integers with a space
    msg db "Enter plaintext to encrypt: ", 0
    msg_len equ $ - msg
    
    message db "The cipher text is: ", 0
    msg_len2 equ $ - message

    exclusive dd 0x73113777  ; XOR value

section .bss
    user_input resb 4  ; Reserve 4 bytes for user input

section .text
    global encrypt_and_print
    extern printf

; Function to print a 32-bit integer
print_int_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

encrypt_and_print:
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

    ; Encrypt first character
    movzx rbx, byte [user_input]       ; Load first byte
    rol rbx, 4                         ; Rotate left by 4 bits
    mov eax, dword [exclusive]         ; Load XOR value
    xor ebx, eax                       ; Apply XOR operation
    mov rax, rbx
    call print_int_32

    ; Encrypt second character
    movzx rbx, byte [user_input+1]     ; Load second byte
    rol rbx, 4
    mov eax, dword [exclusive]
    xor ebx, eax
    mov rax, rbx
    call print_int_32

    ; Encrypt third character
    movzx rbx, byte [user_input+2]     ; Load third byte
    rol rbx, 4
    mov eax, dword [exclusive]
    xor ebx, eax
    mov rax, rbx
    call print_int_32

    ; Encrypt fourth character
    movzx rbx, byte [user_input+3]     ; Load fourth byte
    rol rbx, 4
    mov eax, dword [exclusive]
    xor ebx, eax
    mov rax, rbx
    call print_int_32

    ret

