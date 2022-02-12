BITS 64

section .text           ; directive starts the actual program code

global strchr:          ; export symbol of strchr function for usage in lib

strchr:
    push rbp            ; initialisation of the stack with the "register base pointer"
    mov rbp, rsp        ; initialisation "register stack pointer"
    mov rax, 0          ; declare a counter in the stack with the value 0 "register a extended"

loop:
    cmp byte [rdi], sil ; compare if the character in string: rdi is equal to the character given as argument 'sil'
    je found            ; go to the found if the previous condition is true

    cmp byte [rdi], 0   ; compare if the character in string: rdi == '\0'
    je end              ; go to the end if the previous condition is true

    inc rdi             ; increment rdi to go to the next character of the string
    jmp loop            ; new turn in the loop

found:
    mov rax, rdi        ; return the value of pointer *rdi

end:
    leave               ; quit properly the stack
    ret                 ; return