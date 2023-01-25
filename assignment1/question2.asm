.data

statement1: .asciiz "Enter n value (2 <= n <= 100): "
statement2: .asciiz "Enter k value (1 <= k <= 100): "
statement3: .asciiz "Enter value in n size: "
statement4: .asciiz "Result: "


newLine:    .asciiz "\n"
numArr:     .word 100 # max array size
iterator1:  .word 1
iterator2:  .word 1
count:      .word 0   # counts divisible numbers

.text
.globl main

main:
	# load count and iterators
	lw $t0, iterator1
	lw $t1, iterator2
	lw $t2, count

	# print statement1
	li $v0, 4
	la $a0, statement1
	syscall
	
	# get and store array size from user
	li $v0, 5
	syscall
	add $s0, $v0, $zero
	
	#print statement2
	li $v0, 4
	la $a0, statement2
	syscall
	
	# get k value from user
	li $v0, 5
	syscall 
	add $s1, $v0, $zero
	
	# print statement3
	li $v0, 4 		
	la $a0, statement3
	syscall
	
	# initialize array index
	addi $t3, $zero, 0
	
while:
	# if iterator number bigger than size, pass exit function
	bgt $t0, $s0, exit 
	
	# get values from user
	li $v0, 5
	syscall
	add $s2, $v0, $zero
	
	# store values to array
	sw $s2, numArr($t3)
	
	# increase index in every turn
	addi $t3, $t3, 4 
	
	# increase iterator in every turn
	addi $t0, $t0, 1
	
	# return while
	j while
	
exit: 
	# initialize iterator to 1
	addi $t0, $zero, 0
	
	# clear $t3 to 0
	addi $t3, $zero, 0
	addi $t4, $zero, 0
	
loop1:
	# if iterator number and size equal, pass break1 function
	beq $t0, $s0, exit2
	
	# increase iterator in every turn
	addi $t0, $t0, 1 
	add $t1, $t0, $zero
	
	lw $s2, numArr($t3)
	
	add $t4, $t3, 4
	addi $t3, $t3, 4
	
	j loop2
					
loop2: 
	beq $t1, $s0, loop1
	
	lw $s3, numArr($t4)
	
	add $s4, $s2, $s3 # add two numbers
	addi $t4, $t4, 4 # increase index in every turn
	
	div $s4, $s1 # divide sum with k number
	mfhi $t5 # holds remainder
	addi $t1, $t1, 1 
	
	beq $t5, 0, numCount
	
	j loop2
	
numCount:  # function that counts and holds divisible number
	addi $t2, $t2, 1
	j loop2
	
exit2:	
	# print statement4
	li $v0, 4
	la $a0, statement4
	syscall
	
	# print result
	li $v0, 1
	add $a0, $t2, $zero
	syscall				
	 	 
	# terminate program
	li $v0, 10
	syscall 	 
	   
	
	
    
