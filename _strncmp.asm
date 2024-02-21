; -----------------------------------------------------------------------------
; Function:   _strncmp
; Purpose:    Compare 2 strings, return 0 if both are the same, and 1 if not
;
; Prototype:  int _strncmp(const char *str1, const char *str2, size_t size);
;
; Inputs:     
;   RCX - Pointer to the first null-terminated string
;   RDX - Pointer to the second null-terminated string
;   R8  - Number of characters to compare
;
; Outputs:    
;   RAX - Result (0 if equal, 1 if not equal)
; -----------------------------------------------------------------------------


section .text
    global _strncmp     ; Entry point

_strncmp:
    push    rbx         ; Preserve RBX (callee-saved register)
    call    start       ; Call the start label to begin the loop
    pop     rbx         ; Restore the original value of RBX
    ret                 ; Return from _strncmp

start:
    dec     r8               ; Decrement count
    js      equal            ; If count < 0, strings are equal
    mov     al, byte [rcx]   ; Move a byte from str1 to AL register
    cmp     al, byte [rdx]   ; Compare byte from str1 with byte from str2
    jne     notequal         ; If not equal, strings are different, jump to notequal label
    cmp     al, 0            ; Check if end of str1
    je      equal            ; If yes, strings are equal, jump to equal
                             ; Otherwise, continue comparing
    inc     rcx              ; Move to next byte in str1
    inc     rdx              ; Move to next byte in str2
    jmp     start            ; Recursive call to continue processing the strings

equal:
    xor     rax, rax         ; Set result to 0 (strings are equal)
    ret                      ; Return to entry point

notequal:
    mov     rax, 1           ; Set result to 1 (strings are not equal)
    ret                      ; Return to entry point
