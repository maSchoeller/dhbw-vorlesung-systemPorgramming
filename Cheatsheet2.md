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
    push {SP}

    @insert code

_retrun:
    pop {PC}
```



### Register working:

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
as -g -o compilation.o sourcecode.s
ld    -o executable   compilation.o

gcc -g –o executable sourcecode.s
```