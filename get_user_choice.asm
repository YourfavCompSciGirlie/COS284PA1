; ==========================
; Group member 01: Yohali Malaika Kamangu u23618583
; Group member 02: Amantle Temo u23539764
; Group member 03: Aundrea Ncube u22747363
; ==========================

section .bss
    ; ==========================
    ; Your data goes here
    ; ==========================

section .text
    global get_user_choice

extern greeting             

get_user_choice:
    ; Call the greeting function to print the welcome message
    call greeting

    ; ==========================
    ; Your data goes here
    ; ==========================
    ; Do not modify anything below this line unless you know what you are doing 
    ret