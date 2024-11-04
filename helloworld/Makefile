.PHONY = clean

helloworld: helloworld.o
	ld -o $@ $<

helloworld.o: helloworld.asm
	nasm -f elf64 -g -F dwarf -l helloworld.lst $<

clean:
	rm helloworld{,.o,.lst}
