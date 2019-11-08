# Common Assembler Commands

## Basics:

### Template Main programm:

```assembly
    .global _start
_start:

    @insert code

_exit:
    MOV R7,#1
    SWI 0
```


### Register working:

