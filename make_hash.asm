	.data
	    str: .space 20
	    msg1: .asciiz "Type a string>"
	    msg2: .asciiz "Type a char>"
	    msg3: .asciiz "\nstring after writing hash>"
	    msg4: .asciiz "Enter '0' for not to continue otherwise '1'>"
	    
	    
	.text
main:
    la $a0,msg1
    jal print_msg
    la $a0,str
    li $a1,20
    jal get_line
    la $a0,msg2
    jal print_msg
    jal get_char
    la $a0,str
    move $a1,$v0
    jal make_hash
    la $a0,msg3
    jal print_msg
    la $a0,str
    jal print_msg
    la $a0,msg4
    jal print_msg
    jal get_int
    beq $v0,1,main
    
end:
      li $v0,10
      syscall
      
make_hash:

        loop:
            lbu $t0,0($a0)
            beq $t0,0x0a,return
            addiu $a0,$a0,1
            bne $t0,$a1,loop
            li $t0,'#'
            addiu $a0,$a0,-1
            sb $t0,0($a0)
            addiu $a0,$a0,1
            j loop
       return:
            jr $ra
print_msg:
         li $v0,4
         syscall
         jr $ra

get_int:
       li $v0,5
       syscall
       jr $ra
get_line:
        li $v0,8
        syscall
        jr $ra
get_char:
        li $v0,12
        syscall
        jr $ra