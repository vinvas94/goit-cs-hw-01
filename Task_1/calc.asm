org 0x100                ; Indicate that this is a .COM program

section .data
    a db 5               ; Define a = 5
    b db 3               ; Define b = 3
    c db 2               ; Define c = 2
    resultMsg db 'Result: $' ; Define string for result message

section .text
_start:
    mov al, [b]          ; Load b into AL
    sub al, [c]          ; Subtract c from AL
    add al, [a]          ; Add a to AL

    ; Convert result to ASCII (for single-digit numbers)
    add al, 30h          ; Convert number to ASCII character

    ; Print result message
    mov ah, 09h          ; DOS function to print string
    lea dx, resultMsg    ; Load address of resultMsg into DX
    int 21h              ; Call DOS interrupt

    ; Print result
    mov dl, al           ; Load result into DL for output
    mov ah, 02h          ; DOS function to print character
    int 21h              ; Call DOS interrupt

    ; Exit program
    mov ax, 4c00h        ; DOS function to exit program
    int 21h              ; Call DOS interrupt