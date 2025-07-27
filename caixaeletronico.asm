.data
	msg: .asciiz	"\nDigite o valor a sacar: R$ "
	n100: .asciiz	"\nNúmero de cédulas recebidas de R$100,00: \n"
	c100:	.word	0
	ncd:	.asciiz "\nConfigure o número de cédulas disponíveis no caixa:"
	error:	.asciiz	"Saldo indisponível.\n"
	saldo: 	.asciiz "\nSaldo disponível: R$"
	fim:	.asciiz "\nContinuar sacando? (0 para continuar, aperte qualquer número para sair)"
	
.text
.globl main
main:
	lw $t3, c100 #valor de cédulas do caixa
		#mensagem de configuração de cédulas
	li $v0, 4	
	la $a0, ncd
	syscall
		#recebimento de número de cédulas
	li $v0, 5
	syscall
		#armazena número de cédulas para $t3
	move $t3, $v0
inicio:
    			# mensagem pra receber o valor
	li $v0, 4
	la $a0, msg
	syscall

   			 # Lê o valor digitado
	li $v0, 5
	syscall
    
	move $t0, $v0      	# $t0 = valor digitado

    				# Calcula a quantidade de cédulas de 100
	li $t1, 100
	div $t0, $t1
	mflo $t7	# $t7 numero de cedulas

	sub $t5, $t3, $t7 	# sub de cedulas
	bgez $t5, sucesso	# comparação se maior ou igual a 0	
	bltz $t5, erro		# comparação se menor que zero
	


erro:
	li $v0, 4	
	la $a0, error		# carrega mensagem de erro
	syscall
		# volta para o inicio do saque
	li $v0, 4
	la $a0, fim
	syscall
	
	li $v0, 5
	syscall
	move $t6, $v0
	beqz $t6, inicio
	
	li $v0, 10
	syscall
	
sucesso:
	   				 
	li $v0, 4		# mensagem das notas
	la $a0, n100
	syscall

    				# Exibe quantidade
	li $v0, 1
	move $a0, $t7
	syscall
				#subtração das cédulas do caixa pelas dadas
	sub $t3, $t3, $t7
	li $t4, 100		#carrega 100 no $t4
	mul $t4, $t3, $t4	#multiplica o número de cédulas pelo $t4 para dar o valor em reais
			
				#mostra saldo disponível
	li $v0, 4		
	la $a0, saldo
	syscall
	
				#mostra o saldo disponível (R$) após o saque
	li $v0, 1
	move $a0, $t4
	syscall

				#volta ao início do saque ou finaliza
	beqz $t3, zerado
	
	li $v0, 4
	la $a0, fim
	syscall
	
	li $v0, 5
	syscall
	move $t6, $v0
	beqz $t6, inicio

zerado:
	li $v0, 10
	syscall		#finalização do programa
			#não tentamos uma forma dele nao entregar notas quando o valor é diferente de um multiplo de 100.