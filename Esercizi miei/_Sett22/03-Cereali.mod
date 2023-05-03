#DATI 
set nC := 1..6;
set T;
param maxAcqua := 400000; #[m3]
param Terreno {T}; 
param Profitto {nC};
param Acqua {nC};
param area {T, nC};


#VARIABILI
var x{nC} >= 0; #massimizzo la produzione

#VINCOLI
subject to acqua :
	sum {j in nC} x[j] * Acqua[j] <= 400000;

#OBIETTIVO
maximize z:
	sum {i in nC} x[i] * Profitto[i];
###

data;

set T := A B;

param area :
	1		2		3		4		5		6 :=
A	.02		.03		.02		.016	.05		.04	 
B	.02		.034	.024	.02		.06		.034
;

param Profitto :=
1	48 
2	62
3	28
4	36
5	122
6	94;


param Terreno :=
A	200
B	400
;

param Acqua := 
1	120
2	160
3	100
4	140
5	215
6	180;	

end;
