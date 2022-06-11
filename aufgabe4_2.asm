


	.text
	
	addiu $8,$zero,0 # set r8 = 0
	addiu $9,$zero,0xb # set r9=11
	addiu $10,$zero,0x1000 # set r10=0x100
	addi $11,$zero,-1      # set r11=-1
	addi $12,$zero,-0x8000  # set r12=-0x8000
	lui $13,0x0000           # set the first 16 bits of r13 to 0's
	ori $13,$zero,0x8000       # set the second 16 bits of r13 to 0x8000
	lui $14,0xffff           # set the first 16 bits of r13 to 0xffff   # set the second 16 bits of r13 to 0x0000
	lui $15,0x7fff           # set the first 16 bits of r13 to 0x7fff
	ori $15,$15,0xffff     # set the second 16 bits of r13 to 0xffff
	addiu $24,$zero,5322   #r24=5322
	addiu $25,$zero,75      #r25=75
	
	add $2,$10,$9   #r2 = 0x1000+ 0xb
	sub $3,$10,$9   #r3 = 0x1000-0xb
	nor $9,$9,$zero  # r9= complement of r9
	add $4,$9,$10    #r4=r9+r10
	addi $4,$4,1      #r4=r4+1
	sll $5,$13,5       # shift r13 left 5 times logically
	sra $6,$13,5        # shift r13 right 5 times arithmetic
	sra $7,$12,5        # shift r12 right 5 times arithmetic
	srl $16,$12,5         # shift r12 right 5 times logically
	srav $17,$13,$9        # shift r13 right 11 times arithmetic
	div $24,$25       # calculate r24 / r25
	mflo $18         # saving the qutient in r18
	mfhi $19         #saving the rest in r19
	addi $20,$15,1   # add with overflow. if overflow occures r20 is not modified
	addiu $21,$15,1  # add without overflow. if overflow occures r20 is still modified
	clo $22,$11      #count the number of leading ones of r11 and save it in r22
	clo $23,$14
	
	