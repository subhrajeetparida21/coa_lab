.data
msg1: .asciiz "Enter a number : "
even: .asciiz "Even"
odd: .asciiz "Odd"

.text
.globl main
main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

andi $t0, $t1, 1
beq $t0, $zero, EVEN

li $v0, 4
la $a0, odd
syscall
j END

EVEN:
li $v0, 4
la $a0, even
syscall

END:
li $v0, 10
syscall
