assembly-101
============


### How to compile under linux:

nasm -f elf first_program.asm

gcc -o first_program first_program.o lib/driver.c lib/asm_io.o

### How to run under linux:


./first_program


### All in one command example 

This example works for `find_prime_number.asm`:

```
F="find_prime_number"; clear; nasm -f elf "$F".asm; gcc -o $F "$F".o lib/driver.c lib/asm_io.o; ./$F
```
