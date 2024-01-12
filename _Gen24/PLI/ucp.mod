param nT := 3;
set T := 1..nT;
set I := 1..nT;
set G := 1..7;
param pMin{T};
param pMax{T};
param cf{T};
param cu{T};

param cap{I};
param vol{I};
param alim{I};
param domanda{G};
param coeff := 0.05;
var xT{T, G} >= 0; #Quantita di energia prodotta da T in G
var yT{G} binary; #Var di assegnamento per le centrali T nel giorno G
var acquaDisponibile{I, G} >= 0;
var energiaTermo{G} >= 0;
var energiaIdro{G} >= 0;

s.t. def_Termo{ g in G}:
	energiaTermo[g] = sum { t in T} cf[t] * yT[g] +sum { t in T} cu[t] * xT[t, g];

#Devo calcolare quanta aqua è disponibile ogni giorno
s.t. def_acquaDisponibile {i in I, g in G: g>=1}:
	acquaDisponibile[i, g] = vol[i] + alim[i];
	
s.t. def_Idro {g in G}:
	energiaIdro[g] = 0.05 * vol[i];
	
s.t. domanda{g in G}:
	energiaTermo[g] + energiaIdro[g] = domanda[g];
	
s.t. prodMin {t in T, g in G}:
	 xT[t,g] >= pMin[t];
	 
s.t. prodMax {t in T, g in G}:
	xT[t,g] <= pMax[t];
#Ob: Costo minimo
minimize z:
	sum {g in G} energiaTermo + sum {g in G} energiaIdro;
	
data;
param: pMin pMax cf cu :=
1         10        90         60             2		 
2         20       100         50             3		 
3         20        20         40             5		 
;

param: cap vol alim :=
1        600       500          200
2       2000      1500          400
3        300       100          100
;

param domanda :=
  1      200
  2      180
  3      150
  4      200
  5      250
  6      250
  7      180
;

end;

