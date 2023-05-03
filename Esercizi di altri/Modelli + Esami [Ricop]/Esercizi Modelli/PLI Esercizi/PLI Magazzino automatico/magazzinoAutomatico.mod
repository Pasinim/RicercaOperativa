# ESERCIZIO 14 febbraio 2022 - PLI Magazzino automatico

#DATI
param nR;				# Numero di righe
param nC;				# Numero di colonne
param o;				# Posizione dell'origine
param dimh;				# Dimensione orizzontale [metri]
param dimv;				# Dimensione verticale [metri]

param nP;				# Numero prelievi (Pick-up)
set P := 1..nP;			# Insieme dei prelievi
param nD;				# Numero consegne (Delivery)
set D := 1..nD;			# Insieme delle consegne
param sitoP {P};		# Siti dei prelievi (Pick-up)
param sitoD {D};		# Siti delle consegne (Delivery)

param rowP {p in P} := (sitoP[p]-1 div nC) + 1;
param rowD {d in D} := (sitoD[d]-1 div nC) + 1;
param colP {p in P} := (sitoP[p]-1 mod nC) + 1;
param colD {d in D} := (sitoD[d]-1 mod nC) + 1;
param row0 := (o-1 div nC) + 1;
param col0 := (o-1 mod nC) + 1;

# Le distanze
param doP {p in P} := sqrt((dimh*(col0-colP[p]))^2 + (dimv*(row0-rowP[p]))^2);							# Distanza dall'origine al pick-up
param doD {d in D} := sqrt((dimh*(col0-colD[d]))^2 + (dimv*(row0-rowD[d]))^2);							# Distanza all'origine al delivery
param dPo {p in P} := sqrt((dimh*(col0-colP[p]))^2 + (dimv*(row0-rowP[p]))^2);							# Distanza dal pick-up all'origine
param dDo {d in D} := sqrt((dimh*(col0-colD[d]))^2 + (dimv*(row0-rowD[d]))^2);							# Distanza dal delievery all'origine
param dPP {p1 in P,p2 in P} := sqrt((dimh*(colP[p1]-colP[p2]))^2 + (dimv*(rowP[p1]-rowP[p2]))^2);		# Distanza dal pick al pick-up
param dDP {d in D,p in P} := sqrt((dimh*(colP[p]-colD[d]))^2 + (dimv*(rowP[p]-rowD[d]))^2);				# Distanza dal delivery al pick-up
param dDD {d1 in D,d2 in D} := sqrt((dimh*(colD[d1]-colD[d2]))^2 + (dimv*(rowD[d1]-rowD[d2]))^2);		# Distanza dal delivery al delivery

#VARIABILI
var xoP {P} binary;									# Dall'origine al pick-up
var xoD {D} binary;									# Dall'origine al delivery
var xPo {P} binary;									# Dal pick-up all'origine
var xDo {D} binary;									# Dal delievery all'origine
var xPP {p1 in P, p2 in P: p1 <> p2} binary;		# Dal pick al pick-up
var xDP {D,P} binary;								# Dal delivery al pick-up
var xDD {d1 in D,d2 in D: d1 <> d2} binary;			# Dal delivery al delivery
#var xPD {P,D} binary;									# Dal pick-up al delivery 	(sono proibite, quindi possiamo anche non dichiararle)

#VINCOLI
# Ogni ordine deve essere soddisfatto: vincoli di grado
subject to IndegreeP {p in P}:
	sum {p2 in P: p2<>p} xPP[p2,p] + sum {d in D} xDP[d,p] + xoP[p] = 1;
subject to OutdegreeP {p in P}:
	sum {p2 in P: p2<>p} xPP[p,p2] + xPo[p] = 1;

subject to IndegreeD {d in D}:
	sum {d2 in D: d2<>d} xDD[d2,d] + xoD[d] = 1;
subject to OutdegreeD {d in D}:
	sum {d2 in D: d2<>d} xDD[d,d2] + sum {p in P} xDP[d,p] + xDo[d] = 1;

# No terne P
subject to No3P {p1 in P, p2 in P, p3 in P: p1<p2 and p2<p3}:
	xPP[p1,p2] + xPP[p2,p3] + xPP[p1,p3] + 
	xPP[p2,p1] + xPP[p3,p2] + xPP[p3,p1] <= 1;

# No terne D
subject to No3D {d1 in D, d2 in D, d3 in D: d1<d2 and d2<d3}:
	xDD[d1,d2] + xDD[d2,d3] + xDD[d1,d3] + 
	xDD[d2,d1] + xDD[d3,d2] + xDD[d3,d1] <= 1;

#OBIETTIVO
# Minimizzare la lunghezza totale percorsa (distanza complessiva)
minimize z: sum {p in P} (xoP[p] * doP[p] + xPo[p] * doP[p]) +
            sum {d in D} (xoD[d] * doD[d] + xDo[d] * doD[d]) +
            sum {p1 in P, p2 in P: p1<>p2} (xPP[p1,p2] * dPP[p1,p2]) +
            sum {d1 in D, d2 in D: d1<>d2} (xDD[d1,d2] * dDD[d1,d2]) +
            sum {p in P, d in D} (xDP[d,p] * dDP[d,p]);

############################################
data;

param nR := 5;
param nC := 13;
param o := 33;
param dimh := 1;
param dimv := 0.6;

param nP := 7;
param nD := 9;

param sitoD :=
1		24
2		39
3		12
4		60
5		48
6		49
7		42
8		19
9		 5;

param sitoP :=
1		38
2		26
3		11
4		 9
5		63
6		18
7		55;

end;
