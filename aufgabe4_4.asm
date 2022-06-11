.data
   
   	 int: .byte 0xa0 #store 8 bits in data section
  	 short_int: .half 0xb1b0    #store half-word=16 bits in data section
   	 long_int: .word 0xc3c2c1c0  #store full word=32 bits in data section
   	 msg:.asciiz "Das Ende\n"    #store string with null terminator in data section