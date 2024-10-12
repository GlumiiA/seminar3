section .text

%include "lib.inc"

global _start

_start:
  mov  rdi, 0xAABBCCDDEEFF0000 
  call print_hex
  call exit
