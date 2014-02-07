%include "lib/asm_io.inc"
segment .data
prompt1 db "Ingrese un numero", 0
prompt2 db "Ingrese otro numero", 0
outmsg1 db "Usted ha ingresado", 0
outmsg2 db " y ", 0
outmsg3 db ", la suma de ellos es: ", 0 

segment .bss
input1 resd 1
input2 resd 1

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

	mov eax, prompt1		;imprime el prompt
	call print_string

	mov ebx, input1			;almacena la direccion de input1 en ebx
	mov ecx, ret1			;almacena la direccion de retorno en ecx
	jmp short get_int		;lee un entero
ret1:
	mov eax, prompt2		;imprime el prompt
	call print_string

	mov ebx, input2
	mov ecx, $ + 7			;ecx = esta direccion + 7
	jmp short get_int

	mov eax, [input1]
	add eax, [input2]
	mov ebx, eax

	mov eax, outmsg1
	call print_string
	mov eax, [input1]
	call print_int
	mov eax, outmsg2
	call print_string
	mov eax, [input2]
	call print_int
	mov eax, outmsg3
	call print_string
	mov eax, ebx
	call print_int
	call print_nl


        popa
        mov eax, 0 	;retornar a C
        leave
        ret  


;--------------------------------------------
;subprograma get_int
;--------------------------------------------
;parametros
;  ebx - direccion de la palabra doble que almacena el entero
;  ecx - direccion de la instruccion a donde retornar
;Notes:
; el valor de eax se destruye
get_int:
	call read_int
	mov [ebx], eax 			;almacena la entrada en memoria
	jmp ecx				;salta al llamador

