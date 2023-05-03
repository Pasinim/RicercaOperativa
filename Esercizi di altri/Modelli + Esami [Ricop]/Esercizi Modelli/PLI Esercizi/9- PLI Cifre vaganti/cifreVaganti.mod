# ESERCIZIO PLI Cifre Vaganti (Presa in presenza 2022)

#RISULTATO: X = 2785, Y = 5827

#DATI
param N;						# Numero di posizioni ( 1=unita, … , 4=migliaia )
set Posizioni := 0..N-1;		# Ogni posizione p pesa 10^p
set Cifre:= 1..9;
set Speciali within Cifre;		# Set di cifre speciali (E' un sottoinsieme delle Cifre)
param S;						# Somma, numero fatto dalle cifre speciali
param k;						# Numero di cifre speciali che devono comparire nei numeri

#VARIABILI
# variabili di assegnamento, assegniamo alle posizioni le cifre
var x {Posizioni, Cifre} binary;		#se c'e quella cifra in quella posizione o no (assegnamento che descrive il numero 1)
var y {Posizioni, Cifre} binary;		#se c'e quella cifra in quella posizione o no (assegnamento che descrive il numero 2)

#VINCOLI
# La stessa cifra non puo comparire piu’ di una volta (tutte diverse tra loro)
subject to TutteDiverse {c in Cifre}:
	sum {p in Posizioni} x[p,c] <= 1;

#Una cifra per ogni posizione
subject to Assign { p in Posizioni}:
	sum { c in Cifre} x[p,c] = 1;

# Permutazione delle cifre

# migliaia 1 = decine 2
subject to Permut1 {c in Cifre}:
	x[3,c] = y[1,c];

# centinaia 1 = unita 2
subject to Permut2 {c in Cifre}:
	x[2,c] = y[0,c];

#decine 1 = centinaia 2
subject to Permut3 {c in Cifre}:
	x[1,c] = y[2,c];

#unita 1 = migliaia 2
subject to Permut4 {c in Cifre}:
	x[0,c] = y[3,c];

# Somma del numero 1 + numero 2
subject to Somma: 
	sum {p in Posizioni} 10^p *  (sum {c in Cifre} x[p,c] * c) + 
	sum {p in Posizioni} 10^p *  (sum {c in Cifre} y[p,c] * c)  = S;

# k cifre speciali devono comparire
subject to speciali:
	sum {p in Posizioni, c in Speciali} x[p,c] = k;

#OBIETTIVO
# Non c’e una funzione obiettivo

########################
data;

param N := 4;
set Speciali := 1	2	6	8;
param S := 8612;
param k := 2;

end;

