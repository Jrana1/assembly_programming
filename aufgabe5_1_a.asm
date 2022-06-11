.text
  #implementint ggT(a,b) 
	  addiu $4,$0,101  # r4 = 30
	  addiu $5,$0,28  #r5 = 25
	  addiu $2,$5,0   #r2 = r5
loop:     
          addiu $2,$5,0   #r2 = r5
          beq $4,$0,end_of_loop #if r4=0=>result has been found
          beq $5,$0,result_found # if r4=0=>result has been found-
          slt $8,$4,$5           # if r4 is less then r5 then r8 = 1
          bne $8,$0,find_a_minus_b  #if a>b then find a=a-b
          subu $4,$4,$5     #find b=b-a
          j loop            # continue loop
          

find_a_minus_b:
          subu  $5,$5,$4  #r5=r5-r5
          j loop   # continue loop
result_found:
         addiu $2,$4,0  #save resutl in r2
end_of_loop:
         beq $0,$0,end_of_loop # result already found. programms ends
          
         

