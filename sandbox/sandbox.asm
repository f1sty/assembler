section .data
sum: dq 0
str1: db "testing out stosb", 10
str1_len equ $ - str1
str2: db ".................", 10

section .bss

section .text
global _start
_start:
  nop

  mov al, 0x23
  mov rdi, str2
  mov rcx, str1_len
  rep stosb

  mov rcx, 18
.loop:
  add qword [sum], 3
  loop .loop

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
