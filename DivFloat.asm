.data
x: .float 10.0
y: .float 2.0

.text
lwc1 $f0, x
lwc1 $f1, y
div.s $f12, $f0, $f1

li $v0, 2
syscall

li $v0, 10
syscall
