%include "lib/asm_io.inc"
segment .data

MessageA db "Valor entero A (vleft): ", 0
MessageB db "Valor entero B (vright): ", 0
result_equal db "Los numeros son iguales", 0
result_not_equal db "Los numeros no son iguales", 0

segment .bss
vleft resd 1
vright resd 2

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

	;
	;input first value (left)
	;
        mov eax, MessageA
        call print_string
	call read_int
	mov ebx, eax		;useful just for debugging purposes
	mov [vleft], eax

	;
	;input second value (right)
	;
	mov eax, MessageB
	call print_string
	call read_int
	mov [vright], eax

	;
	; compare input values
	;
	mov eax, [vleft]
	mov ebx, [vright]
	cmp eax, ebx

	;
	; go to if_equals if vleft = vright 
	;
	je if_equals

	;
	; go to if_not_equals if vleft != vright 
	;
	jne if_not_equals

if_not_equals:
	mov eax, result_not_equal
	call print_string
	call print_nl
	jmp end_condition

if_equals:
    	mov eax, result_equal
	call print_string
	call print_nl

end_condition:
    	dump_regs 1

        popa
        mov eax, 0 	;retornar a C
        leave
        ret  

