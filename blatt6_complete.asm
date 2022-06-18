	.data
	     str1:.asciiz "Lager"   
	     str2:.asciiz "Regal"
	     str3:.space 10
	          .byte 0xff
	          .byte 0xff
	.text
	   la $a0,str1  # saving the start address of str1 in a0
	   jal toLower     #calling toLower function  toLower(str1)
	   
	   la $a0,str2 # # saving the start address of str2 in a0
	   jal toLower   # calling  to toLower function with str2
	   
	   
	   la $a0,str1 # saving the start address of str1 in a0
	   jal strturnaround     #calling strturnaround function  toLower(str1)
	   
	    
	   la $a0,str2 # # saving the start address of str2 in a0
	   jal strturnaround   # calling  to strturnaround function with str2
	   
	  
	    la $a0,str1  #address of str2in a1
	    la $a1,str2  #address of str2in a2
	    la $a2,str3
	    jal strcat    # calling strcat function
	    
	    la $a0,str3     
	    jal strisPalindrome  # call isPalindrome
	    move $8,$v0          # save the return value of isPalindrome fun
	   
	   
	   
	   
	   
	   
	   
end_of_programm:
           beq $0,$0,end_of_programm       #end of the  main programm
           
           
            
# implementation of strcat function
	    
   
strcat:
           move $7,$a0  # address of str1 in r7
           move $8,$a1    # address of str2 in r8
           move $9,$a2      # address of str3 in r9
           
           label1:
                 lbu $10,0($7)   # load element from str1
                 beq $10,$0,label2  # load element from str1 untill r10=0
                 sb $10,0($9)       # store element in str3
                 addiu $7,$7,1      # increament r7
                 addiu $9,$9,1      # increament r9
                 j label1    # continue loop
          label2:
                 lbu $10,0($8)   # load element from str1
                 beq $10,$0,return4  # load element from str1 untill r10=0
                 sb $10,0($9)       # store element in str3
                 addiu $8,$8,1
                 addiu $9,$9,1     
                 j label2 
           return4:
                  li $10,'\0'  # null termination
                  sb $10,0($9)
                  jr $ra
	    	     
	     
	    	     	     
	     	     	     	    	          
           
                
                     
                               
         
           
                    
           
           #implementation of toLower function
toLower: 
       addiu $17,$zero,0x40  # from A
       addiu $13,$zero,0x5b  # to Z
       addiu $10,$a0,0       #taking the address of str1
       addiu $20,$zero,1     #init r20 with 1
       sll $20,$20,5         #shifting r20 five times left to build 
       
       loop:       
           lbu $12,0($10)  # load first character in r12
           beq $12,$0,return    # if th character is null return
           addiu $10,$10,1      #  increament index
           slt $15,$17,$12 # set r15=1 if r12 <r13
           slt $16,$12,$13 #set r16=1 if r10<12
           bne $15,$16,loop  # if the character not between 'A' to 'Z' go for next character
           #addiu $12,$12,32
           or $12,$12,$20 #using bit masking
           addi $11,$10,-1  # decreamenting the index, as it has already been incremented
           sb $12,0($11)     # store the small character at that position
           j loop      # continue loop
           
       return:
           jr $ra  
           
           
    
  
             #implementation of strturnaround function

strturnaround:       
        
        addiu $sp,$sp,-4
        sw $ra, 0($sp)
        jal str_len   # calling str_len to get len of str
	addiu $17,$v0,0  # r17=len
        addiu $8,$a0,0  # get start address of str
        ori $14,$0,2    # set r14 to 2
        div $17,$14     # divide len by 2
        mflo $14        # get le/2 and put in r14
        addu $14,$8,$14   # set r14 to r8 + len/2
        addiu $10,$17,-1   # set r10 to len -1
        addu $10,$8,$10    # set r10 to last address-1
       
       
        loop1:
            lbu $11,0($8)  # r8 is the start address of str, r11 has last character
            lbu $12,0($10)  # r10 is len -1, r12 has last character
            xor $11,$11,$12  #r11=r11^r12
            xor $12,$11,$12   #r12 = r11^r12
            xor $11,$11,$12   # r11 = r11^r12
            sb $11,0($8)      # store r11 
            sb $12,0($10)     # store r12
            beq $14,$10,return1   # r14=len/2, r10= len -1
            addiu $8,$8,1         # r8++
            addiu $10,$10,-1      # r10--
            j loop1
            return1:
               lw $ra,0($sp)
               addiu $sp,$sp,4
               jr $ra     # return to caller




 # implementationo of isPalindrome function
strisPalindrome:
         
         addiu $sp,$sp,-4  # allocating memory in stack
         sw $ra,0($sp)      # storing the address of caller in stack
         jal str_len    # calling str_len func
         
         addiu $21,$v0,0    # set r21 to return value of  str_len
         li $25,2
         div $21,$25     # find len/2
         mflo $25
         addiu $25,$a0,0
         addiu $8,$a0,0  # start address
         addiu $9,$21,-1  # length of strign
         addu $10,$9,$8  #end address of string
         
         loop3:
             lb $11,0($8)   # load first character  in r11
             lb $12,0($10)   # load last character in r12
             bne $11,$12,return_false   # return false if r11!=r12
             addiu $8,$8,1    # r8++
             addiu $10,$10,-1  #r10--
             beq $10,$25,return_true   # return true if r8==r10, that means we have check all the pairs
             j loop3      # else continue loop
         return_false:
               addiu $v0,$0,0  # return false
               lw $ra,0($sp)
               addiu $sp,$sp,4
               jr $ra     # go back to caller
         return_true:
               addiu $v0,$0,1   # return true
               lw $ra,0($sp)    # getting caller address from stack
               addiu $sp,$sp,4     # deallocating memory in stack
               jr $ra     # go back to caller         # go back to caller       




  #implementation of str_len function

str_len:
       addiu $8,$a0,0  # taking the address of str2 in r8
       addiu $9,$zero,0 # init count variable in r9 with zero
       
       loop2:
           lb $10,0($8)
           addiu $8,$8,1
           beq $10,$0,return2
           addiu $10,$10,1
           addiu $9,$9,1
           j loop2
        return2:
              addiu $v0,$9,0
              jr $ra      
