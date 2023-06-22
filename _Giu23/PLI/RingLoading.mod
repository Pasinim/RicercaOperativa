#Ring Loasding 
#Macchina spedisce a quelli adiacenti in senso orario o antiorario per raggiungere una determinata destinazione

param k;
set nC := 1..k;
param t {nC, nC}; #traffico


#variabili
var x{nC, nC} binary; #1=orario 
var alfa;

#Vincoli
subject to t_sensoOrario {k in nC : k < nC}:
alfa >= sum {i in nC , j in nC: (j >= k+1 and i <= k)}: t[i,j] * (1-x[i,j]); 

#Ob: minimizzare il massimo traffico su un arco

minimize alfa;


#DATI:
param k := 10;
param maxTraffico : 1	2	3	4	5	6	7	8	9	10 := 
				1   9   7   7   8   7   9   9   6   6  10
				2   7   7   7   7   7   8   5   7  10   9
				3   7   5   8   8   8  10   6  10   9  10
				4   7  10   7  10   9   8   5  10   7   9
				5  10   5   6  10   5   8   7   9   8   7
				6   6   7   8   7   8  10   9   5   9   7
				7   9   5   8   9   7  10   8   9  10   7
				8   6   5   9   5   6   8  10   6   9   8
				9   7   5   5   8   8   8  10   7   9   7
				10  8   5   5   7   8   9   7   6   5   8
;