.data
arr: .space 400
msg1: .asciiz "Enter size: "
msg2: .asciiz "Enter element: "

.text 
.globl main

main:
  
  li $v0,4
  la $a0,msg1
  syscall
  
  li $v0,5
  syscall
  move $t4,$v0        

  
  la $t0,arr          
  li $t1,0            

input_loop:
  bge $t1,$t4,sum_start
  
  li $v0,4
  la $a0,msg2
  syscall
  
  li $v0,5
  syscall
  sw $v0,0($t0)
  
  addi $t0,$t0,4
  addi $t1,$t1,1
  j input_loop


sum_start:
  la $t0,arr          
  li $t1,0           
  li $t2,0            

sum_loop:
  bge $t1,$t4,end
  
  lw $t3,0($t0)
  add $t2,$t2,$t3
  
  addi $t1,$t1,1
  addi $t0,$t0,4
  j sum_loop

end:
  move $a0,$t2
  li $v0,1
  syscall
  
  li $v0,10
  syscall