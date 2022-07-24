	.data
	   
	    str1: .space 200
	    msg1: .asciiz "Enter a binary number>"
	    msg2: .asciiz "Decimal>"
	    msg3: .asciiz "The entered number is not a binary number. Enter '0' to stop otherwise '1' to continue>"
	    
	 .text
main:
  
    la $a0,msg1
    jal print_str
    la $a0,str1
    li $a1,200
    jal  get_line
    la $a0,str1
    jal isBinary
    bne $v0,1,error
    la $a0,str1
    jal binary_to_decimal
    move $t0,$v0
    la $a0,msg2
    jal print_str
    move $a0,$t0
    jal print_int
  
  end:
     li $v0,10
     syscall
     
  
 error:   
      la $a0,msg3
      jal print_str
      jal get_line
      lbu $t0,0($a0)
      sub $t0,$t0,'0'
      beq $t0,0,end
      j main
 isBinary:
         loop4:
              lbu $t0,0($a0)
              beq $t0,'\n',back_to_caller
              seq $t1,$t0,'1'
              seq $t2,$t0,'0' 
              addu $t3,$t1,$t2
              addiu $a0,$a0,1
              bne $t3,1,return_false1
              
              j loop4
              return_false1:
                          li $v0,0
                          jr $ra
                 
              back_to_caller:
                          li $v0,1
                          jr $ra     
                          
     
 binary_to_decimal:
                  li $t1,0  # sum in t1
                  addiu $sp,$sp,-8
                  sw $ra,0($sp)
                  sw $a0,4($sp)
                  jal str_len
                  move $t3,$v0  # len in t3
                  lw $ra,0($sp)
                  lw $a0,4($sp)
                  addiu $sp, $sp,8
                  loop3:
                       lbu $t0,0($a0)
                       beq $t0,'\n',go_back
                       sub $t0,$t0,'0'
                       addiu $sp,$sp,-12
                       sw $ra,0($sp)
                       sw $a0,4($sp)
                       sw $t0,8($sp)
                       li $a0,2
                       move $a1,$t3
                       jal pow
                       lw $ra,0($sp)
                       lw $a0,4($sp)
                       lw $t0,8($sp)
                       addiu $sp, $sp,12
                       mul $v0,$v0,$t0
                       addu $t1,$t1,$v0
                       addiu $t3,$t3,-1
                       addiu $a0,$a0,1
                       j loop3
                   go_back:
                          move $v0,$t1
                          jr $ra
                       
     
     
     
     
     
     
  print_str:
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
         
     # addresse in $a0 geben    
str_len:
        loop1:
             lbu $t0,0($a0)
             beq $t0,'\n',return1
             addiu $a0,$a0,1
             j loop1
        return1:
               la $t0,str1
               sub $v0,$a0,$t0
               addiu $v0,$v0,-1
               jr $ra
         
         
         # a^b  a0=a,  a1=b
   pow:
      li $t0,1
      loop:
          beq $a1,0,return
          addiu $a1,$a1,-1
          mul $t0,$t0,$a0
          j loop
      return:
           move $v0,$t0
           jr $ra
          
	      
	    