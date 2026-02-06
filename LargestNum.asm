.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
res:  .asciiz "Largest: "

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

bgt $t0,$t1,FIRST
move $t2,$t1
j PRINT

FIRST:
move $t2,$t0

PRINT:
li $v0,4
la $a0,res
syscall
li $v0,1
move $a0,$t2
syscall

li $v0,10
syscall
