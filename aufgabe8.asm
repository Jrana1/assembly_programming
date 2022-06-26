	.data
	    z1:.word 0
	    n1: .word 0
	    msg1: .asciiz "Zaehler>"
	    msg2: .asciiz "Nenner>"
	    msg3: .asciiz "Reduzierte Darstellung " 
	    msg4: .ascii "Fehler: Nenner=0\n"
	    msg5: .asciiz "Weitere Berechnung '1' ( '0' exit)>"
	    msg6: .asciiz " ggT "
	.text
	
main:   
     # print msg1
     la $a0,msg1
     jal print_msg 
     # Take first input(Integer) from user
     jal take_input
     move $t0,$v0  # save first num in $t0
     #print new line
     jal endl
      # print msg2
     la $a0,msg2
     jal print_msg
     # Take secound input(Integer) from user
     jal take_input
     move $t1,$v0  # save second num in $a1
     move $a0,$t0
     move $a1,$t1
     la $a2,z1
     la $a3,n1
     jal reduce_fraction
     move $t3,$v0
     beq $t3,$0,error
     # print msg3
     la $a0,msg3
     jal print_msg
     # load number from z1
     lw $a0,z1($0)
     jal print_integer
     #print '/'
     li $a0,'/'
     li $v0,11
     syscall
     lw $a0,n1($0)
     jal print_integer
     la $a0,msg6
     jal print_msg
     move $a0,$t3
     jal print_integer
     jal endl
     la $a0,msg5
     jal print_msg
     jal take_input
     move $t5,$v0
     bne $t5,$0,main  
end_of_programm:
            beq $0,$0,end_of_programm

     
    # implementation of reduce_fraction function 
reduce_fraction:
                beq $a1,$0,return0  # return if n=0
                addiu $sp,$sp,-4    # alocate memory in stack 
                sw $ra,0($sp)       # save address of caller in stack
                jal euklid          # call euklid function
                div $a0,$v0         # z/ggT(z,n)
                mflo $t1            # move qoutient from low in t1
                sw $t1,0($a2)       # store t1 in addres of a2
                div $a1,$v0
                mflo $t1
                sw $t1,0($a3)
                lw $ra,0($sp)
                addiu $sp,$sp,4
                jr $ra
     
return0:
       li $v0,0
       jr $ra
       
print_msg:
         li $v0,4
         syscall
         jr $ra

take_input:
           li $v0,5
           syscall   
           jr $ra
error:
      la $a0,msg4
      jal print_msg
      la $a0,msg5
      jal print_msg
      jal take_input
      move $t5,$v0
      beq $t5,$0,end_of_programm
      j main
print_integer:
            li $v0,1
            syscall 
            jr $ra
            
endl:
     li $a0,'\n'
     li $v0,11
     syscall    
     jr $ra    
     
     
     # euklid in C
     #  euklid (a,b)
     #  if(b==0) return a
     #  return euklid(b,a%b)
   #implementation of euklid function   mips32
euklid:
       move $v0,$a0  # a in $t0
       move $t1,$a1  # b in $t1
loop: 
       beq $t1,$0,return   # if b=0 return a
       div $v0,$t1
       move $v0,$t1
       mfhi $t1
       j loop
return:
       jr $ra                   
                          
       
      
	 