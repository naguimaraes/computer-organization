.data	
	primeira_palavra: .word 1
	segunda_palavra: .word 1
	terceira_palavra: .word 0x10000000

.text
# O trecho de dados do MARS comeca em 0X00001001, por isso ha a necessidade do LUI.
	LUI $10, 0X00001001
inicio:
	LW $1, 0($10)
	LW $2, 4($10)
	LW $3, 8($10)
	SRA $3, $3, 4
	SW $3, 8($10)
	ADD $3, $1, $2
	SUB $3, $3, $2
	BEQ $3, $1 LB1
	SW $0, 8($10)
	J inicio
LB1:
	SW $3, 12($10)
	J inicio
