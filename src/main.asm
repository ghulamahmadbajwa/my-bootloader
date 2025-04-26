; Bootloader to print "Hello, World!" using BIOS
BITS 16
ORG 0x7C00

start:
    ; Set up segment registers
    mov ax, 0          ; Segment 0
    mov ds, ax         ; Data segment
    mov es, ax         ; Extra segment
    mov ss, ax         ; Stack segment
    mov sp, 0x7C00     ; Stack pointer at start of program

    ; Call print function
    mov si, hello_string
    call print_string

    ; Halt
    hlt
halt_loop:
    jmp halt_loop

; Print function: prints null-terminated string at DS:SI
print_string:
    push ax            ; Save registers
    push si
.loop:
    lodsb              ; Load byte from DS:SI into AL, increment SI
    or al, al          ; Check if null
    jz .done           ; If null, exit
    mov ah, 0x0E       ; BIOS teletype function
    mov bh, 0          ; Page number (text mode)
    int 0x10           ; BIOS video interrupt
    jmp .loop          ; Next character
.done:
    pop si             ; Restore registers
    pop ax
    ret

; Data
hello_string:
    db 'Hello, World!', 0x0D, 0x0A, 0  ; String with CR, LF, null terminator

; Pad to 510 bytes and add BIOS signature
times 510-($-$$) db 0
dw 0xAA55
