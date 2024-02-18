section .text
	global      _strlen         ; entry point

_strlen:
	push        rbx             ; push rbx to the stack (callee-saved register)
	mov         rax, rcx        ; move the value of the first argument (pointer to the string) to rax register
	call        start           ; call the start
	pop         rbx             ; pop rbx from the stack
	ret                         ; return from the _strlen function

start:
	cmp         byte [rax], 0   ; Compare the byte at the memory location pointed by rax with 0 (null terminator)
                                ; if the byte is 0, it indicates the end of the string
	jz          stop            ; jump to the stop label if the byte is 0
	inc         rax             ; increment the value of rax (pointer to the string) to move to the next byte
	jmp         start           ; if the byte is not 0 jump back to the start label to continue searching for the null terminator

stop:
	sub         rax, rcx        ; subtract rcx (original pointer to start of string) from rax (current pointer to end of string) to calculate string length
	ret                         ; return from the stop function
