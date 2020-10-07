.data
prompt: .asciiz "Ingrese el numero del cual desea hallar el factorial: "

.text
.globl main
main:
  li	$v0, 4	    		# syscall string_code				
  la 	$a0, prompt   		
  syscall		        # puts(prompt)
  li 	$v0, 5
  syscall		        # scanf("%i", &num)				
  move 	$a0, $v0    	        # Se mueve el numero ingresado a $a0 	
  jal 	factorial	     	# factorial(num)
  move  $a0, $v0
  li    $v0, 1
  syscall
				# exit
  li 	$v0, 10
  syscall

factorial:
				# Prologo
  addi  $sp, $sp, -4 		# Se reserva lugar para a0
  sw 	$a0, 0($sp)
				# Fin prologo
  li 	$s0, 1	       		# result
loop:
  beq 	$a0, $zero, return 	# while(num != 0){
  mul 	$s0, $s0, $a0	 	# result *= num;
  subi 	$a0, $a0, 1		# num--;
  j 	loop			# }

return:
  move $v0, $s0
				# Epilogo
  lw   $a0, 0($sp)
  addi $sp, $sp, 4
  				# Fin epilogo
  jr   $ra 
