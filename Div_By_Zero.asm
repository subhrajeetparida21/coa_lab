.data
m1: .asciiz "Enter dividend: "
m2: .asciiz "Enter divisor: "
err: .asciiz "Cannot divide by zero"
res: .asciiz "Quotient: "

.text
.globl main
main:
li $v0,4
la $a0,m1
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,m2
syscall
li $v0,5
syscall
move $t1,$v0

beq $t1,$zero,ERROR

div $t0,$t1
mflo $t2
li $v0,4
la $a0,res
syscall
li $v0,1
move $a0,$t2
syscall
j END

ERROR:
li $v0,4
la $a0,err
syscall

END:
li $v0,10
syscall
