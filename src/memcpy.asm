BITS 64

section .text           ; directive starts the actual program code

global memcpy:          ; export symbol of memcpy function for usage in lib

memcpy:
    push rbp            ; initialisation of the stack with the "register base pointer"
    mov rbp, rsp        ; initialisation "register stack pointer"
    mov rcx, 0          ; declare the counter value 0
    mov rax, 0          ; declare the return value 0

loop:
    cmp rcx, rdx        ; compare counter value with the Third argument in memset (Size)
    je end              ; go to the end function if the previous condition is true

    mov al, byte [rsi + rcx] ; rsi is the (Source) pointer | set all character of rsi[rcx] in 'al' the 8 lower bit of rax
    mov byte [rdi + rcx], al ; rdi is the (Destination) pointer| set rdi[rcx] all character of 'al'

    inc rcx             ; increment rcx
    jmp loop            ; new turn in the loop

end:
    mov rax, rdi        ; return the value of pointer *rdi
    leave
    ret                 ; end