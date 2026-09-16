ARCH    = riscv64-unknown-elf
CC      = $(ARCH)-gcc
FLAGS   = -nostartfiles -g
LD      = $(ARCH)-ld
OBJCOPY = $(ARCH)-objcopy


all: clean trap.img

trap.img: trap.elf
	$(OBJCOPY) trap.elf -I binary trap.img

trap.elf: trap.o link.ld Makefile
	$(LD) -T link.ld --no-warn-rwx-segments -o trap.elf trap.o

trap.o: trap.s
	$(CC) $(FLAGS) -c $< -o $@

clean:
	rm -f *.o trap.elf trap.img

run: trap.img
	qemu-system-riscv64 -M virt -bios none -serial stdio -display none -kernel trap.img
debug: trap.img
	qemu-system-riscv64 -M virt -bios none -serial stdio -display none -kernel trap.img -gdb tcp::<YOUR PORT NUMBER> -S & riscv64-unknown-elf-gdb trap.elf -tui


