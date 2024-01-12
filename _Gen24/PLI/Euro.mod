#Si v;uol sapere qual è il massimo numero di monete o banconote necessarie per pagare una
#somma non superiore a 10 Euro

param c; #Cifra da raggiungere
param p; #Importo consegnato
param nT := 10;
set T := 1..nT; #Insieme dei tagli di banconote/monete disponibili

param tagli {T};

var x{T} >= 0; #Il numero di ogni tipo di taglio per raggiungere la cifra desiderata
var y{T} >= 0; #Numero di ogni tipo di taglio per dare il resto
s.t. totale:
	sum {t in T} x[t] * tagli[t] = c;
s.t. resto:
	sum {t in T} y[t] * tagli[t] = p - c;
maximize z:
	sum {t in T} (x[t] + y[t]);
data;
param c := 10;
param p := 15;
param tagli := 
1 0.01
2 0.02
3 0.05
4 0.1
5 0.2
6 0.5
7 1
8 2 
9 5 
10 10
;
end;

