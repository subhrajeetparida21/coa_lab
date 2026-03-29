.data 
arr1: .space 400
arr2: .space 400

msg1: .asciiz "Enter size: "
msg2: .asciiz "Enter element: "
msg3: .asciiz "Copied array: "
space: .asciiz " "

.text 
.globl main 

main: 
    # ? Read size
    li $v0,4
    la $a0,msg1
    syscall
    
    li $v0,5
    syscall
    move $t4,$v0        # n

    # ? Input arr1
    la $t0, arr1
    li $t2, 0

input_loop:
    bge $t2, $t4, copy_start
    
    li $v0,4
    la $a0,msg2
    syscall
    
    li $v0,5
    syscall
    sw $v0, 0($t0)
    
    addi $t0, $t0, 4
    addi $t2, $t2, 1
    j input_loop


# ? Copy arr1 ? arr2
copy_start:
    la $t0, arr1
    la $t1, arr2
    li $t2, 0

copy_loop:
    bge $t2, $t4, print_start
    
    lw $t3, 0($t0)
    sw $t3, 0($t1)
    
    addi $t0, $t0, 4
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j copy_loop


# ? Print arr2
print_start:
    li $v0,4
    la $a0,msg3
    syscall
    
    la $t1, arr2
    li $t2, 0

print_loop:
    bge $t2, $t4, end
    
    lw $a0, 0($t1)
    li $v0,1
    syscall
    
    # print space
    li $v0,4
    la $a0,space
    syscall
    
    addi $t1, $t1, 4
    addi $t2, $t2, 1
    j print_loop


end:
    li $v0,10
    syscall