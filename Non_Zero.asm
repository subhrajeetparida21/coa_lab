.data
msg: .asciiz "Enter number: "
zero: .asciiz "Zero"
nonz: .asciiz "Non-Zero"

.text
.globl main
main:
li $v0,4
la $a0,msg
syscall
li $v0,5
syscall
move $t0,$v0

beq $t0,$zero,ZERO

li $v0,4
la $a0,nonz
syscall
j END

ZERO:
li $v0,4
la $a0,zero
syscall

END:
li $v0,10
syscall
