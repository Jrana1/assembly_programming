	.data
	    str: .space 250
	    msg1: .asciiz "Eingabe einer Zeichenkette (max. 256 Zeichen)>"
	    msg2: .asciiz "Keine doppelten Zeichen gegunden"
	    msg3: .asciiz "Die Zeichenkette enthaelt doppelte Zeichen"
    .text	    
main:

   la $a0,msg1
   jal print_msg
   la $a0,str
   li $a1,250
   jal get_line
   jal is_dobble_char
   beq $v0,1,print_when_true
   la $a0,msg2
   jal print_msg
   
end:
  li $v0,10
  syscall
  
print_when_true:
              la $a0,msg3
              jal print_msg
              j end
 
is_dobble_char:
                     move $t0,$a0
                     addiu $t0,$t0,1
                     loop:
                         lbu $t1,0($a0)
                         lbu $t2,0($t0)
                         beq $t1,$t2,return_true
                         beq $t2,'\0',return_false
                         addiu $a0,$a0,1
                         addiu $t0,$t0,1
                         j loop
                    return_true:
                         li $v0,1
                         jr $ra
                     return_false:
                         li $v0,0
                         jr $ra
                             
  
print_msg:
        li $v0,4
        syscall
        jr $ra
get_line:  
       li $v0,8
       syscall
       jr $ra
        