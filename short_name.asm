	.data
	     str1:.space 10
	     str2:.space 10
	     str3: .space 20
	     msg1: .asciiz "Enter a String>"
	     
	 .text
 main:
        la $a0,msg1
        jal print_msg
        la $a0,str1
        li $a1,100
        jal get_line
        la $a0,msg1
        jal print_msg
        la $a0,str2
        li $a1,100
        jal get_line
        la $a0,str1
        la $a1,str2
        la $a2,str3
        jal short_name
        la $a0,str3
        jal print_msg
 
end:
         li $v0,10
         syscall
short_name:
          lbu $t0,0($a0)
          sb $t0,0($a2)
          addiu $a2,$a2,1
          li $t0,'.'
          sb $t0,0($a2)
loop:
        lbu $t0,0($a1)
        beq $t0,'\0',return
        addiu $a1,$a1,1
        addiu $a2,$a2,1
        sb $t0,0($a2)
        j loop
       
return:  
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
get_line:
        li $v0,8
        syscall
        jr $ra
   
