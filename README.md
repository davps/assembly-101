assembly-101
============


How to compile under linux:
==========================
nasm -f elf first_program.asm
gcc -o first_program first_program.o lib/driver.c lib/asm_io.o

