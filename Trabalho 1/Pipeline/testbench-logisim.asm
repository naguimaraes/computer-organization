# Quando todas as instrucoes estiverem implementadas,
# adicionem aqui uma descricao do que este programa deve fazer
# para testar elas todas.


# Para as instrucoes comecarem no endereco 0 no logisim, o .org eh necessario

.org 0x00000000
inicio:

# Todas as instrucoes sao acompanhadas de 5 nops, para evitar problemas de
# dependencia de dados.

	LW $1, 0($0)
	nop
	nop
	nop
	nop
	nop
	LW $2, 4($0)
	nop
	nop
	nop
	nop
	nop
	LW $3, 8($0)
	nop
	nop
	nop
	nop
	nop
	SRA $3, $3, 4
	nop
	nop
	nop
	nop
	nop
	SW $3, 8($0)
	nop
	nop
	nop
	nop
	nop
	ADD $3, $1, $2
	nop
	nop
	nop
	nop
	nop
	SUB $3, $3, $2
	nop
	nop
	nop
	nop
	nop
	BEQ $3, $1 LB1
	nop
	nop
	nop
	nop
	nop
	SW $0, 8($0)
	nop
	nop
	nop
	nop
	nop
	# LUI $1, 0X00000001 # R1 <- 1 * 2^16
	# SW $1, 12($0) 	   # MEM($0 + 12) <- 65.536
	J inicio
LB1:
	SW $3, 12($0)
	nop
	nop
	nop
	nop
	nop
	J inicio

# A implementacao dos dados tem que ser feita a mao, dentro do Logisim,
# ja que sao memorias separadas.

