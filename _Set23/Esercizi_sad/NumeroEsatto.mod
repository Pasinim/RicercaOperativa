# Numero esatto

# DATI
set E := 0..9;
set C := 0..9;
set P := 1..4;
param Perm{P,C,E} default 0;


# VARIABILI

var x{C,E} binary;

# VINCOLI

s.t. AA :
	sum{ c in C, e in E} x[c,e] * Perm[1,c,e] = 8;

s.t. BB :
	sum{ c in C, e in E} x[c,e] * Perm[2,c,e] = 2;

s.t. CC :
	sum{ c in C, e in E} x[c,e] * Perm[3,c,e] = 1;

s.t. DD :
	sum{ c in C, e in E} x[c,e] * Perm[4,c,e] = 4;

s.t. Assign_Cifre{c in C}:
	sum{e in E} x[c,e] = 1;

s.t. Assign_posizioni{e in E}:
	sum{c in C} x[c,e] = 1;

###############

data;

/*param Perm: 0 1 2 3 4 5 6 7 8 9 :=
1	 		2 4 5 3 1 6 9 0 8 7
2		    6 8 7 1 2 0 9 4 3 5 
3	 		3 0 9 2 1 8 4 5 7 6 
4		    2 4 1 3 0 8 9 5 7 6;*/


param Perm :=
[1,2,0] 1 
[1,4,1] 1
[1,5,2] 1
[1,3,3] 1
[1,1,4] 1
[1,6,5] 1
[1,9,6] 1
[1,0,7] 1
[1,8,8] 1
[1,7,9] 1

[2,6,0] 1 
[2,8,1] 1
[2,7,2] 1
[2,1,3] 1
[2,2,4] 1
[2,0,5] 1
[2,9,6] 1
[2,4,7] 1
[2,3,8] 1
[2,5,9] 1

[3,3,0] 1 
[3,0,1] 1
[3,9,2] 1
[3,2,3] 1
[3,1,4] 1
[3,8,5] 1
[3,4,6] 1
[3,5,7] 1
[3,7,8] 1
[3,6,9] 1

[4,2,0] 1 
[4,4,1] 1
[4,1,2] 1
[4,3,3] 1
[4,0,4] 1
[4,8,5] 1
[4,9,6] 1
[4,5,7] 1
[4,7,8] 1
[4,6,9] 1;





end;

