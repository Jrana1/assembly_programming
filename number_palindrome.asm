	 .data
	     msg1: .asciiz "Enter a number>"
	     msg2: .asciiz "The entered number is a Palindrome"
	     msg3: .asciiz "The entered number is not a Palindrome"
	     
	 .text
main: 
    la $a0,msg1
    jal print_str
    jal read_int
    move $a0,$v0
    jal isPalindrome
    beq $v0,0,label1
    la $a0,msg2
    jal print_str
end:
   li $v0,10
   syscall
  label1:
       la $a0,msg3
       jal print_str
       j end 
isPalindrome:
            li $t0,0
            move $t3,$a0
            li $t1,10
            loop:
                beq $a0,0,return
                div $a0,$t1
                mflo $a0
                mfhi $t2
                mul $t0,$t0,10
                addu $t0,$t0,$t2
                j loop
                return:
                      beq $t3,$t0,return_true
                      li $v0,0
                      jr $ra
                      return_true:
                            li $v0,1
                            jr $ra
                            
   
read_int:
       li $v0,5
       syscall
       jr $ra
print_str:
         li $v0,4
         syscall
         jr $ra
	 
	 