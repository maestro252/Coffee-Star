EXECUTABLE=calendar # nombre del ejecutable a generar

## CONFIG:
NASM=nasm 	# por defecto en /usr/bin/nasm
LD=ld		# por defecto en /usr/bin/ld
FORMAT=elf  # formato de ensamblado; vea: `$nasm -hf`
ARCH=x86_64 # arquitectura de ensamblado
EMULATOR=elf_i386 # emulador de linkeado

## ARGS:
LD_ARGS=-m $(EMULATOR) -o $(EXECUTABLE) -A $(ARCH)
NASM_ARGS=-f $(FORMAT)

all: assembly #copy

assembly: calendar.o
	$(LD) $(LD_ARGS) calendar.o
	@echo "DONE"
	@echo "Para ejecutar: ./$(EXECUTABLE)"

calendar.o: calendar.asm
	$(NASM) $(NASM_ARGS) calendar.asm

	@echo "DONE"

clean:
	rm -f *o
	rm -f $(EXECUTABLE)
	@echo "DONE"
