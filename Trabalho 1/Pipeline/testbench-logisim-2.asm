.text
.org 0
inicio:
	LUI $1, 0X00000001 # R1 <- 1 * 2^16
	LW $1, 12($0)
	nop
	nop
	nop
	nop
	nop
	SW $1, 0($0) 	   # MEM($0 + 640) <- 65.536
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
	J teste_bgezal
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
teste_bgezal:
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
	SW $0, 8($0)
	nop
	nop
	nop
	nop
	nop
	JAL teste_jal
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
teste_jal:
	BEQ $3, $1 LB1
	nop
	nop
	nop
	nop
	nop
	J inicio
	nop
	nop
	nop
	nop
	nop
LB1:
	SW $3, 12($0)
	nop
	nop
	nop
	nop
	nop
	J inicio
	nop
	nop
	nop
	nop
	nop
erro:
	J erro

