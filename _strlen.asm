; -----------------------------------------------------------------------------
; Function:   _strlen
; Purpose:    Determines the length of a C-style NUL-terminated string.
;
; Prototype: size_t _strlen(const char *str);
; 
; Inputs:
;   RCX - Pointer to the null-terminated string.
;
; Outputs:
;   RAX - Length of the string.
; -----------------------------------------------------------------------------


section .text
	global _strlen      ; Entry point

_strlen:
    push    rbx         ; Push RBX to the stack (callee-saved register)
    xor     rax, rax    ; Clear RAX (set it to 0)
    call    start       ; Call the start label to begin the loop
    pop     rbx         ; Restore the original value of RBX
    ret                 ; Return from _strlen, the length is stored in RAX

start:
    cmp     byte [rcx], 0   ; Compare the byte at the memory location pointed by RCX with 0 (null terminator)
    je      stop            ; If the byte at RCX is equal to 0, jump to the stop label (end of string)
                            ; If not, continue with the following instructions
    inc     rcx             ; Move to the next byte
    inc     rax             ; Increment the counter (string length)
    call    start           ; Recursive call to continue processing the string
                            ; This is a tail-recursive approach
stop:
    ret                     ; Return to _strlen
