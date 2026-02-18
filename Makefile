CROSS ?= x86_64-elf
CC := $(CROSS)-gcc

KERNEL_DIR ?= ../phobos-kernel/kernel
OUT_DIR ?= build
MTC ?= mtc

CFLAGS := -ffreestanding -mno-red-zone -fno-pic -mcmodel=large -I $(KERNEL_DIR)

LIB_OBJ := $(OUT_DIR)/bridge_lib.o
SHELL_OBJ := $(OUT_DIR)/bridge_shell.o

.PHONY: all mt clean

all: $(LIB_OBJ) $(SHELL_OBJ)

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)

$(LIB_OBJ): lib.c | $(OUT_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(SHELL_OBJ): shell.c | $(OUT_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

mt: $(LIB_OBJ)
	$(MTC) tokenizer.mtc --no-libc --obj $(LIB_OBJ) out

clean:
	rm -rf $(OUT_DIR) out
