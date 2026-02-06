.data
m1: .asciiz "Enter first number: "
m2: .asciiz "Enter second number: "
eq: .asciiz "Equal"
gt: .asciiz "First is Greater"
lt: .asciiz "First is Smaller"

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

beq $t0,$t1,EQUAL
bgt $t0,$t1,GREATER

li $v0,4
la $a0,lt
syscall
j END

EQUAL:
li $v0,4
la $a0,eq
syscall
j END

GREATER:
li $v0,4
la $a0,gt
syscall

END:
li $v0,10
syscall
