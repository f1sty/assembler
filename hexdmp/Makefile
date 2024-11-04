.PHONY = clean

hexdmp: hexdmp.o
	$(LD) $< -o $@

hexdmp.o: hexdmp.asm
	nasm -f elf64 -g -F dwarf -l hexdmp.lst $<

clean:
	rm hexdmp hexdmp.o hexdmp.lst
