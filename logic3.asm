%include "lib/asm_io.inc"

;
;       I1
;-------/-------|
;		|	
;		|
;		|	    I3
;		|-----------/------------>> S1
;		|
;		|
;       I2	|
;-------/-------|
;
;
; S1 = ( I1 OR I2 ) AND I3 
;
;


segment .data
msgI1 db "I1 (open:1, closed:0) = ", 0
msgI2 db "I2 (open:1, closed:0) = ", 0
msgI3 db "I3 (open:1, closed:0) = ", 0
msgOut1 db "valor ingresado I1 = ", 0
msgOut2 db "valor ingresado I2 = ", 0
msgOut3 db "valor ingresado I3 = ", 0
msgresult1 db "el resultado S1 de la operacion ((I1 OR I2) AND I3) es: ", 0 

segment .bss
i1 resd 1
i2 resd 1
i3 resd 1
aux1 resd 1
aux2 resd 1

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
	;ingreso del 3er valor
	;
	mov eax, msgI3
	call print_string
	
	mov eax, i3
	call read_int
	mov [i3], eax

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
	;imprimir 3er valor ingresado
	;
	mov eax, msgOut3
	call print_string
	mov eax, [i3]
	call print_int
	call print_nl	

	;
	;aplicar la operacion I1 OR I2
	;
	mov ecx, [i1]
	or ecx, [i2]

	;
	;aplicar la operacion (...) AND I3
	;
	mov edx, [i3]
	and edx, ecx

	;
	;imprimir los resultados
	;
	mov eax, msgresult1
	call print_string
	mov eax, edx
	call print_int
	call print_nl
	

        popa
        mov eax, 0 	;retornar a C
        leave
        ret  

