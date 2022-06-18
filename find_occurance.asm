	.data
	msg: .asciiz "Enter your Name\n"
	msg1: .asciiz "Your Name is : "
	msg2: .asciiz "Occurance(s) : "
	name: .space 30
	.text
	    la $a0,msg
	    li $v0,4
	    syscall
	    la,$a0,name
	    li $a1,30
	    li $v0,8
	    syscall
	    
	    la $a0,msg1
	    li $v0,4
	    syscall
	    
	    la $a0,name
	    li $v0,4
	    syscall
	    la $a0,name
	    li $a1,'e'
	   jal find_occurance 
	   move $11,$v0 
	   la $a0,msg2
	   li $v0,4
	   syscall
	   move $a0,$11
	   li $v0,1
	   syscall
	
end_of_loop:
	    beq $0,$0,end_of_loop	
	
find_occurance:
             move $8,$a0
             move $9,$a1
             addiu $12,$zero,0
             
             loop:
                 lbu $11,0($8)
                 addiu $8,$8,1
                 beq $11,$0,return
                 bne $11,$9,loop
                 addiu $12,$12,1
                 j loop
                 return: 
                       move $v0,$12
                       jr $ra
              
	
