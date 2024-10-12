section .data
codes:
    db      '0123456789ABCDEF'

section .text
global exit
global print_hex

exit:                        
    mov  rax, 60           
    xor  rdi, rdi        
    syscall                  

print_hex:
    mov     rdx, 1          
    mov     rcx, 64         ; Количество бит (8 байт * 8 бит)
.loop:
    push    rax             
    sub     rcx, 4          ; Переходим к следующему 4-битному блоку
    sar     rdi, cl         ; Сдвигаем число
    and     rdi, 0xf        
    lea     rsi, [codes + rdi] ; Находим символ в таблице

    mov     rax, 1          
    mov     rdi, 1          

    push    rcx             
    syscall                 
    pop     rcx             

    pop     rax             
    test    rcx, rcx       ; Проверяем, закончили ли мы
    jnz     .loop           ; Повторяем цикл, если не закончили

    ret    
