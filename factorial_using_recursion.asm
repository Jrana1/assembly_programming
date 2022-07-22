          .data
              msg1: .asciiz "Enter a number>"
              msg2: .asciiz "Factorial of "
              msg3: .asciiz " is = "
              #result: .word 1
          .text
      main:
          la $a0,msg1
          jal print_msg
          jal read_int
          move $a0,$v0
          move $t3,$v0
          jal factorial
          mulu $a0,$t3,$v0
          move $t4,$a0
          la $a0,msg2
          jal print_msg
          move $a0,$t3
          jal print_int
          la $a0,msg3
          jal print_msg
          move $a0,$t4
          jal print_int
              
                  
end_of_programm:
               li $v0,10
               syscall
               
               
 factorial:
          addiu $sp,$sp,-8
          sw $a0,0($sp)
          sw $ra,4($sp)
          beq $a0,1,label
          addiu $a0,$a0,-1
          jal factorial
          mulu $v0,$v0,$t0   
         # mflo $v0     
          return:
                lw $t0,0($sp)
                lw $ra,4($sp)
                addiu $sp,$sp,8
                jr $ra                             
               
          label:
             li $v0,1
             j return            
               
               
               
               
print_msg:
         li $v0,4
         syscall
         jr $ra
endl:
    li $a0,'\n'
    li $v0,11
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
              
              