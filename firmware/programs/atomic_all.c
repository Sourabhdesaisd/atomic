#include <stdint.h>

int main()
{
    volatile uint32_t mem = 5;
    uint32_t val = 3;
    uint32_t out;

    asm volatile(

        /* LR.W */
        "lr.w %[o], (%[m])\n"

        /* SC.W */
        "sc.w %[o], %[v], (%[m])\n"

        /* AMOSWAP */
        "amoswap.w %[o], %[v], (%[m])\n"

        /* AMOADD */
        "amoadd.w %[o], %[v], (%[m])\n"

        /* AMOXOR */
        "amoxor.w %[o], %[v], (%[m])\n"

        /* AMOAND */
        "amoand.w %[o], %[v], (%[m])\n"

        /* AMOOR */
        "amoor.w %[o], %[v], (%[m])\n"

        /* AMOMIN */
        "amomin.w %[o], %[v], (%[m])\n"

        /* AMOMAX */
        "amomax.w %[o], %[v], (%[m])\n"

        /* AMOMINU */
        "amominu.w %[o], %[v], (%[m])\n"

        /* AMOMAXU */
        "amomaxu.w %[o], %[v], (%[m])\n"

        : [o] "=r" (out)
        : [m] "r" (&mem), [v] "r" (val)
        : "memory"
    );

    while(1);

    return 0;
}
