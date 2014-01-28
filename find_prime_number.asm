%include "lib/asm_io.inc"
segment .data
Message db "Hallar los numeros primos hasta: ", 0
while_limit_str db "enter while_limit", 0
while_factor_str db "enter while_factor", 0

segment .bss
Limit resd 1 ;hallar los numeros primos hasta este limite
Guess resd 1 ;la conjetura actual para el primo


segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

        mov eax, Message
        call print_string
        call read_int 				; scanf("%u", & limit);
        mov [Limit], eax

						; printf("2\n");
        mov eax, 2
        call print_int
        call print_nl

						; printf("3\n");
        mov eax, 3
        call print_int
        call print_nl

        mov dword [Guess], 5 			; Guess = 5

	;dump_regs 1

while_limit: 
						;debugging the esta entrando al condicional del bucle
	mov ecx, eax
	mov eax, while_limit_str
	call print_string
	call print_nl
	mov eax, ecx
	;mov edx, [Guess]

						;if(Guess == limit)
        mov eax, [Guess]
        cmp eax, [Limit]
	dump_regs 1				;debugging registers
        jnbe end_while_limit

        mov ebx, 3   
while_factor:
	mov ecx, eax
	mov eax, while_factor_str
	call print_string
	call print_nl
	mov eax, ecx

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

















     








