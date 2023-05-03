#DATI
set organi := 1..7;
set posizioni := 1..5;

param a{organi, posizioni}; #percentuale assorbita dagli organi
param t {posizioni};
param limite {organi};
param intens {posizioni};
param u := 600;

#VARIABILI
var x {posizioni} >= 60;

#VINCOLI
subject to limitePosizione {p in posizioni}:
	x[p] <= intens[p];
    
subject to intensitaMax:
   sum {p in posizioni} x[p] <= u;

subject to limiteIntensita {o in organi}:
	sum {p in posizioni} a[o, p] * x[p] <= limite[o];
	
#OBIETTIVO
maximize radiazioneTumore:
	sum {p in posizioni} x[p]*t[p];

#####
data;
param a: 1 2 3 4 5 :=
 1   0.1      0.0      0.0       0.1      0.2
 2   0.1      0.0      0.15      0.0      0.1
 3   0.0      0.1      0.0       0.0      0.0
 4   0.0      0.2      0.1       0.1      0.0
 5   0.1      0.0      0.2       0.0      0.1
 6   0.1      0.3      0.15      0.1      0.1
 7   0.2      0.1      0.15      0.0      0.0
;

param t := 
1  0.40
2  0.30
3  0.25
4  0.70
5  0.50
;

param limite :=
 1     55
 2     90
 3     60
 4     24
 5     70
 6     55
 7     95
;

param intens :=
  1        120
  2        130
  3        100
  4        150
  5        150
;

end;

