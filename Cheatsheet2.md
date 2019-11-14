# Common Assembler Commands

## Basics:

### Template Main programm:

Note: for 'gcc' Compiling "main" is the starting point and required.

Note: for 'as' Compiling "_start" is the starting point, it's otpional but convention and needed if you declare a subfunction at the beginning of the file.
```assembly
    .global _start
_start: B main

    .global main
main:

    @insert code

_exit:
    MOV R7,#1
    SWI 0
```

### Template Function:

```assembly
    .global _func
_func:
    push {LR}

    @insert code

_retrun:
    pop {PC}
```



### Register working:


Registers:

|  a  |  b  |  c  |  d  |  e  |  f  |
| --- | --- | --- | --- | --- | --- |
| R0  | R1  | R2  |  R3 | R4  | R5  |
| R6  | R7  | R8  |  R9 | R10 | R11 |
| R12 | R13 | R15 |  PC | LR  | --- |

Note: SP(Stackpointer) special Register, saves the current Adresse of the Stack. 4 possible kinds of stackpointer working. 
* Full Ascending (FA)
    - stackpointer points to a written address and rises.
* Empty Ascending (EA)
    - stackpointer points to a empty address and rises.
* Empty Descending (ED)
    - stackpointer points to a written address and sinks.
* Full Descending (FD, Default)
    - stackpointer points to a empty address and sinks.

```assembly
    MOV R0, R1
    MOV R0, #255     @can only assign 8 bits = 255

    LDR R0, =1000    @greater numbers as 255 assign via LDR
```

### Mathematic working:

Addition:
```assembly
/*  Result   1.Number
        \    |     _ 2.Number
         |   |    |    */
    ADD R0, #20, #10    @ Result: 30
    ADD R0, R0, R1
```

Subtraction:
```assembly
/*  Result   Minuend
        \    |     _ Subtrahend
         |   |    |    */
    SUB R0, #20, #10    @ Result: 10
    SUB R0, R0, R1

    @ Works with branches, like BGE,...
    @ the result is the input for the comparison
    @ For more Informations look in Branch section
    SUBS R0, R0, R1
```


### Branch jumps:

```assembly


```


### Compiling:
Two Options for compiling, via 'as'(Assembler Compiler) or 'gcc'(c++ Compiler)

Note: Assembler Compiler files needs to be Linked for an executable, gcc does this automatically
```shell
    Compiling with options for debugging (Optional)
    |  Name of the output file, convention: .o
    |  |               Input file/files, each additional argument
    |  |               |
as -g -o compilation.o sourcecode.s sourcecode2.s
ld    -o executable   compilation.o

gcc -g –o executable sourcecode.s sourcecode2.s
```

### Data and lib-calls
