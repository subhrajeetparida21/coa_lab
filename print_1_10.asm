.data
space: .asciiz "\n"

.text 
.globl main 
main: 
li $t0, 1          
# i = 1 
loop1: 
    bgt $t0, 10, end1 
    move $a0, $t0 
    li $v0, 1 
    syscall 
    li $v0,4
    la $a0,space
    syscall
    addi $t0, $t0, 1 
    j loop1 
 
end1: 
    li $v0, 10 
    syscall 