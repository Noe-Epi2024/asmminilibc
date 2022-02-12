BITS 64

section .text           ; directive starts the actual program code

global memset:          ; export symbol of memset function for usage in lib

memset:
    push rbp            ; initialisation of the stack with the "register base pointer"
    mov rbp, rsp        ; initialisation "register stack pointer"
    mov rax, rdi        ; rax get the value of the register destination index 'rdi' the First argument in memset

loop:
    cmp rdx, 0          ; compare : counter rdx != 0 | rdx is the Third argument in the function memset 'size_t'
    je end              ; go to the end if the previous condition is true

    mov [rax], sil      ; replace the actual pointer *rax by the character given as argument 'sil' the Second Parameter
    inc rax             ; increment rax to go to the next character of the string
    dec rdx             ; decrement rdx after changed the character in the string and continue the loop until rdx == 0

    jmp loop            ; new turn in the loop

end:
    mov rax, rdi        ; return the value of pointer rdi
    leave               ; quit properly the stack
    ret                 ; return