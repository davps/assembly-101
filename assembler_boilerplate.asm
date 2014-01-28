%include "lib/asm_io.inc"
segment .data
;
; los datos indicados
; Ejemplo: 
; Message db "Ingrese un numero: ", 0
;

segment .bss
;
; los datos no iniciados se incluyen aqui
; Ejemplo:
; Input resd 1
;

segment .text
        global asm_main
asm_main:
        enter 0,0 ;setup routine
        pusha

;
; Aqui va el codigo del programa
;

        popa
        mov eax, 0 	;retornar a C
        leave
        ret  

