.data
msg: .asciiz "Hello World\n"

.text
li $v1, 4
la $a0, msg
syscall

li $v0, 10
syscall