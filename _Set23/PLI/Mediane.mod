set M := 1..2;
param C := Tolosa Nizza Marsiglia Lione Limoges Digione Parigi;
set C2 := Tolosa Nizza Marsiglia Lione Limoges Digione;
param distanza {C2, C};
param costo{C};
set T := 1..nT;

var d; #distanza complessiva
var max_d; #distanza massima

minimize z: max_d;

#Ob 1: Minimizzare la massima distanza tra uno dei magazzini ed i terminali
data;
param distanza:
         Tolosa Nizza Marsiglia Lione Limoges Digione Parigi :=
Tolosa      0   565      401     529    295    720   550
Nizza     565     0      210     474    799    665   760
Marsiglia 401   210        0     309    635    500   674
Lione     529   474      309       0    375    194   377
Limoges   295   799      635     375      0    411   259
Digione   720   665      500     194    411      0   281;

param c :=
Tolosa 40
Nizza  50
Marsiglia 40
Lione  40
Limoges 40
Digione 40
Parigi  60;

param BUDGET := 100;
end;
