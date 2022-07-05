   	.data
   	    msg1: .asciiz "m>"
   	    msg2: .asciiz "n>"
   	    msg3: .asciiz "m (hex): "
   	    msg4: .asciiz "n (hex): "
   	    msg5: .asciiz "m/n (hex): "
   	    msg6: .asciiz "m%n (hex): "
   	    msg7: .asciiz "x: "
   	    msg8: .asciiz "x in (IEEE): "
   	    msg9: .asciiz "y: "
   	    msg10: .asciiz "y in (IEEE): "
   	    msg11: .asciiz "x/y: "
   	    msg12: .asciiz "x/y in (IEEE): "
   	        
   	.text
   main: 
        la $a0,msg1
        jal print_msg
        jal read_int
        move $t8,$v0
        la $a0,msg2
        jal print_msg
        jal read_int
        move $t9,$v0
   	la $a0,msg3
   	jal print_msg
   	move $a0,$t8
   	jal print_in_hex
   	jal endl
   	la $a0,msg4
   	jal print_msg
   	move $a0,$t9
   	jal print_in_hex
   	jal endl
   	div $t8,$t9
        la $a0,msg5
        jal print_msg
        mflo $a0
        jal print_in_hex
   	jal endl
   	la $a0,msg6
   	jal print_msg
   	mfhi $a0
   	jal print_in_hex
   	jal endl
   	mtc1 $t8,$f12
   	cvt.s.w $f12,$f12
   	mov.s $f13,$f12
   	la $a0,msg7
   	jal print_msg
   	
   	jal print_float
   	jal endl
   	la $a0,msg8
   	jal print_msg
   	mfc1 $a0,$f12
   	jal print_in_hex
   	jal endl
   	
   	
   	mtc1 $t9,$f12
   	cvt.s.w $f12,$f12
   	mov.s $f15,$f12
   	la $a0,msg9
   	jal print_msg
   	
   	jal print_float
   	jal endl
   	la $a0,msg10
   	jal print_msg
   	mfc1 $a0,$f12
   	jal print_in_hex
        jal endl
   	div.s $f12,$f13,$f15
   	la $a0,msg11
   	jal print_msg
   	jal print_float
       # cvt.w.s $f12,$f12
        jal endl
        
       la $a0,msg12
       jal print_msg
       mfc1 $a0,$f12
       jal print_in_hex
   	
   	
   	
 end_of_programm:
               li $v0,10
               syscall



print_float:
           li $v0,2
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
print_msg:
         li $v0,4
         syscall
         jr $ra	    
print_in_hex:
            li $v0,34
            syscall 
            jr $ra	    
   