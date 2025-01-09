ORG 0
BITS 16
_start:
    jmp short start
    nop
times 33 db 0

start:
    jmp 0x7c0:start2
start2:
    cli ; disable interrupts
    mov ax,0x7c0
    mov ds,ax
    mov es,ax
    mov ax,0x00
    mov ss,ax
    mov sp,0x7c00
    sti ; enable interrupts
    mov si,message
    call print_main
    jmp $
print_main:
    mov bx,0
.m_loop:
    lodsb
    cmp al,0
    je .done
    call print_char
    jmp .m_loop
.done:
    ret
print_char:
    mov ah,0eh
    int 10h
    ret
message: db 'Hello World', 0
times 510-($- $$) db 0
dw 0xAA55
