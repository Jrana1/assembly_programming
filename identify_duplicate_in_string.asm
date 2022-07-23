		.data
		    str: .space 300
		    msg3: .asciiz "Enter a string>"
		    
		 .text
		 
main:
     la $a0,msg3
     jal print_msg
     la $a0,str
     li $a1,300
     jal get_line
 
     loop1:
          lbu $t0,0($a0)
          beq $t0,'\n',return
          addiu $a0,$a0,1
          move $t1,$a0
          loop2:
               lbu $t3,0($t1)
               beq $t3,'\n',loop1
               addiu $t1,$t1,1
               seq $t4,$t0,$t3
               sne $t5,$a0,$t1
               add $t4,$t4,$t5
               bne $t4,2,loop2
               li $t3,'#'
               addiu $t1,$t1,-1
               sb $t3,0($t1)
               addiu $t1,$t1,1
               j loop2
               
               
return:
   la $a0,str
   jal print_msg
   end:
   li $v0,10
   syscall
     j end          
               
print_msg:
        li $v0,4
        syscall
        jr $ra
print_char:
          li $v0,11
          syscall
          jr $ra
get_line:
        li $v0,8
        syscall
        jr $ra 