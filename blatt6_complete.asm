	.data
	     str1:.asciiz "Lager"   
	     str2:.asciiz "madam"
	     str3:.space 10
	          .byte 0xff
	          .byte 0xff
	.text
	   lui $a0,0x1001  # saving the start address of str1 in a0
	   jal toLower     #calling toLower function  toLower(str1)
	   
	   addiu $a0,$a0,6  # # saving the start address of str2 in a0
	   jal toLower   # calling  to toLower function with str2
	   
	   
	   lui $a0,0x1001  # saving the start address of str1 in a0
	   jal strturnaround     #calling strturnaround function  toLower(str1)
	   
	   addiu $a0,$a0,6  # # saving the start address of str2 in a0
	   jal strturnaround   # calling  to strturnaround function with str2
	   
	    lui $a0,0x1001  # address of str1 in a0
	    addiu $a1,$a0,6 #address of str2in a1
	    addiu $a2,$a1,6 #address of str2in a2
	    jal strcat    # calling strcat function
	   
	   
	   lui $a0,0x1001  # saving the start address of str1 in a0
	   jal strisPalindrome     #calling strturnaround function  toLower(str1)
	   
	   addiu $7,$v0,0   # saving the return value in r7
	   
	   addiu $a0,$a0,6  # # saving the start address of str2 in a0
	   jal strisPalindrome   # calling  to strturnaround function with str2
	   
	   addiu $8,$v0,0   # saving the return value in r8
	   
	   
	   
	   
	   
	   
	   
end_of_programm:
           beq $0,$0,end_of_programm       #end of the programm
           
           
           
           
           
           
           
           
           
           
# implementation of strcat function
	    
   
strcat: 
      lui $20,0x0040
      ori $20,$ra,0
      addiu $8,$a0,0 # address of str1 in r8
      addiu $9,$a1,0  # address of str1 in r9
      addiu $10,$a2,0  # address of str1 in r10
      addiu $11,$zero,5 # set r11 to  len of str1
      addiu $12,$zero,0 # set r12 to  0. this will count the num of iteration
      
      loop5:
            slt $13,$12,$11   # set r13=1 if r12(count) less then 5
            lbu $14,0($9)
            beq $14,$0, return_back #  return when reached to end of str2
            beq $11,$12,skip_for_null_at_str1
            bne $13,$0,store_from_str1  # store from str1 to str3 if count less than strlen(str1)
            beq $13,$0,store_from_str2  # store from str2 to str3 if count greater than strlen(str1)
            j loop5
            
            store_from_str1:
                           lbu $14,0($8)  # load character from str1 in r14
                           addiu $8,$8,1  # r8++
                           sb $14,0($10)  # store that character in str3
                           addiu $10,$10,1 #r10++
                           addiu $12,$12,1  # count++<=>r12++
                           j loop5
            store_from_str2:
                           lbu $14,0($9)  # load character from str1 in r14
                           addiu $9,$9,1  # r9++
                           sb $14,0($10)  # store that character in str3
                           addiu $10,$10,1 #r10++
                           addiu $12,$12,1  # count++<=>r12++
                           j loop5    # continue loop
            skip_for_null_at_str1:
                       addiu $12,$12,1  # r12++<=>count++
                       j loop5       # continue loop
            return_back:
                         jr $20    # return to caller
	    	     
	     
	    	     	     
	     	     	     	    	          
           
                
                     
                               
         
           
                    
           
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
        lui $20,0x0040   # saving the address of caller in r20
        ori $20,$ra,0
        
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
               jr $20     # return to caller




 # implementationo of isPalindrome function
strisPalindrome:
         lui $20,0x0040   # saving the address of caller in r20
         ori $20,$ra,0
         
         jal str_len    # calling str_len func
         
         addiu $21,$v0,0    # set r21 to return value of  str_len
          
         addiu $8,$a0,0  # start address
         addiu $9,$21,-1  # length of strign
         addu $10,$9,$8  #end address of string
         
         loop3:
             lb $11,0($8)   # load first character  in r11
             lb $12,0($10)   # load last character in r12
             bne $11,$12,return_false   # return false if r11!=r12
             addiu $8,$8,1    # r8++
             addiu $10,$10,-1  #r10--
             beq $8,$10,return_true   # return true if r8==r10, that means we have check all the pairs
             j loop3      # else continue loop
         return_false:
               addiu $v0,$0,0  # return false
               jr $20      # go back to caller
         return_true:
               addiu $v0,$0,1   # return true
               jr $20           # go back to caller       




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