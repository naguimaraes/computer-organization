# Como a memoria do multiciclo eh compartilhada, convencionamos que
# as instrucoes comecam no endereco 0 e os dados comecam
# no endereco 0x000000a0. O registrador $10 serve de ponteiro para os dados.

.text

.org 0
inicio:
	LW $1, 160($0)
	LW $2, 164($0)
	LW $3, 168($0)
	SRA $3, $3, 4
	SW $3, 168($0)
	ADD $3, $1, $2
	SUB $3, $3, $2
	BEQ $3, $1 LB1
	SW $0, 8($0)
	J inicio
LB1:
	SW $3, 12($0)
	J inicio

