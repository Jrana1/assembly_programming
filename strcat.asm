	.data
	     str1:.asciiz "Lager"
	     str2:.asciiz "Regal"
	     str3: .space 11
	           .byte 0xff
	           .byte 0xff
	 .text
	     lui $a0,0x1001  # address of str1 in a0
	     addiu $a1,$a0,6 #address of str2in a1
	     addiu $a2,$a1,6 #address of str2in a2
	     jal strcat    # calling strcat function
end_of_programm:
              beq $0,$0,end_of_programm	     
strcat: 
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
                           j loop5
            skip_for_null_at_str1:
                       addiu $12,$12,1
                       j loop5        
            return_back:
                         jr $ra
	    	     
	     
	    	     	     
	     	     	     	    	     