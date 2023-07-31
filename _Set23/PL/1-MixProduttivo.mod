#DATI
param nR := 5;
param nV := 3;
set r := 1..nR;
set v := 1..nV;
param c{r}; #Capacita [h/sett]
param t{r, v}; #tempo lavorazione [h/veicolo]
param p{v}; #profitto[e]

#VARIABILI
#var x{r} >= 0; #tempo da assegnare al reparto [h]
var x{v} >= 0; #Veicoli prodotti

#VINCOLI
#Non si devono eccedere le ore lavorative settimanali
subj to lim_h {i in r}:
	sum {j in v} t[i,j] * x[j] <= c[i];
	

#Ob: Massimizzare profitto
maximize z:
	sum {i in v} x[i] * p[i];
data;
param c :=
1 120
2 80
3 96
4 102
5 40
;

param t :    1	2	3 :=
1			3	2	1
2			1	2	3
3			2	0	0
4			0	3	0
5			0	0	2
;

param p :=
1 840
2 1120
3 1200
;

end;

