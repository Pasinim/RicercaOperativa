# Esercizio Libri

# DATI

param nM;			# Numero Magazzini
set M := 1..nM;		# Insieme dei magazzini
param qM{M};		# Quantità di copie stampate per magazzino
param nD;			# Numero delle destinazioni
set D := 1..nD;		# Insieme delle destinazioni
param cap{M,D};		# Capacità di ogni tratta
param costi{M,D};	# Costi di spedizione per ogni libro [€]
param ri{D};		# Libri richiesti da ogni destinazione
param costiB{M,D};  # Costi di spedizione base per ogni libro [€]

# VARIABILI

var q{i in M,j in D} integer >= 0 <= cap[i,j];			# Quantità di libri per ogni tratta

# VINCOLI

s.t. soddisfa{i in D}:
	ri[i] <= sum{j in M} q[j,i] ;

s.t. numeroCopieDisponibili{j in M}:
	sum{i in D} q[j,i] <= qM[j];

# OBIETTIVO

#minimize z: sum{i in M,j in D} costi[i,j]*q[i,j];

minimize z: sum{i in M,j in D}q[i,j]*(costiB[i,j]/(1 - (q[i,j]/cap[i,j])));

##############

data;

param nM := 3;
param nD := 4;

param costiB : 1 2 3 4 :=
1 			3.9 1.4 1.1 1.4
2 			2.7 0.9 1.2 0.9
3 			2.4 1.4 1.7 1.3;

param ri:=
1 1000
2 1200
3 700
4 500;

param costi : 1 2 3 4 :=
1 7.5 2.6 1.7 1.6
2 6.4 2.2 2.0 1.5
3 5.8 2.4 1.8 1.4;

param cap : 1 2 3 4 :=
1 500 1000 1000 1000
2 500 800 800 800
3 800 600 600 600;

param qM := 
1	1200
2	1400
3	800;

end;
