# Profitable scheduling

# DATI

param nJ;
param nM;
set J := 1.. nJ;
set M := 1..nM;
param c {J,M};
param t {J,M};
param p {J};
param q1{M};
param q2{M};
param cjm {J,M};
param cjj {J,J};

# VARIABILI

var x {j in J,m in M} binary <= cjm[j,m]; 		#Assegnamento

# VINCOLI

s.t. Assignment {j in J}:
	sum {m in M} x[j,m] <= 1;

s.t. Capacity{m in M}:
	sum {j in J} t[j,m] * x[j,m]  <= q1[m];

s.t. Incompatibility {j1 in J, j2 in J, m in M : j1 <>j2}:
	 x[j1,m] + x[j2,m]  <= cjj[j1,j2] + 1;

# Obiettivo

minimize penalty: sum{j in J} p[j] * (1 - sum{m in M} x[j,m]);

s.t. max_pen: sum{j in J} p[j] * (1 - sum{m in M} x[j,m]) = 10;

#minimize z :{j in J, m in M} c[j,m] * x[j,m];

################
data;

param nJ := 9;
param nM := 3;

param c := 
1 24 42 23 
2 30 45 23 
3 33 54 16 
4 37 45 10 
5 34 47 22
6 31 42 25
7 30 41 19 
8 28 47 15 
9 25 50 20;

param t :=
1 100 95 107
2 111 108 115
3 98 96 103
4 132 128 133
5 120 118 119
6 115 117 114
7 142 145 140
8 123 125 120
9 90 95 88;

param p :=
1	10
2	10
3	10
4	10
5 	15
6	15
7	15
8	15
9	20;

param q1 :=
1 380
2 360
3 350;
param q2 :=
1 360
2 330
3 320;

param cjm: 1 2 3 :=
1 		   1 0 1
2          1 0 1
3          1 1 1 
4          1 1 0
5          1 1 0
6          1 1 1
7          1 1 1
8          0 1 1
9          0 1 1;

param cjj: 
  1 2 3 4 5 6 7 8 9 :=
1 1 0 1 1 1 1 1 1 1 
2 0 1 1 1 1 1 1 1 1 
3 1 1 1 0 1 1 1 1 1 
4 1 1 0 1 1 1 1 1 1 
5 1 1 1 1 1 0 1 1 1 
6 1 1 1 1 0 1 1 1 1
7 1 1 1 1 1 1 1 0 0
8 1 1 1 1 1 1 0 1 0
9 1 1 1 1 1 1 0 0 1;


end;
