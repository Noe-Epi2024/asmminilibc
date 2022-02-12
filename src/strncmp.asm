BITS 64

section .text           ; directive starts the actual program code

global strncmp:          ; export symbol of strncmp function for usage in lib

strncmp:
    mov rcx, 0

loop:
    mov al, [rdi + rcx]  ; set character of string1 in 'al' the 8 lower bit of rax
    mov r8b, [rsi + rcx] ; set character of string2 in 'r8b' a 8 bit register

    cmp al, 0           ; compare if the end of string1 is reached
    je end              ; if the previous comparison is true to the value function

    cmp r8b, 0          ; compare if the end of string1 is reached
    je end              ; if the previous comparison is true to the value function

    cmp al, r8b         ; compare string1 == string2
    jne end             ; if the result of comparison is 0 go the value function and return the value 0

    inc rcx             ; increment the counter
    cmp rcx, rdx        ; compare counter with size_t arg3
    je end              ; if the result of the previous comparison is true go to the value function

    jmp loop            ; new turn in the loop

end:
    sub al, r8b         ; al -= r8b substract the value of string1 from string2
    movsx rax, al       ; put the 8 lower bit of rax into rax 16 bit
    ret                 ; return