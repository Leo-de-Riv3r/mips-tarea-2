# MODIFICAR ESTE PROGRAMA PARA QUE IMPLEMENTE UNA FUNCION
.data
prompt: .asciiz "Ingrese el numero del cual desea hallar el factorial: "  
new_line: .asciiz "\n"
msg: .asciiz "El factorial es "

.text
.globl main
main:
	li	$v0, 4           # print_string code
	la	$a0, prompt  
	syscall # puts(prompt);
	li	$v0, 5
	syscall # scanf("%i", &num);
	move 	$t0, $v0         # int num;
	li      $t1, 1           # result = 1;
	li	$t2, 1 
loop:   
        mul     $t1, $t1, $t0    # result *= num;
        addi    $t0, $t0, -1     # num--;
        bgt     $t0, $t2, loop   # if (num > 1) goto loop;
		
exit:
	li      $v0, 4
	la	$a0, new_line
	syscall
	li	$v0, 4
	la	$a0, msg 
	syscall
	li	$v0, 1
	move	$a0, $t1
	syscall                   # printf("%i", result);
	li	$v0, 10
	syscall 
