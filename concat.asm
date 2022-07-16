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
        jal concat
        la $a0,str3
        jal print_msg
 
end:
         li $v0,10
         syscall
       
concat:
      store_from_str1:
                 lbu $t0,0($a0)
                 beq $t0,0x0a,label1
                 sb $t0,0($a2)
                 addiu $a0,$a0,1
                 addiu $a2,$a2,1
                 b store_from_str1                           
      store_from_str2:
                 lbu $t0,0($a1)
                 beq $t0,'\0',label2
                 sb $t0,0($a2)
                 addiu $a1,$a1,1
                 addiu $a2,$a2,1
                 b store_from_str2   
      label1: 
           li $t0,' '
           sb $t0,0($a2)  
           addiu $a2,$a2,1
           j   store_from_str2     
      label2:
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
   
