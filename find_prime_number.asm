%include "lib/asm_io.inc"
segment .data
Message db "Find prime up to: ", 0

segment .bss
Limit resd 1 ;find primes up to this limit
Guess resd 1 ;the current guess for prime

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

        mov eax, Message
        call print_string
        call read_int
        mov [Limit], eax
        mov eax, 2
        call print_int
        call print_nl
        mov eax, 3
        call print_int
        call print_nl
        mov dword [Guess], 5 ; Guess = 5
while_limit: 
        mov eax, [Guess]
        cmp eax, [Limit]
        jnbe end_while_limit

        mov ebx, 3   
while_factor:
       mov eax, ebx
       mul eax
       jo end_while_factor

end_while_factor:
       je end_if
       mov eax, [Guess]
       call print_int
       call print_nl

end_if:
       add dword [Guess], 2 ; guess +=2
       jmp while_limit
   
end_while_limit:
       popa
       mov eax, 0
       leave
       ret  

















     








