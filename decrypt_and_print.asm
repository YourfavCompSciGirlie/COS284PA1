; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================
section .data
    fmt db "%c", 0
    ; Do not modify anything above this line unless you know what you are doing.
    ; ==========================

    test_string db "the plaintext is: ", 0
    len equ $ -test_string

    exclusive dd 0x73113777
    input db 4, 0  
    ; ==========================

section .text
    global decrypt_and_print
    extern printf
;When using the below function, be sure to place whatever you want to print in the rax register first
print_char_32:
    mov rsi, rax
    mov rdi, fmt
    xor rax, rax
    call printf
    ret

decrypt_and_print:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    mov r8, rdi
    mov r9, rsi
    mov r10, rdx
    mov r11, rcx

 
    ror r8d, 4
    xor r8d, [exclusive]
    mov byte [input], r8b  ; Store first input character

    ror r9d, 4
    xor r9d, [exclusive]
    mov byte [input+1], r9b  ; Store second input character

    ror r10d, 4
    xor r10d, [exclusive]
    mov byte [input+2], r10b  ; Store third input character

    ror r11d, 4
    xor r11d, [exclusive]
    mov byte [input+3], r11b  ; Store fourth input character


    ; Print the characters
    movzx eax, byte [input]
    call print_char_32

    movzx eax, byte [input+1]
    call print_char_32

    movzx eax, byte [input+2]
    call print_char_32

    movzx eax, byte [input+3]
    call print_char_32


    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing
    ret
