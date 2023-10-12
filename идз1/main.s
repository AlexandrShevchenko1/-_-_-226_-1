.include "macros_main.s"
.global main

.data
.align 2
arr_A: .space 40
arr_B: .space 40 # len(arr_B) <= len(arr_A) always

prompt: .asciz "No remainder"
main:
.text
	li a1 1 # lower bound of arr
	li a2 10 # upper bound of arr
	jal get_N
	mv s0 a0 # N = a0 = s0
	
	
	la a1 arr_A # beginning of arr
	li a2 1 # counter
	jal fill_A
	
	
	jal get_X
	mv s1 a0 # X = a0 = s1
	
	
	la a1 arr_A # beginning of arr_A
	li a2 1 # counter
	la a3 arr_B # beginning of arr_B
	jal fill_B
	mv s2 a0 # number of elements in B = a0 = s2
	
		
	la a1 arr_B
 	print_arr(a1, s2)
	
	j finish_with_code_0
