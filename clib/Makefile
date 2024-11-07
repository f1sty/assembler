.PHONY = clean

clib: clib.o
	gcc -no-pie -o $@ $<

clib.o: clib.asm
	nasm -f elf64 -g -F dwarf $<

clean:
	rm clib{,.o}
