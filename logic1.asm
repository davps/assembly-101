%include "lib/asm_io.inc"

;
;
;
; Program logic1.asm
; Enter an integer number and negate it
;
;
;


segment .data
;
msg1 db "Enter Input: ", 0
msg2 db "The negated value of Input is: ", 0
;

segment .bss
;
input resd 1
aux resd 1
;

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

	mov eax, msg1
	call print_string
	
	call read_int
	mov [input], eax

	not eax

	


        popa
        mov eax, 0 	;retornar a C
        leave
        ret  

