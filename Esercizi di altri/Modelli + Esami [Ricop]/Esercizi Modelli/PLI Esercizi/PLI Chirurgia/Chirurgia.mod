#ESERCIZIO 91.2 PLI - Chirurgia

#Qual è il massimo numero di pazienti che è possibile operare? In quali sale?

#DATI
param nO;               # Numero di sale operatorie
set O := 1..nO;         # Insieme di sale operatorie
param disp {O};         # Tempo disponibile in ogni sala operatoria [minuti]
param nP;               # Numero di pazienti
set P := 1..nP;         # Insieme di pazienti
param durata {P};       # Durata prevista dell'intervento di ogni paziente [minuti]

#VARIABILI
var x {P,O} binary;        # Assegnamento di pazienti alle sale operatorie

#VINCOLI

#Vincoli di assegnamento, ogni paziente sia assegnato non piu' di una volta
subject to Assignment {p in P}:
  sum {o in O} x[p,o] <= 1;

#Vincoli di capacita', il tempo utilizzato in ogni sala operatoria non ecceda quello disponibile
subject to Capacity {o in O}:
  sum {p in P} x[p,o] * durata[p] <= disp[o];

#OBIETTIVO
#massimizzare il numero di pazienti assegnati
maximize z: sum {p in P, o in O} x[p,o];

#############
data;

param nO := 3;
param nP := 10;

param disp :=
1   360
2   360
3   420;

param durata :=
1		120
2		60
3		75
4		80
5		130
6		110
7		90
8		150
9		140
10		180;

end;
