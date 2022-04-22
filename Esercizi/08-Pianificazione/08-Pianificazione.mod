set mesi := 1..4;
param d {mesi}; #omanda [t]
param q {mesi}; #capacità produttiva [t]
param c {mesi}; #costo produzione [e/t]
param g {mesi}; #prezzo dell'immagazinamento [e/kg];
param s0 := 0; #stock iniziale

#VARIABILI
var x{m in mesi} >= 0 <=q[m]; #produzione mensile
var s{mesi} >= 0;

#VINCOLI
#subject to produzone_mensile {m in mesi}:
#    x[m] <= q[m]; posso direttamente scriverlo nelle variabili

subject to immagazinamento {m in mesi: m>1}:
    s[m - 1] + x[m] = d[m] + s[m]; #in questo modo esprime le quantità di gelato in magazzino sommate alla quantità non ancora vendura

#dato che calcolo l'immagazzinamento partendo da m = 2 devo definire i valore 
#iniziale dell'immagazzinamento
subject to Primo_periodo:
    s0 + x[1] = d[1] + s[1];


#OBETTIVO
minimize costo:
    sum {m in mesi} (x[m]*c[m] + s[m]*g[m]*1000); 



data;

param d :=
1     200 
2     300
3     500
4     400 
;

param q :=
1     400
2     500
3     300
4     500
;

param c :=
1     34
2     36
3     32
4     38
;

param g :=
1     2
2     3
3     2
4     3
;


end;
