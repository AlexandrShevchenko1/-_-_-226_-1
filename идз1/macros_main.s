.macro print_arr (%ptr, %arr_size)	# arr printer, %ptr - points to the first element
.data
	message: .asciz "\nElement of B:\n"
	new_line: .asciz "\n"
.text
	la a0 message
	li a7 4
	ecall
	li t0 1
	loop4:
		lw a0 (%ptr)
		li a7 1
		ecall
		la a0 new_line
		li a7 4
		ecall
		addi %ptr %ptr 4
		addi t0 t0 1
		ble t0 %arr_size loop4
.end_macro


.macro set_N (%num)
.text
	li s0 %num
.end_macro


.macro set_X (%num)
.text
	li s1 %num
.end_macro


.macro fill_arr_compile_time (%pos, %num, %arr) # put num(number) into arr(array) on pos(position)
.text
		li t4 %num
		sw t4 %pos(%arr)	
.end_macro


.macro compare (%B_result, %B_expected, %B_size) # tells whether two arrs are equal
.data
	test_success: .asciz "Success\n"
	test_fail: .asciz "Fail\n"
.text
	beqz s3 check # check the base case when there were no elements in A
	j loop
	check:
		beqz s2 success
		j fail
	
	loop:
		lw t1 (%B_result)
		lw t2 (%B_expected)
		bne t1 t2 fail # compare by element
		addi %B_result %B_result 4
		addi %B_expected %B_expected 4
		addi %B_size %B_size -1
		beqz %B_size success # if there are no more elements left in the Â, func print success
		j loop
	fail:
		la a0, test_fail
		li a7, 4
		ecall
		j exit
	success:
		la a0, test_success
		li a7, 4
		ecall
	exit:
.end_macro
		
