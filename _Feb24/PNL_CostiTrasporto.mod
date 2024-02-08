reset; 
param nO;
param nD;
set O := 1..nO;
set D := 1..nD;
param a{D}; #Costo della destinazione secondo la prima ipotesi
param b{O}; #Costo della origine secondo la prima ipotesi
param c{O,D}; #Costo proporzionale secondo la seconda ipotesi
param d{D}; #Costo terza ipotesi
param e{O}; #Costo terza ipotesi
param offerta{O};
param domanda{D};

var x{O, D} >= 0; #Quantita da trasportare da O a D
s.t. smaltimento{i in O}: sum{j in D} x[i,j] = offerta[i];
s.t. capacita{j in D}: 	sum {i in O} x[i,j] = domanda[j];

#ipotesi A
#minimize z: sum{i in O, j in D} (x[i,j] + b[i]/x[i,j]); 

#Ipotesi B:
#minimize z: sum{i in O, j in D} x[i,j] * c[i,j];

#ipotesi C;
minimize z: sum{i in O, j in D} sqrt(d[j] * e[i] * x[i,j]);

data;
param nO := 6;
param nD := 8;

param a :=
 1 18
 2 19
 3 10
 4 14
 5 16
 6 17
 7 18
 8 15;
 
param b := 
1 50
2 48
3 57
4 52
5 52
6 51;


param c :
 	1  2  3  4  5  6  7  8 :=
1   10 12 14 16 15 20 22 24
2   13 17 15 13 11 14 18 20
3   12 20 24 25 13 18 19 23
4   15 18 19 23 25 28 29 14
5   15 28 16 16 29 29 25 21
6   25 10 10 14 10 27 29 20;

param d := 
1 7
2 3
3 8
4 2
5 9
6 4
7 3
8 2;

param e := 
1 3 
2 4
3 2 
4 2 
5 3
6 5;

param offerta :=
1 240
2 320
3 500
4 210
5 600
6 330;

param domanda :=
1 200
2 90
3 310
4 100
5 350
6 650
7 240
8 260;

solve;
display x, smaltimento, z;
end;