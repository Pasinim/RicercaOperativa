# Eserciczio Spin glass

# DATI

param n;
set N := 1..n;
param a{N,N};
param B{N};

# VARIABILI
var x{N} binary;	# spin di ogni particella

# VINCOLI 


# OBIETTIVO

maximize E: sum{i in N,j in N : i < j} a[i,j]*(2*x[i]-1)*(2*x[j]-1)
			+ sum{i in N} B[i] * (2*x[i]-1);

###########################

data;

param n := 9;


param a : 1 2 3 4 5 6 7 8 9 :=
1  3 -1 -4  5 -8  4 -2 -3 -1
2  -1  -2  2 -4  7 -1  2 -2  2
3  -4 2     -3 -3 -3  5 -2 -1 -3
4  5 -4 -3         2 -1 -2 -2 -2 -7
5  -8 7 -1 -1            3 -7  7 -2  8
6  4 -1 5 -2 -7              -5  3 -3 -1
7  -2 2 -2 -2 7  3                -1  9 -5
8  -3 -2 -1 -2 -2 -3 9                    1  9
9   -1 2 -3 -7 8 -1 -5 9                      -6;   
 
param B :=         
1 1 
2 8
3 2 
4 9 
5 1 
6 9 
7 1
8 8 
9 2 ;            
                       
end;