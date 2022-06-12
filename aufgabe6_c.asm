.data
	     str2: .asciiz "12421"
	.text
	lui $a0,0x1001
	jal strisPalindrome 
	addiu $8,$v0,0 
end_of_programm:
        beq $0,$0,end_of_programm
        
        # implementationo of isPalindrome function
strisPalindrome:
         lui $20,0x0040   # saving the address of caller in r20
         ori $20,$ra,0
         
         jal str_len    # calling str_len func
         
         addiu $21,$v0,0    # set r21 to return value of  str_len
          
         addiu $8,$a0,0  # start address
         addiu $9,$21,-1  # length of strign
         addu $10,$9,$8  #end address of string
         
         loop1:
             lb $11,0($8)   # load first character  in r11
             lb $12,0($10)   # load last character in r12
             bne $11,$12,return_false   # return false if r11!=r12
             addiu $8,$8,1    # r8++
             addiu $10,$10,-1  #r10--
             beq $8,$10,return_true   # return true if r8==r10, that means we have check all the pairs
             j loop1      # else continue loop
         return_false:
               addiu $v0,$0,0  # return false
               jr $20      # go back to caller
         return_true:
               addiu $v0,$0,1   # return true
               jr $20           # go back to caller            
str_len:
       addiu $8,$a0,0  # taking the address of str2 in r8
       addiu $9,$zero,0 # init count variable in r9 with zero
       
       loop:
           lb $10,0($8)
           addiu $8,$8,1
           beq $10,$0,return
           addiu $10,$10,1
           addiu $9,$9,1
           j loop
        return:
              addiu $v0,$9,0
              jr $ra   