.section .text
.global _start

_start:

    # base memory address (valid RAM)
    li a5, 0x80000000

    # value to store
    li a4, 5

    # STORE
    sw a4, 0(a5)

    # LOAD
    lw a6, 0(a5)

    # Atomic operations
    lr.w a7, (a5)
    sc.w a3, a4, (a5)

    amoswap.w a1, a4, (a5)
    amoadd.w  a2, a4, (a5)
    amoxor.w  a3, a4, (a5)
    amoand.w  a4, a4, (a5)
    amoor.w   a5, a4, (a5)
    amomin.w  a6, a4, (a5)
    amomax.w  a7, a4, (a5)
    amominu.w a1, a4, (a5)
    amomaxu.w a2, a4, (a5)

loop:
    j loop
.section .data
.align 4
data:
    .word 0
