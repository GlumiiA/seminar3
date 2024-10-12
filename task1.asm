%macro pushn 1
    mov ax, 0 ; Используем ax в качестве временного регистра
    %rep %1
        pusha ; Сохраняем все регистры общего назначения
    %endrep
%endmacro

%macro popn 1
    %rep %1
        popa ; Восстанавливаем все регистры общего назначения
    %endrep
%endmacro
section .text
global _start

_start:
    pushn eax, ebx ; Сохраняем eax и ebx в стек
    mov eax, 10
    mov ebx, 20
    popn ebx, eax ; Восстанавливаем ebx и eax из стека

    mov eax, 1      ; syscall: exit
    xor ebx, ebx    ; статус: 0
    int 0x80
