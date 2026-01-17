.data
a: .word 30
b: .word 10

.text
lw $t0, a
lw $t1, b
sub $a0, $t0, $t1

li $v0, 1
syscall

li $v0, 10
syscall
