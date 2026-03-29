.data
msg: .asciiz "Enter n value : "

.text
.globl main

main:
  li $v0,4
  la $a0,msg
  syscall
  
  li $v0,5
  syscall
  move $a0,$v0     # pass n in $a0
  
  jal sum_to_n
  
  move $a0,$v0
  li $v0,1
  syscall
  
  li $v0,10
  syscall
  

sum_to_n:
  move $t0,$a0     # n ? $t0
  li $t1,0         # sum = 0
  li $t2,1         # i = 1
  
loop:
  bgt $t2,$t0,end_loop
  add $t1,$t1,$t2
  addi $t2,$t2,1
  j loop
  
end_loop:
  move $v0,$t1
  jr $ra