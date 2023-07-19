# Bilanciamento containers

# DATI

param nP;                          # Numero porti
set P := 1..nP;                    # Insieme dei porti
param nC;                          # Numero tipi container
set C := 1..nC;                    # Insieme dei container
set T within {P cross P};          # Insieme delle tratte
param sb{C,P};                     # Sbilanciamento in numero di container per tipo di ogni porto
param capA{T};                    # Capacità delle tratte in numero di container per tipo
param capB{T};                    # Capacità delle tratte in numero di container per tipo
param costo{T};                    # Costro trasporto di un container per tratta
param cNoleggio;                   # Costo noleggio di un container

# VARIABILI

var flusso{T,C}  >= 0 ;  			# Numero di container della tratta (i,j), entrati in j da i.    
var flusso2{T,C} >= 0 ;  			# Numero di container della tratta (i,j), entrati in i da j.       

#  VINCOLI

s.t. flussoPositivo{i in P, k in C}:
    sum{j in P: (i,j) in T} flusso[i,j,k] 
    - sum{j in P: (i,j) in T} flusso2[i,j,k] 
    <= sb[k,i];

/*
s.t. massimoTratta11{i in P, j in P : (i,j) in T}:
	flusso[i,j,1]  <= capA[i,j];
s.t. massimoTratta12{i in P, j in P : (i,j) in T}:
	flusso[i,j,2]  <= capB[i,j];

s.t. massimoTratta21{i in P, j in P : (i,j) in T}:
	flusso2[i,j,1] <= capA[i,j];
s.t. massimoTratta22{i in P, j in P : (i,j) in T}:
	flusso2[i,j,2] <= capB[i,j];
	*/

# OBIETTIVO

minimize z: sum{i in P,j in P, k in C: (i,j) in T} (flusso[i,j,k]*costo[i,j] + flusso2[i,j,k]*costo[i,j]);

data;

param nP := 8;
param nC := 2;
set T := 1,4 2,4 1,3 2,8 4,3 3,8 3,5 8,5 3,7 8,6 8,7 5,7 5,6 6,7;

param sb :  1 2 3 4 5 6 7 8 :=
1  19   15   -12   9   -24   -2   -3   -2
2 -12   23   -9   18   -2   -22   -18  22;

param capA:=
1,4        25 
2,4        18 
1,3        20 
2,8        20 
4,3        10 
3,8         8 
3,5        26  
8,5        15  
3,7        20  
8,6        24 
8,7        28 
5,7        10 
5,6        12 
6,7        10 ;

param capB:=
1,4         15
2,4        12
1,3        10
2,8        18
4,3        10
3,8          13
3,5          8
8,5          4
3,7        5
8,6        20
8,7        15
5,7        20
5,6        20
6,7        20;

param costo :=
1,4        150
2,4        120
1,3        180
2,8        200
4,3        180
3,8        110
3,5        230
8,5        190
3,7        250
8,6        270
8,7        210
5,7        220
5,6        110
6,7        120;


end;




