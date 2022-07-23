	.data
	    str:  .space 200
	    msg1: .asciiz "Enter a string>"     
	    msg2: .asciiz "Enter your key>"   
	    msg3: .asciiz "Enter Your Key for getting the original msg(with -sign)>"
        .text
main:
     la $a0,msg1
     jal print_msg
     la $a0,str
     li $a1,200
     jal get_line
     la $a0,msg2
     jal print_msg
     la $a0,str
     jal read_int
     move $a1,$v0
     jal caser_code
     la $a0,str
     jal print_msg
     jal endl
     la $a0,msg3
     jal print_msg
     jal read_int
     move $a1,$v0
     la $a0,str
     jal caser_code
     la $a0,str
     jal print_msg
     
     
  end:
     li $v0,10
     syscall

caser_code:
          loop:
              lbu $t0,0($a0)
              beq $t0,'\n',return
              addu $t0,$t0,$a1
              bge $t0,127,go_back_to_begin
              sb $t0,0($a0)
              addiu $a0,$a0,1
              j loop
              
go_back_to_begin:
                li $t0,'a'
                addu $t0,$t0,$a1
                sb $t0,0($a0)
                addiu $a0,$a0,1
                j loop
return:
      jr $ra             

print_msg:
        li $v0,4
        syscall
        jr $ra
read_int:
       li $v0,5
       syscall
       jr $ra
get_line:
        li $v0,8
        syscall
        jr $ra
endl:
    li $a0,'\n'
    li $v0,11
    syscall
    jr $ra
    