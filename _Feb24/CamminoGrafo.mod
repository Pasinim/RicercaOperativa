reset; 
param nNodi;
set nodi := 1..nNodi;
set archi within nodi cross nodi;
param costi {nodi, nodi};
param s; #Nodo origine
param t; #Nodo target, destinazione
set E within archi cross archi ;  # Insieme delle coppie di archi incompatibili
set P within  archi cross archi ;  # Insieme delle coppie di archi che possono dare origine a penalità
param penalty := 5;
#da 1 a 8
var x{archi} binary; #India se l'arco fa parte del cammino;
var y{P} binary ;

s.t. nodoUscente_s:  sum {j in nodi: (s,j) in archi} x[s,j] = 1;
s.t. nodoEntrante_t: sum {j in nodi: (j,t) in archi} x[j,t] = 1;
s.t. conservazioneFlusso {i in nodi: (i<>s) and (i<>t)}:
	 sum {j in nodi: (i,j) in archi} x[i,j] =  sum {j in nodi: (j,i) in archi} x[j,i];

s.t. elementary_out {i in nodi}: sum{j in nodi: (i,j) in archi} x[i,j] <= 1;
s.t. elementary_in  {i in nodi}: sum{j in nodi: (j,i) in archi} x[j,i] <= 1;
  
s.t. incompatibilita_E {(i,j,k,l) in E}: x[i,j] + x[k,l] <= 1;  
s.t. penalita {(i,j,k,l) in P}: y[i,j,k,l] >= 1 - (x[i,j] + x[k,l]);

minimize z: sum {(i,j) in archi} costi[i,j]*x[i,j] + penalty * sum {(i,j,l,k) in P} y[i,j,l,k];
#minimize z: sum {(i,j) in A} c[i,j]*x[i,j] + p * sum {(i,j,k,l) in P} y[i,j,k,l];


data;
param s := 1;
param t := 8;
param nNodi := 8;
set archi :=
1 2,
1 3,
1 4,
2 5,
2 6, 
3 2, 
3 5,
3 6,
3 7, 
4 3,
4 6, 
4 7, 
5 6, 
5 7, 
5 8,
6 8,
7 6, 
7 8;

param costi :
    1   2   3   4   5   6   7   8 :=
1   .   10  15  18  .   .   .   .
2   .   .   .   .   20  19  .   .
3   .   4   .   .   17  11  10  .
4   .   .   5   .   .   23  18  .
5   .   .   .   .   .   3   18  14
6   .   .   .   .   .   .   .   9
7   .   .   .   .   .   10  .   4
8   .   .   .   .   .   .   .   .;

set E := 
    (1,3,3,7)
    (1,2,5,8)
    (1,4,7,8);
set P :=
	(5,8,7,8) 
	(1,2,1,4)
	(5,6,7,6);

solve;
display z;
end;
