.data
dnum: .double 12.34

.text
li $v0,3
ldc1 $f12, dnum
syscall

li $v0 10
syscall