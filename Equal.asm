.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
eq:   .asciiz "Equal"
neq:  .asciiz "Not Equal"

.text
.globl main
main:
li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg2
syscall
li $v0,5
syscall
move $t1,$v0

beq $t0,$t1,EQUAL

li $v0,4
la $a0,neq
syscall
j END

EQUAL:
li $v0,4
la $a0,eq
syscall

END:
li $v0,10
syscall
