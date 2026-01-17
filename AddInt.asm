.data
a: .word 10
b: .word 20

.text
lw $t0, a
lw $t1, b
add $a0, $t0, $t1

li $v0, 1
syscall