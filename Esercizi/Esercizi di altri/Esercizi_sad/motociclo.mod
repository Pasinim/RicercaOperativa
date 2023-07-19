# Esercizio motociclo

# DATI
param nM;				# Numero tipi motocicli
param nP;				# Numero parti
set M := 1..nM;			# Insieme dei tipi di motocicli
set P := 1..nP;			# Insieme delle parti
param rV{M};			# Ricavo vendite [K € /motociclo] (migliaia di euro per motociclo)
param tA{M};			# Tempi assemblaggio per motociclo [giorni-uomo/motociclo]
param cT{P,M};			# Pezzi di ogni tipo necessari per ogni motociclo [pezzi/motociclo]
param mP{P};			# Disponibilità delle parti [pezzi/mese]
param manodopera;

# VARIABILI

var mPP{M} >= 0;				# Motocicli prodotti per tipo per ogni mese
var x >= 0;					# Numero di manodopera disponibile
var costo;
# VINCOLI

s.t. motocicliProducibili:
	sum{i in M} mPP[i]*tA[i] <= manodopera;

s.t. disponibiltProdotti{j in P}:
	sum{i in M} mPP[i]*cT[j,i] <= mP[j];

s.t. manodoperaUtilizzata:


# OBIETTIVO

maximize z: sum{i in M} mPP[i]*rV[i] - x*974;

data;

# Anche se sono uguali, lasciati divisi nel caso dovessero cambiare nel tempo e diventare diversi.
param nM := 3;
param nP := 3; 
param manodopera := 10000;


param rV := 
1      1200
2      1300
3      1200;


param tA :=
1        1
2        1
3        1;


param cT:  1       2       3 :=
1 		  10      12      14
2		   5       7       6
3         10      15       9;


param mP := 
1		91
2		40
3		59;


end;
