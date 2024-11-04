section .bss
  chr resb 1
section .data

section .text
global _start
_start:
  xor rax, rax
  xor rdi, rdi
  mov rsi, chr
  mov rdx, 0x1
  syscall

  test rax, rax
  jz .finish
  cmp byte [rsi], 0x61 ; 'a'
  jl .print
  cmp byte [rsi], 0x7a ; 'z'
  jg .print
  sub byte [rsi], 0x20 ; capitalize
  .print:
  mov rax, 0x1
  mov rdi, 0x1
  syscall
  jmp _start
  
  .finish:
  mov rax, 0x3c   ; exit syscall
  xor rdi, rdi    ; exit code = 0
  syscall
