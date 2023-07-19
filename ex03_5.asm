.data
	alfabito : .asciz "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"    # ta ebala se ena string giati otan ta ebaza se duo moy ekane automata aligne
	#ariumoi : .asciz "0123456789"
	.align 2
	str_xyz: .asciz "xyz"
# I	
	# 1) If we select the acii interpetetion of the data memory it apears to be writen backwoeds in the 
	# human eye thats because is uses the little-endia. 
	# 2)If we interpet deciman then the a = 97 the b = 98 the c = 99 all the way to z wich is 122.
	
	#3)
	
	# 	char				ascii(hex)			ascii(des)
	
	#	a				61	                          1100001
	#	b                               62                                1100010
	#	c                               63                                1100011
	#	.....                          .....                             .........
	#	z                               7A                                1111010
	
	#	A                               41                                1000001
	#	B                               42                                1000010
	#	C                               43                                1000011
	#	......                          ....                              .........
	#	Z                               5A                                1011010
	
	#	0                               0                                    0
	#       1                               1                                    1
	#	2                               2                                   10
	#       ......                         ....                               ......                     
	#	9                               9                                   1001
	
        # The capitals starst wit A = 65,
	# B = 66 ...... Z = 90, lastly the numbers 0 = 48, 1 = 49,........ 9 = 57. 
	#So in the groups the next one is previous + 1
	#When we give this number to be printed as 
	# chars, the according string will be printed
	
	# 4) For the xyz string the x = 120(decimal) the y = 121 and z = 122.
	
# II	
	# 1) If we use little endian the string "xyz" is gona be stored in the memory as z y x 
	# as the acording ascii values in binary wich ara z = 01111010 for y = 01111001 and x = 01111000
	# as we said they will be stored next to each other backwords (little-endian) and each char occupy 1 
	# byte. So if we write is as an int wich has 4 byres the ls byte will be the binary ascii x then the 
	# 2nd byte the binary ascii of y and the 3rd byte the binary ascii of z the ms byte will be 00000000
	# So by printing those four bytes as int we will print 011110100111100101111000(binary)
	# 4194304+2097152+1046576+524288+131072+16384+8192+4096+2048+256+64+32+16+8= 8026488(decimal)
	
	#2) The same string in a big endian system would have been 
	# 1073741824+5368+70+912+268435456+134217728+4194304+2097152+1048576+524288+65536+16384+8192+4096+2048+512=
	# = 2021227008

# III

	# Now we will try our hypothesis with the following simple program that will print as an int the 
	# str_xyz
	
.text
    main:
	addi x17, x0, 4
	addi x17, x0, 1
	la x11, str_xyz
	lw x10, 0(x11)
	ecall
	 
	# The program prints 8026488(decimal) so our hypothesis is correct.
	
	
    
     	
