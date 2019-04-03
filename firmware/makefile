########################################
# RISCV Toolchain Path
########################################

RISCV = /home/sgeuser119/Desktop/Pitla_Raju/riscv64im

CC      = $(RISCV)/bin/riscv64-unknown-elf-gcc
OBJCOPY = $(RISCV)/bin/riscv64-unknown-elf-objcopy
OBJDUMP = $(RISCV)/bin/riscv64-unknown-elf-objdump
SPIKE   = $(RISCV)/bin/spike

########################################
# Directories
########################################

SRC_DIR = programs
INC_DIR = include
OUT     = out
VER     = ../verification
SCR     = ../scripts

########################################
# Sources
########################################

SRC = startup.S $(SRC_DIR)/atomic_all.c

TEST = atomic_only

########################################
# Compiler Flags
########################################

CFLAGS = -march=rv32ia \
         -mabi=ilp32 \
         -O2 \
         -nostdlib \
         -nostartfiles \
         -I$(INC_DIR)

########################################
# Default Target
########################################

all: $(OUT)/$(TEST).hex $(OUT)/$(TEST).objdump split rtl spike

########################################
# Build ELF
########################################

$(OUT)/$(TEST).elf: $(SRC) linker.ld
	mkdir -p $(OUT)
	$(CC) $(CFLAGS) -T linker.ld $(SRC) -o $@

########################################
# ELF ? BIN
########################################

$(OUT)/$(TEST).bin: $(OUT)/$(TEST).elf
	$(OBJCOPY) -O binary $< $@

########################################
# BIN ? HEX
########################################

$(OUT)/$(TEST).hex: $(OUT)/$(TEST).bin
	hexdump -v -e '1/4 "%08x\n"' $< > $@

########################################
# Generate Objdump
########################################

$(OUT)/$(TEST).objdump: $(OUT)/$(TEST).elf
	$(OBJDUMP) -d $< > $@

########################################
# Split HEX for RTL
########################################

split: $(OUT)/$(TEST).hex
	python ../scripts/split_hex.py $(OUT)/$(TEST).hex $(VER)

########################################
# Run RTL Simulation
########################################

rtl:
	cd $(VER) && irun -access +rwc -f compile.f | tee rtl.log

########################################
# Run Spike Simulation
########################################

spike:
	$(SPIKE) -l --isa=rv32ia $(OUT)/$(TEST).elf | tee spike_trace.log

########################################
# Clean
########################################

clean:
	rm -rf $(OUT)
	rm -f $(VER)/program_B*.hex
	rm -f $(VER)/rtl.log
	rm -f spike_trace.log
