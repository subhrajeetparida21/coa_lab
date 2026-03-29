.data 
arr:    .space 400        # space for max 100 integers (100 × 4 bytes) 
msg1:   .asciiz "Enter array size: " 
msg2:   .asciiz "Enter element: " 
newline:.asciiz "\n" 
 
.text 
.globl main 
 
main: 
    # Ask for array size 
    li $v0, 4 
    la $a0, msg1 
    syscall 
 
    li $v0, 5             # read integer 
    syscall 
    move $t0, $v0         # t0 = n (array size) 
 
    la $t1, arr           # base address of array 
    li $t2, 0             # i = 0 
 
input_loop: 
    bge $t2, $t0, exit    # while (i < n) 
 
    # Prompt for element 
    li $v0, 4 
    la $a0, msg2 
    syscall 
 
    li $v0, 5             # read element 
    syscall 
 
    sw $v0, 0($t1)        # arr[i] = input 
 
    addi $t1, $t1, 4      # move to next index 
    addi $t2, $t2, 1      # i++ 
 
    j input_loop 
 
exit: 
    li $v0, 10            # exit program 
    syscall