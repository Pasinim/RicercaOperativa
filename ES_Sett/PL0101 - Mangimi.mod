#DATI
param nM; 
param nL;
set M := 1..nM;
set L := 1..nL;

set I;
param a {M, I}; #composizione dei mangimi [%]
param t {M, L}; #tempi di produzione [minuti/quintale]
param b {I}; #disponiblità ingredienti [q/gg]
param c {M}; #prezzi di vendita mangime [$/q] 
param tmin {M}; #inizio lavorazione [minuti]
param tmax {M}; #fine lavorazione [minuti]


#Variabili
var x {M, L} >= 0; #per ogni linea devo produrre una certa quantita di mangime [q/gg]
#introduco delle variabili per il tempo di produzione
var s {m in M, L} >= tmin[m], <= tmax[m]; #inizio produzione di ogni mangime  su ogni linea [m]
var e {m in M, L} >= tmin[m], <= tmax[m]; #fine produzione di ogni mangime  su ogni linea [m]


#vincoli
# Vincoli sul consumo di ingredienti
subj to consumo {i in I}:
	sum {m in M} a[m,i]/100 * (sum {l in L} x[m, l]) <= b[i];
#posso introdurre anche una variabile ausiliaria che calcola i quintali prodotti per ogni linea
	
#Realzione tra inizio e fine produzione[min]
subj to tempi {m in M, l in L}:
	s[m,l] + t[m,l] * x[m,l] = e[m,l];
	
#Sequenza di pproduzione: posso produrre m solo quando ho finito di produrre m-1
subject to Sequenza {m in M, l in L: (m>1)}:
	s[m,l] >= e[m-1,l];
	

#Ob: massimizzare i profitti [$/g]
maximize z:
	sum {m in M} c[m] * (sum {l in L} x[m,l]); 

data;
set I := A B C D;

param nM := 5;
param nL := 3;


param : tmin	tmax   :=
1		0		120
2		30		180
3		120		270
4		225		300
5		255		360

;
param c :=
   1       40
   2       50
   3       35
   4       55 
   5       30
;

param b :=
    A           150
    B           135
    C            90
    D            75
;

param t : 		 1      2      3 :=

   1             5      4      2
   2             8      5      2
   3            10     10      2
   4            10      5      5
   5             3      5      5 
;


param a :   		A    B    C    D :=
   1               30   20   20   30
   2               40    5   10   45
   3               40   35   10   15
   4               50   20   20   10
   5               50   30    5   15
;
end;
