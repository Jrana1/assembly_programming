          .data
               array: .space 40
               msg1:
                      .asciiz "Enter a number in Decimal>"
               msg2:   
                      .asciiz "Binary>"
           .text
       main:
          la $a0,msg1
          jal print_str
          jal read_int
          move $a0,$v0
          jal Decimal_to_binary
          jal find_tail
          move $t3,$v0
          la $a0,msg2
          jal print_str
          la $a0,array
          move $a1,$t3
          jal print_array
       
       

   end:
      li $v0,10
      syscall
      
      
      
      
      
  Decimal_to_binary:
                   la $a1,array
                   li $t0,2
                              loop:
                                  beq $a0,0,return
                                  div $a0,$t0
                                  mflo $a0
                                  mfhi $t1
                                  sb $t1,0($a1)
                                  addiu $a1,$a1,1
                                  j loop          
                   return:
                         li $t0,2
                         sb $t0,0($a1)
                         jr $ra 
                         
                         
                         
find_tail:
         la $a0,array
            loop3:
                lb $t0,0($a0)
                beq $t0,2,break1
                addiu $a0,$a0,1
                j loop3 
            break1:
                addu $a0,$a0,-1
                move $v0,$a0
                jr $ra                       
                         
print_array:
            move $t3,$a0
           loop1: 
               lb $a0,0($a1)
               beq $a1,$t3,return1
               addiu $sp,$sp,-4
               sw $ra,0($sp)
               jal print_int
               lw $ra,0($sp)
               addiu $sp,$sp,-4
               addiu $a1,$a1,-1
               j loop1
               return1: 
                    addiu $sp,$sp,-4
                    sw $ra,0($sp)
                    jal print_int
                    lw $ra,0($sp)
                    addiu $sp,$sp,-4
                    jr $ra
                    
   print_int:
           li $v0,1
           syscall
           jr $ra
   read_int:
          li $v0,5
          syscall
          jr $ra
   print_str:
           li $v0,4
           syscall
           jr $ra