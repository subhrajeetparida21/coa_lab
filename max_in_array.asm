.data 
arr: .word 4,9,2,15,7 
 
.text 
.globl main 
main: 
    la $t0, arr 
    lw $t2, 0($t0)     # max 
    li $t1, 1 
    addi $t0, $t0, 4 
 
loop8: 
    bge $t1, 5, end8 
    lw $t3, 0($t0) 
    ble $t3, $t2, skip8 
    move $t2, $t3 
 
skip8: 
    addi $t0, $t0, 4 
    addi $t1, $t1, 1 
    j loop8 
 
end8: 
    move $a0, $t2 
    li $v0, 1 
    syscall 
    li $v0, 10 
    syscall