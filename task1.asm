section .text
global _start

%macro pushn 1
    %rep %0
        push %1
        %rotate 1
    %endrep
%endmacro

%macro popn 1
    %rep %0
        pop %1
        %rotate 1
    %endrep
%endmacro
section .text
global _start

_start:
    pushn rax, rbx ;  сохранить регистры rax и rbx на стек
    mov rax, 10
    mov rbx, 20
    popn rax, rbx ; Восстанавливаем ebx и eax из стека

    xor rbx, rbx    ; статус: 0
    mov rax, 60        ; системный вызов для выхода
    xor rdi, rdi       ; код возврата 0
    syscall
