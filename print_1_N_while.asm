.data
msg: .asciiz "Enter n : "
space: .asciiz " "

.text
.global main
 main:
  li $t0,1
  
  li $v0,4
  la $a0,msg
  syscall
  
  li $v0,5
  syscall
  move $t1,$v0
  
  
  loop:
   bgt $t0,$t1,end
   move $a0,$t0
   li $v0,1
   syscall
   li $v0,4
   la $a0,space
   syscall
   addi $t0,$t0,1
   j loop
   
  end:
   li $v0,10
   syscall
  
  