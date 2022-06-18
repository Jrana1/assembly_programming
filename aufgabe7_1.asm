	.data
	     msg1: .asciiz "Type a string>"
	     msg2: .asciiz "Type a char>"
	     msg3: .asciiz " occurence(s)\n"
	     msg4: .asciiz "Type '0' for ending the Programm otherwise '1'\n"
	     str: .space 100
	.text
	addiu $9,$zero,1     
 	menu:
 	   #String ausgeben
 	    la $a0,msg1
 	    li $v0,4
 	    syscall
 	   #String einlesen
 	    la $a0,str
 	    li $a1,100
 	    li $v0,8
 	    syscall
 	    #String ausgeben
 	    la $a0,msg2
 	    li $v0,4
 	    syscall
 	   #Zeichen einlesen
 	    #la $a0,char
 	    li $v0,12
 	    syscall
 	    move $a1,$v0  # saving input character in a1
 	    la $a0,str
 	    jal find_occurance
 	    move $11,$v0  # result in r11
 	    li $a0,'\n'
 	    li $v0,11
 	    syscall
 	    move $a0,$11
 	    li $v0,1
 	    syscall
 	    #String ausgeben
 	    la $a0,msg3
 	    li $v0,4
 	    syscall
 	    #String ausgeben
 	    la $a0,msg4
 	    li $v0,4
 	    syscall
 	    li $v0,5
 	    syscall
 	    beq $v0,$9,menu
 	    end:
 	       beq $0,$0,end
 	 
 find_occurance:    
              li $12,0 # count variable init with 0
              loop:
                  lbu $11,0($a0)  # load character in r11
                  beq $11,$0,return     # when end of string return back
                  addiu $a0,$a0,1       # increment address
                  bne $11,$a1,loop      # if both the characters are not same continue
                  addiu $12,$12,1       # otherwise count++
                  j loop
              return:
                   move $v0,$12     # save count i v0
                   jr $ra          # return to caller
                  
 	    
 	     
 	    
	      
	        