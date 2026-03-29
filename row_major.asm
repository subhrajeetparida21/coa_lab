.data
matrix: .space 64

.text
.globl main
main:
la $s0, matrix
li $t0, 0
li $t4, 4

outer_loop:
bge $t0, 4, exit
li $t1, 0

inner_loop:
bge $t1, 4, next_row

li $v0, 5
syscall
move $t7, $v0

mul $t2, $t0, $t4
add $t2, $t2, $t1
sll $t2, $t2, 2
add $t3, $s0, $t2

sw $t7, 0($t3)

addi $t1, $t1, 1
j inner_loop

next_row:
addi $t0, $t0, 1
j outer_loop

exit:
li $v0, 10
syscall
