#c'è qualche unità di misura che non torna cn la soluzione del prof, il mio esce 10 volte in meno (/10)

#DATI
set nP := 1..5;
set nO := 1..7;
param maxRadiazioni := 60;
param Tumore {nP};
param Radiazione {nO, nP};
param LimitePos {nP};
param LimiteOrg {nO};
#VARIABILI
var x {nP} >= 0; #quantità di radiazioni per ogni posizione

#VINCOLI
subject to max_rad :
	sum {i in nP} x[i] <= maxRadiazioni;
subject to max_rad_posizioni {j in nP}:
	x[j] <= LimitePos[j];
	
#limite massimo di raiazioni degli organi
subject to limite_organi {o in nO}:
	sum {p in nP} x[p] * Radiazione[o, p] <= LimiteOrg[o];

#OBIETTIVO
#massimizzare l'irraggiamento del tumore
maximize radiazione_tumore:
	sum {j in nP} x[j] * Tumore[j];



###
data;
param LimiteOrg :=
1	5.5
2	9
3	6
4	2.4
5	7
6	5.5
7	9.5
;

param LimitePos :=
1	12
2	13
3	10
4	15
5	15
;

param Radiazione :
	1		2		3		4		5 :=
1	.1		0		0		.1		.2
2	.1		0		.15		0		.1
3	0		.1		0		0		0
4	0		.2		.1		.1		0
5	.1		0		.2		0		.1
6	.1		.3		.15		.1		.1
7	.2		.1		.15		0		0
;


param Tumore :=
1	.4
2	.3
3	.25
4	.7
5	.5
;


end;
