.data
m1: .asciiz "Enter first number: "
m2: .asciiz "Enter second number: "
res: .asciiz "Sum: "
err: .asciiz "Both numbers must be positive."

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

bltz $t0,ERROR
bltz $t1,ERROR

add $t2,$t0,$t1
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
