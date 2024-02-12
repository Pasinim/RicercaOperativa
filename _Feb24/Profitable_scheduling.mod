reset;
param nJ;
param nM;
set J := 1..nJ;
set M := 1..nM;
param p{J}; #Valore penalita (oversubsribed)
param costi{J,M};
param time{J,M};
param disp{M};
param incoM{J,M} binary; #Incompatibiltia tra macchian e lavoro
param incoJ{J,J} binary; #Incompatibilita tra lavori

var x{J,M} binary; #Assegnazione lavoro macchina

s.t. assLavoro {j in J}: sum{m in M} x[j,m] = 1;
s.t. incompJ{j in J, m in M, j2 in J: j <> j2}:
	(incoJ[j, j2] * x[j,m] + incoJ[j,j2] * x[j2,m]) <= 1;
s.t. incompM{j in J, m in M}: (incoM[j,m] * x[j,m])  = 0;
s.t. tempoDisponibile{m in M}:
	sum {j in J} x[j,m] * time[j,m] <= disp[m];
	
minimize z: sum{j in J, m in M} costi[j,m] * x[j,m];



data;
param nJ := 9;
param nM := 3;

#Tempo disponibile (caso 2):	360	330	320	(oversubscribed);
param disp :=
1	380
2	360
3	350
;
param incoJ :
		1	2	3	4	5	6	7	8	9 := 
	1	1	0	1	1	1	1	1	1	1
	2	0	1	1	1	1	1	1	1	1
	3	1	1	1	0	1	1	1	1	1
	4	1	1	0	1	1	1	1	1	1
	5	1	1	1	1	1	0	1	1	1
	6	1	1	1	1	0	1	1	1	1
	7	1	1	1	1	1	1	1	0	0
	8	1	1	1	1	1	1	0	1	0
	9	1	1	1	1	1	1	0	0	1;
param incoM:
		1	2	3 :=
	1	1	0	1
	2	1	0	1
	3	1	1	1
	4	1	1	0
	5	1	1	0
	6	1	1	1
	7	1	1	1
	8	0	1	1
	9	0	1	1;
param costi :
		1	2	3 := 
	1	24	42	23	
	2	30	45	23	
	3	33	54	16	
	4	37	45	18	
	5	34	47	22	
	6	31	42	25	
	7	30	41	19	
	8	28	47	15	
	9	25	50	20;
param p := 
1 10
2 10
3 10
4 10
5 15
6 15
7 15
8 15
9 20;

param time :
		1	2	3 :=
	1	100	95	107
	2	111	108	115
	3	98	96	103
	4	132	128	133
	5	120	118	119
	6	115	117	114
	7	142	145	140
	8	123	125	120
	9	90	95	88;


solve;
display x, z;
end;


