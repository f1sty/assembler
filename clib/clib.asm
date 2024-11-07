section .data
msg: db "Hi, I'm linked with libc!", 0

section .bss

section .text
extern puts
global main
main:
  push rbp
  mov rbp, rsp

  mov rdi, msg
  call puts

  xor rax, rax

  pop rbp
  ret
