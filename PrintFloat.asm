.data
fnum: .float 3.14

.text
li $v0, 2
lwc1 $f12, fnum
syscall

li $v0,10
syscall