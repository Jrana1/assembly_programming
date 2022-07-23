		     .data
		     array: .byte 1,2,4,8,9,10,12
		     #size:  .byte 7
		     msg1:  .asciiz "Enter a key to search>"
		     msg2:  .asciiz  "The key "
		     msg3:  .asciiz  " located at index "
		     msg4:  .asciiz "Key not found"
		     
	    .text
         main:
               la $a0,msg1
		jal print_msg
		jal read_int
		move $a1,$v0 # key
		move $t9,$v0
		la $a0,array
		li $a2,0  #st
		li $a3,6  #end
		jal binary_search
		move $t0,$v0
		beq $t0,-1,not_found
		la $a0,msg2
		jal print_msg
		move $a0,$t9
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
	         	     
        binary_search:
                     move $t8,$a0
                     loop:
                     bgt $a2,$a3,return_false # go out when all the element already checked
                     addu $t1,$a2,$a3  # r1 = st + end
                     div $t1,$t1,2
                     #la $a0,array    # r1 = (st+end)/2
                     move $t8,$a0
                     addu $t8,$t1,$t8
                     lbu $t2,0($t8)
                     beq $a1,$t2,found
                     bgt $t2,$a1,go_left
                     addu $a2,$t1,1     
                     j loop     
		     
           go_left:
                      addu $a3,$t1,-1
                      j loop
           found:
                   move $v0,$t1
                   jr $ra
          return_false:
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