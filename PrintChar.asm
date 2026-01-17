.data
ch: .byte 'A'

.text
li $v0, 11
lb $a0, ch
syscall

li $v0, 10
syscall