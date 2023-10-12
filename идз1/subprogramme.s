.include "macros_subprogramme.s"
.global get_N, finish_with_code_0, fill_A, get_X, fill_B

.text # functions
 
get_N: # func makes sure that N = 1...10 included bounds
	addi sp sp -12 # saving the parameters to the stack
	sw ra 8(sp) # for code scalability
	sw a1 4(sp) 
	sw a2 (sp)

	loop1:
		print_prompt("N = ")
		get_int # a0 = N
		blt a0 a1 loop1 
		bgt a0 a2 loop1
	
	lw ra 8(sp)
	addi sp sp 12 # free stack	
	ret	
	


fill_A:
	addi sp sp -12 
	sw ra 8(sp)
	sw a1 4(sp) 
	sw a2 (sp)

	addi sp sp -4 # allocate additional space for the local variable t0 on stack
	loop2:
		print_prompt("Number = ")
		get_int
		
		mv t0 a0
		sw t0 (sp) # store number on stack
		
		sw t0 (a1) # stores num to A
		addi a1 a1 4
		addi a2 a2 1
		ble a2 s0 loop2
	
	lw ra 12(sp)
	addi sp sp 16
	ret  



get_X:
	addi sp sp -4
	sw ra (sp)
	
	print_prompt("X = ")
	get_int
	
	lw ra (sp)
	addi sp sp 4
	ret
	
	
	
fill_B:
	addi sp sp -16 
	sw ra 12(sp)
	sw a1 8(sp) 
	sw a2 4(sp)
	sw a3 (sp)
	
	addi sp sp -8 # allocate additional space for the local variables t0, t1 on stack
	li t0 0 # t0 = len(B)
	sw t0 (sp)
	loop3:
			lw t1 (a1) # reading the value from arr_A
			sw t1 4(sp)
			remu t2 t1 s1 # we find the remainder of the division
			beqz t2 add_to_B # if remainder = 0 -> add_to_B
			j skip
		add_to_B:
			sw t1 (a3)
			addi a3 a3 4
			addi t0 t0 1
		skip:
			addi a1 a1 4
			addi a2 a2 1
			ble a2 s0 loop3 # check if there are any more elements in the array arr_A
	
	lw ra 20(sp)
	addi sp sp 24
	mv a0 t0
	ret

		

finish_with_code_0: # func terminates program
	li a7 10
	ecall
