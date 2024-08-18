; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .data
    fmt db "%c", 0             ; Format string for printing characters
    intro_msg db "Enter cipher text to decrypt: ", 0 ; Introduction message
    intro_msg_len equ $ - intro_msg ; Length of the introduction message
    result_msg db "The plaintext is: ", 0 ; Result message
    result_msg_len equ $ - result_msg ; Length of the result message
    xor_key dd 0x73113777      ; XOR key for decryption

section .bss
    buffer resb 4              ; Reserve 4 bytes for the buffer

section .text
global decrypt_and_print
extern printf

; Function to print a single character
print_single_char:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Save the original registers
    mov r15, rdi
    mov r14, rsi
    mov r13, rdx
    mov r12, rcx

    ; Print "Decrypting text: "
    mov rax, 1               ; syscall for write
    mov rdi, 1               ; stdout handle
    mov rsi, intro_msg       ; Pointer to intro message
    mov rdx, intro_msg_len   ; Length of the message
    syscall

    ; Read the cipher text
    mov rax, 0               ; syscall for read
    mov rdi, 0               ; stdin handle
    lea rsi, [buffer]        ; Buffer to store input
    mov rdx, 4               ; Number of bytes to read
    syscall

    ; Print "Plaintext result: "
    mov rax, 1               ; syscall for write
    mov rdi, 1               ; stdout handle
    lea rsi, [result_msg]    ; Pointer to result message
    mov rdx, result_msg_len  ; Length of the message
    syscall

    ; Decrypt and print each byte
    mov rax, r15
    call decrypt_byte
    call print_single_char

    mov rax, r14
    call decrypt_byte
    call print_single_char

    mov rax, r13
    call decrypt_byte
    call print_single_char

    mov rax, r12
    call decrypt_byte
    call print_single_char

    ret

decrypt_byte:
    ror rax, 4               ; Rotate right by 4 bits
    xor rax, [xor_key]       ; XOR with the key
    and rax, 0xFF            ; Isolate the lowest byte
    ret
