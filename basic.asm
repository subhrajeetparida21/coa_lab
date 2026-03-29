.data 
prompt: .asciiz "Enter an integer: " 
print:  .asciiz "You entered: " 
.text 
# Print prompt 
li $v0, 4 
la $a0, prompt 
syscall 
# Read integer 
li $v0, 5 
syscall 
move $t0, $v0 
# Print message 
li $v0, 4 
la $a0, print 
syscall 
# Print integer 
li $v0, 1 
move $a0, $t0 
syscall 
# Exit 
li $v0, 10 
syscall 