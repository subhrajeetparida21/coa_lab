.data
m1: .asciiz "Enter first number: "
m2: .asciiz "Enter second number: "
res: .asciiz "Difference: "
err: .asciiz "First number must be greater."

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

ble $t0,$t1,ERROR

sub $t2,$t0,$t1
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
