#DATI
param T;	#Turni
set t := 1..T;
param L;	#lavorati
set l := 1..L;
param I;	#ingredienti
set i := 1..I;

param c {t, l}; #Costi di produzione [$/kg]
param m {l}; #costi di magazziono [$/kg]
param comp {i, l}; #Composizione dei lavorati [%]
param v {i}; #Volume degli ingredienti (decimetri cubi / Kg)
param c_max; #capacità max [decimetri cubi]
param f_min; #fornitura minima centro commerciale [kg]
param q_min {t}; #Contratto con i trasportatori: limiti di quantita' trasportabili dopo ogni turno (Kg)
param q_max {t}; #Contratto con i trasportatori: limiti di quantita' trasportabili dopo ogni turno (Kg)

#Variabili
var x {l} >= 0;

#Vincoli
#Capacità massima: x * volume dell'ingrediente * percentuale dell'ingrediente nel lavorato
subj to capacita_max {k in i}:
	sum { j in l} x[j] * v[k] * comp[k, j] <= c_max;
#Fornitura Minima per il centro commerciale
subj to ccommerciale:
	sum {k in i} x[i] >= f_min;
#Limite di trasporto alla fine di ogni turno
subj to trasporto_min {j in t}:
	sum {k in l} x[k] >= q_min[j];
subj to trasporto_max {j in t}:
	sum {k in l} x[k] <= q_max[j];

#Ob: Pianificare la produzione giornaliera minimizzando i costi

data;
param T := 3;
param L := 2;
param I := 3;
param c : 1		2 :=
	1	  12	15
	2	  8		11.5
	3	  10	12
;
param m :=
	1	1.8
	2	0.4
;
param comp: 1	 2 :=
	1		.2	.5
	2		.6	.1
	3		.2	.4
;
param v :=
	1 20
	2 35
	3 15
;
param c_max := 7100;
param q_min :=
	1	65
	2	70
	3	50
;
param q_max :=
	1	135
	2	135
	3	135
;
end;
