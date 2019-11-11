# Assembler Cheatsheet
## Basic

### Commands

```Assembly
    MOV R0, R1
    MOV R0, #1

    @Number greater than 255
    LDR R0,=1000    
``` 







### Compiling
```shell
as -g -o compilation.o sourcecode.s

ld    -o executable   compilation.o

gcc -g –o executable sourcecode.s
```