		.data
		     str1: .space 126
		     str2: .space 126
		     msg1: .asciiz "Zeichenkette (max. 126 Zeichen)>"
		     msg2: .asciiz "Geaenderte Zeichenkette 2: "
		     msg3: .asciiz "Anzahl der Ersetzungen: "
		    
		.text
	
main:
    la $a0,msg1
    jal print_msg
    la $a0,str1
    li $a1,126
    jal get_line
    move $t0,$a0
    la $a0,msg1
    jal print_msg
    la $a0,str2
    li $a1,126
    jal get_line
    move $a1,$a0
    move $a0,$t0
    jal mark_prefix
    move $t0,$v0
    la $a0,msg2
    jal print_msg
    la $a0,str2
    jal print_msg
    la $a0,msg3
    jal print_msg
    move $a0,$t0
    jal print_int
    
    		
end:
   li $v0,10
   syscall
  
   
print_msg:
         li $v0,4
         syscall
         jr $ra
get_line:
        li $v0,8
        syscall
        jr $ra
print_int:
         li $v0,1
         syscall
         jr $ra
mark_prefix:
           li $t2,0
           loop:
               lbu $t0,0($a0)
               lbu $t1,0($a1)
               bne $t0,$t1,return
               beq $t0,'\0',return
               li $t0,'#'
               sb $t0,0($a1)
               addiu $a0,$a0,1
               addiu $a1,$a1,1
               addiu $t2,$t2,1
               j loop
return:
      move $v0,$t2
      jr $ra
               
    