# Quando todas as instrucoes estiverem implementadas,
# adicionem aqui uma descricao do que este programa deve fazer
# para testar elas todas.


# Para as instrucoes comecarem no endereco 0 no logisim, o .org eh necessario

.org 0x00000000
inicio:
	LUI $1, 0X00000001 # R1 <- 1 * 2^16
	SW $1, 12($0) 	   # MEM($0 + 12) <- 65.536	
	J inicio
LB1:
	SW $3, 12($0)
	J inicio

# A implementacao dos dados tem que ser feita a mao, dentro do Logisim,
# ja que sao memorias separadas.

