# Como a memoria do multiciclo eh compartilhada, convencionamos que
# as instrucoes comecam no endereco 0 e os dados comecam
# no endereco 0xa0.

# O endereço 0xa0 eh acessado pelo indice 640(decimal) = 0x280(hexa), que sera shiftado para a direita 2 vezes.
# 0x280 >> 2 = 0x280 / 4 = 0xa0. Por isso, os dados sao acessados a partir do endereco 640, de 4 em 4 bytes.

.text
.org 0
inicio:
	LW $1, 640($0)
	LW $2, 644($0)
	LW $3, 648($0)
	SRA $3, $3, 4
	SW $3, 648($0)
	ADD $3, $1, $2
	SUB $3, $3, $2
	BEQ $3, $1 LB1
	SW $0, 648($0)
	J inicio
LB1:
	SW $3, 652($0)
	J inicio

