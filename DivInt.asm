.data
a: .word 5
b: .word 4

.text
lw $t0, a
lw $t1, b
mul $a0, $t0, $t1

li $v0, 1
syscall

li $v0, 10
syscall
