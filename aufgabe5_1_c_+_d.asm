# Calculating ggT(a,b) using function
.text
 main:
	addiu $a0,$0,25
	addiu $a1,$0,35
	jal ggT  # calling ggT(25,35)
	addiu $10,$v0,0 # saving return value of ggT(25,34) in r5
	
	addiu $a0,$0,210
	addiu $a1,$0,28
	jal ggT #g calling gT(210,28)
	addiu $6,$v0,0 # saving return value of ggT(210,28) in r6
	
	addiu $a0,$0,49
	addiu $a1,$0,42
	jal ggT # calling ggT(49,42)
	addiu $7,$v0,0 # saving return value of ggT(49,42) in r7
	
	addiu $a0,$0,17
	addiu $a1,$0,3
	jal ggT #ggT(17,3)
	addiu $8,$v0,0 # saving return value of ggT(17,3) in r7
	
	addiu $a0,$0,17
	addiu $a1,$0,51
	jal ggT #ggT(17,51)
	addiu $9,$v0,0 # saving return value of ggT(17,51) in r9
		
end_of_programm:
        beq $0,$0,end_of_programm #end of the main programm
	
ggT:   #impementation of func ggT
      beq $a0,$0,return_to_caller  #if a0 =0 =>return to caller
      beq $a1,$0,save_result       #if a1=0 => save resutl in v0
      slt $3,$a0,$a1               #set r3 =1 if a0<a1
      beq $3,$1,decrease_b         #jump to deccrease_b if a0>a1
      bne $3,$1,decrease_a         #jump to deccrease_a if a0<a1
decrease_b:
      subu $a0,$a0,$a1  # set a0=a0-a1
      j ggT #jump to ggT again
decrease_a:
      subu $a1,$a1,$a0  #s set a1=a1-a0
      j ggT  # jump to ggT again
save_result:
     addiu $v0,$a1,0
return_to_caller:
     addiu $v0,$a1,0  #assign ggT in v0 
     jr $ra          #return to caller
      
      

