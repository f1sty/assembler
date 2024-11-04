%define buffer_size 1024

section .bss
buffer: resb buffer_size

section .data
digits: db "0123456789ABCDEF"
fmt: db "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00", 10
fmt_len equ $ - fmt

section .text
global _start
_start:
  xor rax, rax               ; read(stdin, buffer, buffer_size) syscall
  xor rdi, rdi
  mov rsi, buffer
  mov rdx, buffer_size
  syscall

  test rax, rax              ; if return 0 - EOF reached
  jz .finish

  xor rcx, rcx               ; rcx - index inside fmt string
  mov r8, rax                ; r8 - actual buffer length
  xor r9, r9                 ; r9 - index inside buffer
.loop:
  mov al, byte [buffer+r9]
  mov rbx, rax
  and rax, 0x0f              ; mask out high nybble
  shr rbx, 0x04              ; cut out low nybble
  mov dh, byte [digits+rbx]  ; use nibbles in hex digits array as index
  mov dl, byte [digits+rax]
  mov byte [fmt+rcx], dh     ; put corresponding digits into final string
  mov byte [fmt+rcx+1], dl
  add rcx, 0x03              ; move format index by 3 ("00 >0")
  inc r9                     ; increase buffer position
  cmp r9, r8
  je .print_fmt
  cmp rcx, fmt_len
  jl .loop

.print_fmt:
  mov rax, 0x01             ; write(stdout, fmt, rcx) syscall
  mov rdi, 0x01
  mov rsi, fmt
  mov rdx, rcx
  syscall
  
  cmp r9, r8
  jz _start
  xor rcx, rcx
  jmp .loop

.finish:
  mov rax, 0x3c              ; exit(0) syscall
  xor rdi, rdi
  syscall
