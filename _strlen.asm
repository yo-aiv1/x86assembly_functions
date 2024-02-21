; -----------------------------------------------------------------------------
; Function:   _strlen
; Purpose:    Determines the length of a C-style NUL-terminated string.
; 
; Inputs:     Pointer to the null-terminated string in RCX.
; Outputs:    Length of the string stored in RAX.
; -----------------------------------------------------------------------------


section .text
	global      _strlen         ; entry point

_strlen:
	push        rbx             ; push rbx to the stack (callee-saved register)
	xor         rax, rax        ; xor rax to set it to 0.
	call        start           ; call the start which is a loop
	pop			rbx				; pop rbx from the stack
	ret							; return from _strlen, the returned value will be stored in rax

start:
	cmp         byte [rcx], 0   ; Compare the byte at the memory location pointed by rax with 0 (null terminator)
	je			stop			; if the byte at rcx equal 0 which means it is the end of the string jump to stop
								; if it is not equal it will carry on with the following instructions
	inc			rcx				; increase rcx to move to the next byte
	inc         rax				; increase our counter by 1
	call		start			; call start to do the same


stop:
	ret							; return to _strlen