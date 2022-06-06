	.data
	     str1:.asciiz "aCb"   
	.text
	   lui $a0,0x1001
	   jal toLower
end_of_programm:
           beq $0,$0,end_of_programm
toLower: 
       addiu $17,$zero,0x40  # from A
       addiu $13,$zero,0x5b  # to Z
       addiu $10,$a0,0       #taking the address of str1
       addiu $20,$zero,1     #init r20 with 1
       sll $20,$20,5         #shifting r20 five times left to build 
       
       loop:       
           lbu $12,0($10)
           beq $12,$0,return
           addiu $10,$10,1
           slt $15,$17,$12 # set r15=1 if r12 <r13
           slt $16,$12,$13 #set r16=1 if r10<12
           bne $15,$16,loop
           #addiu $12,$12,32
           or $12,$12,$20 #using bit masking
           addi $11,$10,-1
           sb $12,0($11)
           j loop
           
       return:
           jr $ra       
       
	  
          
        
      
      
      	  

