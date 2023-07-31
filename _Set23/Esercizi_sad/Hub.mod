#  Esercizio Hub

# DATI

param nH;		# Numero degli hub
set H := 0..nH; # Insieme degli hub
set E within H cross H;	# Insieme degli archi
param nM;		# Numero di merci
set M := 0..nM; # Insieme dei merci
param nO;       # Numero delle origini
set O := 0..nO;	# Insieme delle origini
param qnt{O,M}; # Quantità merce da ogni origine 
param capArchi{E}; # Capacità di ogni arco (massimo trasportabile in una tratta)
param prezzi{E,M}; # Prezzi

# VARIABILI



# VINCOLI

# OBIETTIVO

data;

param nM := 1;
param nH := 6;
param nO := 1;

set E:=
0 2,
1 2,
1 3,
2 3,
2 5,
3 4,
4 5,
4 6,
5 6;


param qnt:    1    2 :=
0            6    5
1            4    7;

param capArchi :=
0,2        11
1,2        2
1,3        9
2,3        9
2,5        6
3,4        13
4,5        4
4,6        8
5,6        12;

/*
param c:1    2 :=
0,2        2    3
1,2        4    1
1,3        6    5
2,3        8    8
2,5        3    2
3,4        3    2
4,5        6    5
4,6        3    3
5,6        2    2;
*/

param prezzi :=
[*,*,1]:=
0,2        2
1,2        4
1,3        6
2,3        8
2,5        3
3,4        3
4,5        6
4,6        3
5,6        2
[*,*,2] :=
0,2            3
1,2            1
1,3            5
2,3            8
2,5            2
3,4            2
4,5            5
4,6            3
5,6            2;


end;
