.data 
arr: .word 5,12,8,20,15 
 
.text 
.globl main 
main: 
    la $t0, arr 
    li $t1, 0 
    li $t2, 0          # count 
 
loop: 
    bge $t1, 5, end
    lw $t3, 0($t0) 
    ble $t3, 10, skip 
    addi $t2, $t2, 1 
 
skip: 
    addi $t0, $t0, 4 
    addi $t1, $t1, 1 
    j loop 
 
end: 
    move $a0, $t2 
    li $v0, 1 
    syscall 
    li $v0, 10 
    syscall 