.data
x: .float 3.0
y: .float 4.0

.text
lwc1 $f0, x
lwc1 $f1, y
mul.s $f12, $f0, $f1

li $v0, 2
syscall

li $v0, 10
syscall
