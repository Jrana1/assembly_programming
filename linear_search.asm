		.data
		     array: .byte 4,2,1,9,3,5,7
		     size:  .byte 7
		     msg1:  .asciiz "Enter a key to search>"
		     msg2:  .asciiz  "The key "
		     msg3:  .asciiz  " located at index "
		     msg4:  .asciiz "Key not found"
		     
		.text
	main:
	        la $a0,msg1
		jal print_msg
		jal read_int
		move $t8,$v0
		la $a0,array
		la $a1,size
		lbu $a1,0($a1)
		move $a2,$v0
		jal linear_search
		move $t0,$v0
		beq $t0,-1,not_found
		la $a0,msg2
		jal print_msg
		move $a0,$t8
		jal print_int
		la $a0,msg3
		jal print_msg
		move $a0,$t0
		jal print_int
		
		
	end:
	   li $v0,10
	   syscall
	
	   
	 not_found:
	          la $a0,msg4
	          jal print_msg
	          j end
	             
	linear_search:
	             li $t0,0  # loop counter
	             loop:
	                 lbu $t1,0($a0)
	                 beq $t1,$a2,return_key_found
	                 beq $t0,$a1,return_key_not_found
	                 addiu $t0,$t0,1
	                 addiu $a0,$a0,1
	                 j loop
	             return_key_found:
	                             la $t4,array
	                             subu $v0,$a0,$t4
	                             jr $ra
	                             
	             
	             return_key_not_found:
	                             li $v0,-1
	                             jr $ra
	   
        print_msg:
                 li $v0,4
                 syscall
                 jr $ra
        read_int: 
                li $v0,5
                syscall
                jr $ra
        print_int:
                li $v0,1
                syscall
                jr $ra