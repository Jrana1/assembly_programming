 	.data
	    msg1: .asciiz "Zaehler>"
	    msg2: .asciiz "Nenner>"
	    msg3: .asciiz "Reduzierte Darstellung "
	    msg4: .asciiz " ggT "
	    msg5: .asciiz "Fehler!! Nenner = 0\n"
	    msg6: .asciiz "Für weitere Berechnung '1' ansonsten '0'(exit)"
	    z1: .word 0
	    z2: .word 0
	    
	.text
main:
    
    la $a0,msg1
    jal print_msg
    jal read_int
    move $t0,$v0
    la $a0,msg2
    jal print_msg
    jal read_int
    move $a1,$v0
    move $a0,$t0
    la $a2,z1
    la $a3,z2
    jal reduce_fraction
    move $t0,$v0
    beq $v0,0,error
    la $a0,msg3
    jal print_msg
    lw $a0,z1($0)
    jal print_int
    li $a0,'/'
    jal print_char
    lw $a0,z2($0)
    jal print_int
    la $a0,msg4
    jal print_msg
    move $a0,$t0
    jal print_int
    la $a0,msg6
    jal print_msg
    li $a0,'\n'
    jal print_char
    jal read_int
    beq $v0,1,main
        
end_of_programm:
               li $v0,10
               syscall
               
error:
     la $a0,msg5
     jal print_msg
     la $a0,msg6
     jal print_msg
     jal read_int
     beq $v0,1,main
     j end_of_programm
     
print_msg:
         li $v0,4
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
print_char:
    li $v0,11
    syscall
    jr $ra
    
reduce_fraction:
               beq $a1,0,return_false
               addiu $sp,$sp,-20
               sw $ra,0($sp)
               sw $a0,4($sp)
               sw $a1,8($sp)
               sw $a2,12($sp)
               sw $a3,16($sp)
               jal ggT
               #move $t0,$v0
               lw $ra,0($sp)
               lw $a0,4($sp)
               lw $a1,8($sp)
               lw $a2,12($sp)
               lw $a3,16($sp)
               addiu $sp,$sp,20
               div $a0,$v0
               mflo $t1
               sw $t1,0($a2)
               div $a1,$v0
               mflo $t1
               sw $t1,0($a3)
               #li $v0,1
               jr $ra
 return_false:
             li $v0,0
             jr $ra              
                     
            
ggT:
   move $t0,$a0 #a
   move $t1,$a1 #b
   loop:
       beq $t1,0,return
       div $t0,$t1
       move $t0,$t1
       mfhi $t1
       j loop
   return:
         move $v0,$t0
         jr $ra
       
   
   
   
   
                      
	