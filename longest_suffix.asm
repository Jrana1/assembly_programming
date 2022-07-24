         .data
             str1: .space 126
             str2: .space 126
             str3: .space 10
             msg1: .asciiz "Zeichenkette (max.126)>"
             msg2: .asciiz "frwd:"
             msg3: .asciiz "Gesuchte Suffix: "
	.text
main:
    la $a0,msg1
    jal print_str
    la $a0,str1
    li $a1,126
    jal get_line
    la $a1,str2
    la $a3,str3
    jal fwrd
    la $a0,msg2
    jal print_str
    la $a0,str2
    jal print_str
    jal endl
    la $a0,msg3
    jal print_str
    la $a0, str3
    jal print_str
 
 
end:
   li $v0,10
   syscall
   
endl:
    li $a0,'\n'
    li $v0,11
    syscall
    jr $ra  
fwrd:
    li $t0,'1'
    sb $t0,0($a1)
    move $t1,$a0
    addiu $a0,$a0,1
    addiu $a1,$a1,1
    loop:
        lbu $t0,0($a0)
        beq $t0,'\n',return
        lbu $t2,0($t1)
        bge $t2,$t0,set_to_one
        li $t3,'1'
        sb $t3,0($a1)
        addiu $a1,$a1,1
        addiu $a0,$a0,1
        addiu $t1,$t1,1
        j loop
        
    set_to_one:
        li $t3,'0'
        sb $t3,0($a1)
        addiu $a1,$a1,1
        addiu $a0,$a0,1
        addiu $t1,$t1,1
        j loop
  return:
        addiu $a0,$a0,-1
        addiu $a1,$a1,-1
        lbu $t0,0($a1)
        beq $t0,'1',stop
        j return
        stop:
             lbu $t0,0($a0)
             sb $t0,0($a3)
             beq $t0,'\n',back_to_caller
             addiu $a3,$a3,1 
             addiu $a0,$a0,1
             j stop
         
         back_to_caller:
                      move $v0,$a3
                      jr $ra
             

print_str:
         li $v0,4
         syscall
         jr $ra
get_line:
        li $v0,8
        syscall
        jr $ra

   