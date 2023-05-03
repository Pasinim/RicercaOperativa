# ESERCIZIO PL: Il tempo e' denaro

#DATI
param nM;						# Numero di motocicli
param nC;						# Numero di componenti
set M := 1..nM;					# Insieme dei motocicli
set C := 1..nC;					# Insieme dei componenti
param c{M};		 				# Ricavi dalle vendite [euro/motociclo]
param t{M};						# Tempo di assemblaggio [giorni-uomo/motociclo]
param a{C,M};					# Coefficienti tecnologici [pezzi/motociclo]
param b{C};						# Disponibilita' di materia prima [pezzi/mese]

#VARIABILI
# quanto produciamo di ogni prodotto/motociclo
var x {M} >=0;					# Produzione [motociclo/mese]

#VINCOLI
# Vincolo sul consumo di componenti [pezzi/mese]
subject to Consumi{i in C}:
	sum {j in M} a[i,j] * x[j] <= b[i];

#OBIETTIVO
# Massimizzare i profitti [euro/mese]
maximize z: sum {j in M} c[j] * x[j];

######################
data;

param nM:=3;
param nC:=3;

param c :=
1		1200
2		1300
3		1200;

param t :=
1		1
2		1
3		1;

param a:	1		2		3 :=
1			10		12		14
2			5		7		6
3			10		15		9;

param b :=
1		91
2		40
3		59;

end;
