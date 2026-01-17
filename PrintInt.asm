.data
number: .word 35

.text
li $v0, 1
lw $a0, number
syscall

li $v0, 10
syscall
