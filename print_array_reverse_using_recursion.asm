		.data
		    array: .half 8,12,3,21
		    
		.text
 main:
     la $a0,array
     jal print_reverse
end_of_programm:
               li $v0,10
               syscall

print_int:
         li $v0,1
         syscall
         li $a0,','
         li $v0,11
         syscall
         jr $ra

print_reverse:
                 addiu $sp,$sp,-8
                 sw $ra,0($sp)
                 sw $t0,4($sp)
                 lbu $t0,0($a0)
                 beq $t0,0,return
                
                 addiu $a0,$a0,2
                 jal print_reverse
                 
                 addiu $sp,$sp,-4
                 sw $ra,0($sp)
                 jal print_int
                 lw $ra,0($sp)
                 addiu $sp,$sp,4     
             return:
                   lw $ra,0($sp)
                   lw  $a0,4($sp)
                   addiu $sp,$sp,8
                   jr $ra
                   
      
    
		