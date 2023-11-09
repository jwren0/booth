.code16gcc
.globl _start

_start:
    cli

    lea msg, %si
    call writeln

    jmp .

writeln:
    mov $0x0e, %ah

writeln.loop:
    lodsb
    or %al, %al
    jz writeln.end
    int $0x10
    jmp writeln.loop

writeln.end:
    ret

msg: .ascii "Hello, world!\r\n\0"
