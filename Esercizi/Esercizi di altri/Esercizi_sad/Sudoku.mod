# Sudoku

# DATI

set N  := 1..9;
set R  := 1..9;
set C  := 1..9;
set MR := 1..3;
set MC := 1..3;


# VARIABILI

var x {R,C,N} binary;

# VINCOLI

s.t. Assign_rn {r in R, n in N}:
	sum{c in C} x[r,c,n] = 1;

s.t. Assign_cn {c in C, n in N}:
	sum{r in R} x[r,c,n] = 1;

s.t. Assign_rc {r in R, c in C}:
	sum{n in N} x[r,c,n] = 1;

s.t. Assign3 {i in MR, j in MC, n in N}:
	sum{r in R, c in C: (r <= 3*i) and (r>= 3*i-2) and (r <= 3*j) and (r>= 3*j-2)} x[r,c,n] = 1;

# OBIETTIVO
# NO OBIETTIVO !!!!

data;

end;

