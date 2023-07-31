# Esercizio Dieta

# DATI

param nA;				# Numero alimenti
set A := 1..nA;			# Insieme degli alimenti
param nS;				# Numero sostanze nutritive
param nS1;				# Numero sostanze nutritive bis
set S := 1..nS;			# Insieme delle sostanze nutritive
set S1:= 1..nS1;		# Insieme delle sostanze nutritive bis
param sA{S,A};			# Sostanze in % per 100 g di alimento (o 100 ml se liquido).
param s1A{S1,A};		# % di fabbisogno giornaliero che soddisfano 100g di alimento.
param c{A};				# Costi in lire per ogni kg di alimento.
param limInf{S};		# Limite inferiore in percentuale
param limSup{S};		# Limite superiore in percentuale

# VARIABILI

var q{A} >= 0;				# Quantitò di cibo assunta in etti.


# VINCOLI

s.t. fosforoECalcio{i in S1} :
	sum{j in A} q[j] * s1A[i,j] = 100;
	
s.t. minimo {i in S}:
	sum{j in A} (sA[i,j]/100)*q[j] >= (limInf[i]/100) * sum{j in A} q[j];

s.t. massimo {i in S}:
	sum{j in A} (sA[i,j]/100)*q[j] <= (limSup[i]/100)* sum{j in A} q[j];
	


# OBIETTIVO

minimize z : sum{i in A} (q[i]/10) *c[i];



################

data;

param nA := 9;
param nS := 3;
param nS1:= 2;

param sA : 1 2 3 4 5 6 7 8 9:=
1	11.5        3.15        8          33         18.5          2.1         2.4    12.0    9
2	72.7        4.85        3.8 	    0          0.5          0          0.6    68     74
3	 1.5        1.55       11   	   28.4       19            0.1        0.5     6      1;

param s1A : 1 2 3 4 5  6 7 8 9 :=
1	 0	       15          52.5       139          0            1.25       0	   0	  0
2	 0          0          28          85         20            6.05       0	   0	  0;


param limInf :=
1  25
2  15
3  10;

param limSup :=
1 35
2 25 
3 20;

param c :=
1 2000  
2 2200    
3 16000       
4 29000     
5 22500   
6 3500    
7 5000    
8 7000   
9 10000;

end;
