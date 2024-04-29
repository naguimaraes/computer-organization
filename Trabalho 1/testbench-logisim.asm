# Para as instrucoes comecarem no endereco 0, o .org eh necessario
.org 0x00000000
inicio:
	LW $1, 0($0)
	LW $2, 4($0)
	LW $3, 8($0)
	SRA $3, $3, 4
	SW $3, 8($0)
	ADD $3, $1, $2
	SUB $3, $3, $2
	BEQ $3, $1 LB1
	SW $0, 8($0)
	LUI $1, 0X00000001 # R1 <- 1 * 2^16
	SW $1, 12($0) 	   # MEM($0 + 12) <- 65.536	
	J inicio
LB1:
	SW $3, 12($0)
	J inicio

