		.data
		    array: .byte 3,8,9,1,7,1,13,0xf
		    max:   .byte 0
		    min:   .byte 0
		    msg1:  .asciiz "Max is > "
		    msg2:  .asciiz "Min is > "
		    
		.text
   mian:
       la $a0,array
       la $a1,max
       jal find_max
       la $a0,array
       la $a1,min
       jal find_min
       la $a0,msg1
       jal print_msg
       lbu $a0,max($0)
       jal print_int
       jal endl
       la $a0,msg2
       jal print_msg
       lbu $a0,min($0)
       jal print_int
         
end_of_programm: 
               li $v0,10
               syscall
print_int:
        li $v0,1
        syscall
        jr $ra              
               
endl:
    li $a0,'\n'
    li $v0,11
    syscall
    jr $ra
print_msg:
         li $v0,4
         syscall
         jr $ra            
               
find_max:
        lbu $t0,0($a0)
        addiu $a0,$a0,1
        loop:  
            lbu $t1,0($a0)
            addiu $a0,$a0,1
            beq $t1,0xf,return
            blt $t1,$t0	,loop
            move $t0,$t1
            j loop
return:
      sb $t0,0($a1)
      jr $ra    
find_min:
        lbu $t0,0($a0)
        addiu $a0,$a0,1
        loop1:  
            lbu $t1,0($a0)
            addiu $a0,$a0,1
            beq $t1,0xf,return1
            bgt $t1,$t0	,loop1
            move $t0,$t1
            j loop1
return1:
      sb $t0,0($a1)
      jr $ra         
      

      
      
		  