.data
msg1: .asciiz "Enter dividend : "
msg2: .asciiz "Enter the divisor : "
res: .asciiz "RESULT : "

.text
.globl main
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

div $t0,$t1
mflo $t2

li $v0, 4
la $a0, res
syscall

li $v0, 1
move $a0,$t2
syscall

li $v0,10
syscall

	
	  	