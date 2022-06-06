	.data
	     str2: .asciiz "12422"
	.text
	lui $a0,0x1001
	jal str_len  
	addiu $a1,$v0,0
	jal isPalindrome 
	addiu $8,$v0,0 
end_of_programm:
        beq $0,$0,end_of_programm
        
isPalindrome:
         addiu $8,$a0,0  # start address
         addiu $9,$a1,-1  # length of strign
         addu $10,$9,$8  #end address of string
         
         loop1:
             lb $11,0($8)
             lb $12,0($10)
             bne $11,$12,return_false
             addiu $8,$8,1
             addiu $10,$10,-1
             beq $8,$10,return_true
             j loop1
         return_false:
               addiu $v0,$0,0
               jr $ra
         return_true:
               addiu $v0,$0,1
               jr $ra                                        
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