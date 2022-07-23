		.data
		     array: .byte 4,2,1,9,3,5,7
		     
		.text
	main:
	        la $a0,array
		jal insertion_sort
	end:
	   li $v0,10
	   syscall
	 
	insertion_sort:
	              move $t5,$a0
	              addiu $a0,$a0,1
	              loop1:
	                   lbu $t0,0($a0)
	                   beq $t0,0,return
	                   addiu $t1,$a0,-1
	                   addiu $a0,$a0,1
	                   loop2:
	                        lbu $t2,0($t1)	 
	                        sgt $t3,$t2,$t0
	                        sge $t4,$t1,$t5
	                        addu $t3,$t3,$t4
	                        bne $t3,2,insert
	                        move $t6,$t1
	                        addiu $t6,$t6,1
	                        sb $t2,0($t6)
	                        addiu $t1,$t1,-1
	                        j loop2
	                 insert:
	                       addiu $t1,$t1,1
	                       sb $t0,0($t1)
	                       j loop1
	                 return:
	                      jr $ra
	                        