.data
msg1: .asciiz "Enter first Number : "
msg2: .asciiz "Enter second Number : "

.text
.globl main

main:
  # First input
  li $v0,4
  la $a0,msg1
  syscall
  
  li $v0,5
  syscall
  move $t0,$v0
  
  # Second input
  li $v0,4
  la $a0,msg2
  syscall
  
  li $v0,5
  syscall
  move $t1,$v0
  
  # Call function
  jal add_numbers
  
  # Print result
  move $a0,$v0   # result ? $a0
  li $v0,1
  syscall
  
  # Exit
  li $v0,10
  syscall
  
add_numbers:
  add $v0,$t0,$t1
  jr $ra