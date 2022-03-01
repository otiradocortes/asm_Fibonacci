.data
prompt1: .asciiz "\nEnter n:“
.text
li $v0,4
la $a0, prompt1 	# syscall to input n, where n is the nth term of Fibonacci sequence
syscall

li $v0,5 		# read a value for n from the user
syscall
move $t5,$v0 		# store n in $t5
beqz $t5,done

#Beginning code for Fibonacci
li $a0,1 		# initialize counter variable
move $v0, $a0
li $t0, 0
fib:
beq $a0, $t5, done 	# when loop is run n number of times, exit from loop
add $t1, $t0, $v0 	# fib(n)=fib(n-1) +fib(n-2)
move $t0, $v0
move $v0, $t1
addi $a0, $a0, 1 	# increment loop counter
bne $a0, 1, fib

done:
move $a0,$v0 		# print the nth fibonacci number
li $v0,1
syscall