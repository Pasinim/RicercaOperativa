param nC;
param nT;
set Cereali := 1..nC;
set Terreni := 1..nT;
param u := 400;   #limite di acqua

param Profitto {Cereali};
param Area {Terreni}; #Area totale di ogni terreno [acri]
param Acqua {Cereali}; #Acqua richiesta [m3/quintale]
param a {Terreni, Cereali}; #Consumo unitario di superficie per ogni terreno [acri/quintale]

#variabili
var x {Terreni, Cereali} >= 0; #Produzione. Devo specificare sia su quale terreno sia il tipo di cereale

#VINCOLI
#Acqua utilizzata <= u;
subject to AcquaMassima:
        sum {t in Terreni, c in Cereali} x[t, c] * Acqua[c] <= u;

#Area utilizzata < area Totale
subject to areaMax{t in Terreni}:
        sum {c in Cereali} a[t, c] * x[t, c] <= Area[t];

#Obiettivo
maximize z:
        sum {t in Terreni, c in Cereali} x[t, c] * Profitto[c]; #Massimizzo il profitto



####
data;
param nT := 2;
param nC := 6;
param Area :=
1 200     
2 400;

param: Profitto Acqua :=
1 48    .120
2 62    .160
3 28    .100
4 36    .140
5 122   .215
6 94    .180
;       


param a: 1      2      3       4       5       6 :=
1       .02     .03    .02     .016    .05     .04
2       .02     .034   .024    .02     .06     .034
;
 
end;




