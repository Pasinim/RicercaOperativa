# Esercizio: Posologia

# DATI
set T := 1..24;          # Fasce orarie del giorno
param req {T};           # Quantit� minima richiesta per ogni ora del giorno [mgY]
param maxliv;            # Quantit� massima consentita [mgY]
set H := 0..11;          # Ore antecedenti significative
set Farmaci;             # Farmaci utilizzabili
param eff {H,Farmaci};   # Effetto di ogni farmaco dopo un dato numero di ore [mgY/gX][
param costo {Farmaci};   # Costo di ogni farmaco [�/gX]

# VARIABILI
var x {T,Farmaci} >=0;              # Quantit� di ogni farmaco assunta in ogni ora del giorno [gX]
var y {t in T} >=req[t], <= maxliv; # Quantit� di Y in ogni ora del giorno [mgY]

# VINCOLI
# Calcolo della quantit� di Y in funzione delle quantit� di X assunte in precedenza [mgY]
subject to Effetto {t2 in T}:
  y[t2] = sum {h in H, t1 in T, f in Farmaci: (t1 = t2-h) or (t1 = t2-h+24)} eff[h,f] * x[t1,f];

# OBIETTIVO
# Obiettivo n.1: Minimizzare la quantit� totale di farmaco assunta [gX]
minimize obj1: sum {t in T, f in Farmaci} x[t,f];

# Obiettivo n.2: Minimizzare il costo totale dei farmaci assunti [�]
#minimize obj2: sum {t in T, f in Farmaci} costo[f] * x[t,f];

#####
data;
#####

set Farmaci := Prismil Cilindren;

param req :=
 1   5.0 
 2   1.0
 3   0.0
 4   0.0
 5   0.0
 6   0.0
 7   4.0
 8  15.0
 9  12.0
10   5.0
11   4.0
12   3.0
13  25.0
14  30.0
15  25.0
16  15.0
17   5.0
18   4.0
19   3.0
20  25.0
21  30.0
22  25.0
23  20.0
24  10.0;

param maxliv := 45;

param eff: Prismil Cilindren :=
 0	 		1.5 	2.5
 1	 		3.0 	4.0
 2	 		4.0 	5.5
 3	 		2.5 	4.0
 4	 		1.9 	3.0
 5	 		1.4 	1.5
 6	 		1.0 	0.7
 7	 		0.7 	0.4
 8	 		0.5 	0.2
 9	 		0.3 	0.0
10	 		0.2 	0.0
11	 		0.1 	0.0;

param costo :=
Prismil 0.70
Cilindren 0.95;

end;
