BITS 64

section .text         ; directive starts the actual program code

global strlen:        ; export symbol of strlen function for usage in lib
	
strlen:
    push rbp          ; initialisation of the stack with the "register base pointer"
    mov rbp, rsp      ; initialisation "register stack pointer"
    mov rbx, 0        ; declare a counter in the stack with the value 0 "register b extended"

loop:
    cmp byte [rdi], 0 ; compare if the character in string: rdi == '\0'
    je end            ; go to the end if the previous comparison is true

	inc rbx           ; increment the counter for return the len of the string
    inc rdi           ; increment rdi to go to the next character in the string

    jmp loop          ; new turn in the loop

end:
    mov rax, rbx      ; return the value of counter rcx
    leave             ; quit properly the stack
    ret               ; return