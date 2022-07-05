
	.data
	    msg1: .asciiz "p>"
	    msg2: .asciiz "q>"
	    msg3: .asciiz " solution(s)\n"
	    msg4: .asciiz "solution 1: "
            msg5: .asciiz "solution 2: "
            n2: .double -2
            n4: .double 4
            n0: .double 0
            
            
        .text
       main:
            la $a0,msg1
            jal print_msg
            jal read_double
            mov.d $f12,$f0
            
            la $a0,msg2
            jal print_msg
            jal read_double
            mov.d $f14,$f0
            jal quadsolve
           
            beq $v0,2,print2
            beq $v0,1,print1
            move $a0,$v0
            jal print_int
            la $a0,msg3
            jal print_msg
           
   
end_of_programm:
                li $v0,10
                syscall
 
print2:
     jal print_int
     la $a0,msg3
     jal print_msg
     mov.d $f12,$f0
     la $a0,msg4
     jal print_msg
     jal print_double
     jal endl
     mov.d $f12,$f2
     la $a0,msg5
     jal print_msg
     jal print_double
     b end_of_programm   
 
 
print1:
     jal print_int
     la $a0,msg3
     jal print_msg
     mov.d $f12,$f0
     la $a0,msg4
     jal print_msg
     jal print_double 
     b end_of_programm   
 

endl:
    li $a0,'\n'
    li $v0,11
    syscall
    jr $ra

   
      
print_double:
            li $v0,3
            syscall
            jr $ra   
   
print_int:
         move $a0,$v0
         li $v0,1
         syscall
         jr $ra
         
quadsolve:
         mul.d $f16,$f12,$f12 # f16 = p^2
         ldc1 $f18,n4
         div.d $f16,$f16,$f18     # f16=p^2/2
         sub.d $f16,$f16,$f14     # f16 = p^2/4 - q=D
          ldc1 $f22,n0
         c.eq.d $f16,$f20   # set flag=2 if D=0
         bc1t label1
         c.lt.d $f16,$f20
         bc1t label2
         
         ldc1 $f20,n2
         sqrt.d $f16,$f16
         div.d $f12,$f12,$f20
         sub.d $f0,$f12,$f16
         add.d $f2,$f12,$f16
         li $v0,2
        
         jr $ra
   
label1:
      li $v0,1
      ldc1 $f20,n2
      div.d $f0,$f12,$f20
      jr $ra
label2:
      li $v0,0
      jr $ra 
         
            
print_msg:
         li $v0,4
         syscall
         jr $ra
                          
read_double:
           li $v0,7
           syscall
           jr $ra            