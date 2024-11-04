section .data
section .bss

section .text
global _start
_start:
  nop
  mov rax, 250
  blsr rbx, rax
  blsr rax, rbx
  blsr rbx, rax
  blsr rax, rbx
  mov rbx, 12
  bsf rax, rbx
  mov rbx, "ABCD"
  bswap rbx
  nop
