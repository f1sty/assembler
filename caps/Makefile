.PHONY = clean

caps: caps.o
	ld -o $@ $<

caps.o: caps.asm
	nasm -f elf64 -g -F dwarf -l caps.lst $<

clean:
	rm caps{,.o,.lst}
