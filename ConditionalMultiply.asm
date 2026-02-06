.data
m1: .asciiz "Enter first number: "
m2: .asciiz "Enter second number: "
big: .asciiz "Result > 100"
small: .asciiz "Result <= 100"

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

mul $t2,$t0,$t1
li $t3,100
bgt $t2,$t3,BIG

li $v0,4
la $a0,small
syscall
j END

BIG:
li $v0,4
la $a0,big
syscall

END:
li $v0,10
syscall
