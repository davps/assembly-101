%include "lib/asm_io.inc"
segment .data
msgI1 db "I1: ", 0
msgI2 db "I2: ", 0
msgOut1 db "valor ingresado I1 = ", 0
msgOut2 db "valor ingresado I2 = ", 0
msgresult1 db "el resultado de la operacion (I1 AND I2) es: ", 0 

segment .bss
i1 resd 1
i2 resd 1

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

	;
	;ingreso del 1er valor
	;
	mov eax, msgI1
	call print_string

	mov eax, i1
	call read_int
	mov [i1], eax

	;
	;ingreso del 2do valor
	;
	mov eax, msgI2
	call print_string

	mov eax, i2
	call read_int
	mov [i2], eax

	;
	;imprimir 1er valor ingresado
	;

	mov eax, msgOut1
	call print_string
	mov eax, [i1]
	call print_int
	call print_nl

	;
	;imprimir 2do valor ingresado
	;
	mov eax, msgOut2
	call print_string
	mov eax, [i2]
	call print_int
	call print_nl

	;
	;aplicar la operacion AND al 1er y 2do valor ingresado
	;
	mov ebx, [i1]
	and ebx, [i2]

	;
	;imprimir los resultados
	;
	mov eax, msgresult1
	call print_string
	mov eax, ebx
	call print_int
	call print_nl
	

        popa
        mov eax, 0 	;retornar a C
        leave
        ret  

