.PHONY = clean

sandbox: sandbox.o
	$(LD) $< -o $@

sandbox.o: sandbox.asm
	nasm -f elf64 -g -F dwarf -l sandbox.lst $<

clean:
	rm sandbox sandbox.o sandbox.lst
