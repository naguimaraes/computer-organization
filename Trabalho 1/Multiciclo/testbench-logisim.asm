# Como a memoria do multiciclo eh compartilhada, convencionamos que
# as instrucoes comecam no endereco 0 e os dados comecam
# no endereco 0xa0.

# O endereço 0xa0 eh acessado pelo indice 640(decimal) = 0x280(hexa), que sera shiftado para a direita 2 vezes.
# 0x280 >> 2 = 0x280 / 4 = 0xa0. Por isso, os dados sao acessados a partir do endereco 640, de 4 em 4 bytes.

.text
.org 0
inicio:
	LUI $1, 0X00000001 # R1 <- 1 * 2^16
	SW $1, 640($0) 	   # MEM($0 + 640) <- 65.536
	LW $2, 644($0)
	LW $3, 648($0)
	BGEZAL $1, teste_bgezal
	J erro
teste_bgezal:
	SRA $3, $3, 4
	SW $3, 648($0)
	ADD $3, $1, $2
	SUB $3, $3, $2
	SW $0, 648($0)
	JAL teste_jal
	J erro
teste_jal:
	BEQ $3, $1 LB1
	J inicio
LB1:
	SW $3, 652($0)
	J inicio
	
erro:
	J erro

