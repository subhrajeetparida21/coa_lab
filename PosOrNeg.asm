.data
msg1: .asciiz "Enter a number : "
pos: .asciiz "Positive "
neg: .asciiz "Negative "

.text
.globl main
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

bltz $t0,NEG

li $v0,4
la $a0,pos
syscall
j EXIT

NEG:
li $v0,4
la $a0,neg
syscall

EXIT:
li $v0,10
syscall
