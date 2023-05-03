# ESERCIZIO PL Cloud computing capacity

#DATI
param n;					# Numero di server
set S := 1..n;				#Insieme dei server
param cf{S};				# Costo fisso per tutto l'anno [$]
param cv{S};				# Costo variabile [$/ora]
param epsilon;				# La soglia (su cui fare l'analisi parametrica)

#VARIABILI
var costo;					# Costo [$]
var q;						# Domanda, q e' il numero di ore macchina/ore di calcolo che abbiamo bisogno di acquistare [ore]

#VINCOLI
#Vincoli per linearizzare
subject to Minimo{i in S}:
	costo <= cf[i] + cv[i] * q;

#OBIETTIVO
maximize z: costo;
subject to Parametric: q <= epsilon;

#################################
data;

param epsilon :=1683;

param n:= 4;

param:	cf			cv :=
1		1560		0.128
2		1280		0.192
3		 552		0.312
4		  0			0.640;

end;
