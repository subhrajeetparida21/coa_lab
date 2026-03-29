.data 
arr: .space 400
msg: .asciiz "Enter the size of array :"
space: .asciiz " "

.text
.globl main

main:
   li $v0,4
   la $a0,msg
   syscall
   
   li $v0,5
   syscall
   move $t3,$v0
   
   la $t0,arr
   li $t1,0

loop1:
   bge $t1,$t3,prepare_print
   
   li $v0,5
   syscall
   sw $v0,0($t0)
   
   addi $t0,$t0,4
   addi $t1,$t1,1
   j loop1

prepare_print:
   la $t0,arr
   li $t1,0

loop2:
   bge $t1,$t3,end
   
   lw $a0,0($t0)
   li $v0,1
   syscall
   
 
   li $v0,4
   la $a0,space
   syscall
   
   addi $t0,$t0,4
   addi $t1,$t1,1
   j loop2

end:
   li $v0,10
   syscall