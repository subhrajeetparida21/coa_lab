.data
x: .float 2.5
y: .float 1.5

.text
lwc1 $f0, x
lwc1 $f1, y
add.s $f12, $f0, $f1

li $v0, 2
syscall

li $v0, 10
syscall
