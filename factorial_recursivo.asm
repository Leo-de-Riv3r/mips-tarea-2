.data
prompt: .asciiz "Ingrese un numero: "

.text
.globl main
main:
li $v0, 4
la $a0, prompt
syscall		# puts(prompt);
li $v0, 5
syscall		# scanf("%i", &num);
move $a0, $v0  
jal factorial	# factorial(num)
move $a0, $v0
li $v0, 1
syscall
li $v0, 10 	# syscall exit_code
syscall

factorial:
	         	# Prologo
addi $sp, $sp, -12	# Se reservan 3 lugares
sw $a0, 0($sp)		# Guardo $a0
sw $t2, 4($sp)		# Guardo $t2
sw $ra, 8($sp)		# Guardo $ra
			# Fin prologo
			
			# Casos base
li $t0, 1
beq $a0, $t0, f0	
beq $a0, $zero, f0	# if (num == 1 || num == 0) return num;

			# No caso base
move $t2, $a0
addi $a0, $a0, -1	# num--;
jal factorial		# factorial(n-1)
move $t1, $v0		# Se guarda el resultado de fact(n-1) a $t1
mul $v0, $t1, $t2	# factorial(n-1)*n
j return

f0:
li $v0, 1
j return

return:
			# epilogo
lw $a0, 0($sp)
lw $t2, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12	
			# fin epilogo
jr $ra
			
