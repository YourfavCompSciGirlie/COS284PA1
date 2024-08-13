; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .data
    ;Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]? is our message
    ; ==========================
    ; Your data goes here
    welcome_message db "Welcome agent. What do you want to do, Encrypt [1] or Decrypt [2]?", 0xA
    welcome_len equ $ - welcome_message  ; Calculate length of the message
    ; ==========================


section .text
    global greeting

greeting:
    ; Do not modify anything above this line unless you know what you are doing
    ; ==========================
    ; Print the welcome message to the console
    mov rax, 1                ; syscall number for sys_write
    mov rdi, 1                ; file descriptor 1 is stdout
    mov rsi, welcome_message  ; pointer to the message
    mov rdx, welcome_len      ; length of the message
    syscall                   ; call the kernel
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing

    ret                         ; return from function