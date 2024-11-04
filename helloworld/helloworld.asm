section .bss
section .data
  msg db "Hello from good old ThinkPad X220", 10
  len equ $ - msg

section .text
global _start
_start:
  mov rax, 0x1
  mov rdi, 1
  mov rsi, msg
  mov rdx, len
  syscall

  mov rax, 0x3c
  xor rdi, rdi
  syscall
