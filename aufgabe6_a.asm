    
	.data
	     text: .asciiz "abc"
	.text
	     lui $a0,0x1001  
	     jal strturnaround
end_of_programm:
       beq $0,$0,end_of_programm


strturnaround:       
        lui $20,0x0040
        ori $20,$ra,0
        
        jal str_len
	addiu $17,$v0,0  # r17=len
        addiu $8,$a0,0  # get start address of str
        ori $14,$0,2
        div $17,$14
        mflo $14
        addu $14,$8,$14
        addiu $10,$17,-1
        addu $10,$8,$10
       
       
        loop1:
            lbu $11,0($8)  # r8 is the start address of str, r11 has last character
            lbu $12,0($10)  # r10 is len -1, r12 has last character
            xor $11,$11,$12
            xor $12,$11,$12
            xor $11,$11,$12
            sb $11,0($8)
            sb $12,0($10)
            beq $14,$10,return1   # r14=len/2, r10= len -1
            addiu $8,$8,1         # r8++
            addiu $10,$10,-1      # r10--
            j loop1
            return1:
               jr $20


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