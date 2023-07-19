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
#param epsilon;					# Termine noto per analisi parametrica [giorni-uomo/mese] (unita come il vincolo)

#VARIABILI
# quanto produciamo di ogni prodotto/motociclo
var x {M} >=0;					# Produzione [motociclo/mese]
var f1;							# Ricavi [euro/mese]
var f2;							# Manodopera [giorni-uomo/mese]

#VINCOLI
# Vincolo sul consumo di componenti [pezzi/mese]
subject to Consumi{i in C}:
	sum {j in M} a[i,j] * x[j] <= b[i];

#Vincolo sul consumo di manodopera [giorni-uomo/mese]
subject to Manodopera:
	sum {j in M} t[j] * x[j] <= f2;

subject to Def1: f1 = sum {j in M} c[j] * x[j];

#OBIETTIVO
maximize z: f1 - 1000 * f2;
#subject to Parametric: f1 >= epsilon;

######################
data;

#param epsilon := 7848;

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
