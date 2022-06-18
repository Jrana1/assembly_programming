   
   
   .data 
       array: .byte 3,8,1,0,2
   .text
   
        la $a0,array
        addiu $a1,$a0,5
        jal print
    end:
       beq $0,$0,end
    print:
        
         addiu $sp,$sp,-8
         sw $ra,0($sp)
         sw $12,4($sp)
         beq $a0,$a1,return
         lbu $12,0($a0)
         addiu $a0,$a0,1
         jal print
         
         move $a0,$12
         li $v0,1
         syscall
         li $a0,'\n'
         li $v0,11
         syscall
         return:
               lw $ra,0($sp)
               lw $12,4($sp)
               addiu $sp,$sp,8
               jr $ra
       
         
      
           
          