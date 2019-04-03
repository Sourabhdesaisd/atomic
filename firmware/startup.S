.section .text
.global _start

_start:

    # set stack pointer
    li sp, 0x80004000

    # jump to main test
    call main

loop:
    j loop
