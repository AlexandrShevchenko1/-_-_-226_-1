.include "macros_main.s"
#.global main

.data
	.align 2
	A: .space 40
	B_expected: .space 40
	B_result: .space 40
#main:
.text
	# Test 1
	set_N(3) # s0 = len(A)
	set_X(13) # s1 = X
	
	la a1 A
	la a4 B_expected
	li s3 1 # s3 = len(B_expected)
	
	fill_arr_compile_time(0, 1, a1) # filling A
	fill_arr_compile_time(4, 13, a1)
	fill_arr_compile_time(8, 4, a1)
	
	fill_arr_compile_time(0, 13, a4) # filling B_expected
	
	li a2 1 # counter
	la a3 B_result
	jal fill_B
	mv s2 a0 # number of elements in B
	
	la a3 B_result
	compare (a3, a4, s3)
	
	
	
	# Test 2
	set_N(2) # s0 = len(A)
	set_X(3) # s1 = X
	
	la a1 A
	la a4 B_expected
	li s3 0 # s3 = len(B_expected)
	
	fill_arr_compile_time(0, 4, a1) # filling A
	fill_arr_compile_time(4, 2, a1)
	
	# skip filling B_expected because len(B_expected) = 0
	
	li a2 1 # counter
	la a3 B_result
	jal fill_B
	mv s2 a0 # number of elements in B
	
	la a3 B_result
	compare (a3, a4, s2)
	
	
	
	# Test 3
	set_N(4) # s0 = len(A)
	set_X(2) # s1 = X
	
	la a1 A
	la a4 B_expected
	li s3 2 # s3 = len(B_expected)
	
	fill_arr_compile_time(0, 6, a1) # filling A
	fill_arr_compile_time(4, 7, a1)
	fill_arr_compile_time(8, 9, a1)
	fill_arr_compile_time(12, 18, a1)
	
	fill_arr_compile_time(0, 6, a4) # filling B_expected
	fill_arr_compile_time(4, 18, a4)
	
	li a2 1 # counter
	la a3 B_result
	jal fill_B
	mv s2 a0 # number of elements in B
	
	la a3 B_result
	compare (a3, a4, s3)
	
	j finish_with_code_0