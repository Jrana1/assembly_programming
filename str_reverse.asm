	.data
	     text: .asciiz "rana"
	.text
	     lui $a0,0x1001  
	     jal str_len
	     addiu $8,$v0,0
	     addiu $a1,$8,0
	     jal make_reverse
end_of_programm:
       beq $0,$0,end_of_programm


make_reverse:
        addiu $8,$a0,0
        addiu $14,$a1,0
        ori $15,$zero,2
        div $14,$15
        mflo $14
        addu $14,$a0,$14
        addiu $9,$a1,-1
        addu $10,$8,$9
        loop1:
            lbu $11,0($8)
            lbu $12,0($10)
            xor $11,$11,$12
            xor $12,$11,$12
            xor $11,$11,$12
            sb $11,0($8)
            sb $12,0($10)
            beq $14,$10,return1
            addiu $8,$8,1
            addiu $10,$10,-1
            j loop1
            return1:
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