; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    user_choice resb 4       ; Reserve 4 bytes for storing the user input
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    ; Your data goes here
    ; Read user input from stdin
    mov rax, 0               ; syscall number for sys_read
    mov rdi, 0               ; file descriptor 0 is stdin
    mov rsi, user_choice     ; pointer to the buffer to store input
    mov rdx, 4               ; number of bytes to read
    syscall                  ; call the kernel

    ; Convert input from ASCII to integer (assuming single digit)
    movzx rax, byte [user_choice] ; Load the first byte of input into rax
    sub rax, '0'                   ; Convert ASCII to integer (e.g., '1' -> 1)
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret