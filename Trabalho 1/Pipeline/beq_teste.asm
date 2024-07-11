.text
.org 0
inicio:
	LW $1, 0($0)
	nop
	nop
	nop
	nop
	nop
	LW $3, 0($0)
	nop
	nop
	nop
	nop
	nop
	BEQ $3, $1 inicio
	nop
	nop
	nop
	nop
	nop
	J erro
	nop
	nop
	nop
	nop
	nop
erro:
	nop
	J erro
	nop
	nop
	nop
	nop
	nop
	
