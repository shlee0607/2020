AS = arm-linux-gnueabi-as
AS_FLAGS = -g
LD = arm-linux-gnueabi-gcc
LD_FLAGS = 
EMU = qemu-arm-static
EMU_FLAGS = -L /usr/arm-linux-gnueabi
GDB_PORT = 1234

PROGRAM = mac-p5

all: $(PROGRAM).out

%.o: %.s
	$(AS)  $(AS_FLAGS)     $< -o $@

%.out: %.o
	$(LD)  $(LD_FLAGS)     $< -o $@

run:
	$(EMU) $(EMU_FLAGS)    $(PROGRAM).out

run_s:
	$(EMU) -g $(GDB_PORT) $(EMU_FLAGS)    $(PROGRAM).out

run_c:
	gdbgui --gdb gdb-multiarch            $(PROGRAM).out

clean:
	rm -rf *.o *.out
