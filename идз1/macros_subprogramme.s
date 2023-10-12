.macro print_prompt (%prompt)	# generic prompt printer
.data
	prompt: .asciz %prompt
.text
	la a0, prompt
	li a7, 4
	ecall
.end_macro


.macro get_int
.text
	li a7 5
	ecall
.end_macro


.macro print_int (%x)
.text
	mv a0 %x
	li a7 1
	ecall
.end_macro