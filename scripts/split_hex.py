#!/usr/bin/env python3

import sys

input_hex = sys.argv[1]

b0 = open("../verification/program_B0.hex", "w")
b1 = open("../verification/program_B1.hex", "w")
b2 = open("../verification/program_B2.hex", "w")
b3 = open("../verification/program_B3.hex", "w")

with open(input_hex) as f:
    for line in f:
        inst = line.strip()

        if len(inst) != 8:
            continue

        b3.write(inst[0:2] + "\n")
        b2.write(inst[2:4] + "\n")
        b1.write(inst[4:6] + "\n")
        b0.write(inst[6:8] + "\n")

b0.close()
b1.close()
b2.close()
b3.close()

print("HEX successfully split into 4 banks")
