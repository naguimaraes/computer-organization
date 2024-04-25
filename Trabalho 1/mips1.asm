inicio:
LW $1, 0($0)
LW $2, 4($0)
ADD $3, $1, $2
SUB $3, $3, $2
BEQ $3, $1 LB1
SW $0, 8($0)
J inicio
LB1:
SW $3, 8($0)
J inicio