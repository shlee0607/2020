GCC = arm-linux-gnueabi-gcc
GCC_FLAGS = -g -march=armv7
AS = arm-linux-gnueabi-as
AS_FLAGS = 
LD = arm-linux-gnueabi-gcc
LD_FLAGS = 
EMU = qemu-arm-static
EMU_FLAGS = -L /usr/arm-linux-gnueabi
GDB_PORT = 1234

all: alu.out

#alu.s: alu.c
#	$(GCC) $(GCC_FLAGS) -S $< -o $@

alu.o: alu.s
	$(AS)  $(AS_FLAGS)     $< -o $@

alu.out: alu.o
	$(LD)  $(LD_FLAGS)     $< -o $@

run:
	$(EMU) $(EMU_FLAGS)    alu.out

run_s:
	$(EMU) -g $(GDB_PORT) $(EMU_FLAGS)    alu.out &

run_c:
	gdbgui --gdb gdb-multiarch            alu.out

clean:
	rm -rf *.o *.out
