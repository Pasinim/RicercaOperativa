#ESERCIZIO 82 - PNL Spin Glass

#DATI
param nP;									# Numero particelle
set P := 1..nP;								# Insieme delle particelle
param e {i in P,j in P: i<>j};			# Energia di interazione tra spin opposti
param h {P};

#VARIABILI
#L'orientamento delle particelle
var x {P} binary;							# 1=su, 0=giu'

#VINCOLI
#Non ci sono vincoli

#OBIETTIVO
minimize z: sum {i in P, j in P: i<j} -e[i,j] * (2*x[i]-1) * (2*x[j]-1);  

###############
data;

param nP := 9;

param e:	 1	 2	 3	 4	 5	 6	 7	 8	 9	:=
1			 .	-1	-4	 5	-8	 4	-2	-3	-1
2			-1	 .	 2	-4	 7	-1	 2	-2	 2
3			-4	 2	 .	-3	-3	 5	-2	-1	-3
4			 5	-4	-3	 .	-1	-2	-2	-2	-7
5			-8	 7	-3	-1	 .	-7	 7	-2	 8
6			 4	-1	 5	-2	-7	 .	 3	-3	-1
7			-2	 2	-2	-2	 7	 3	 .	 9	-5
8			-3	-2	-1	-2	-2	-3	 9	 .	 9
9			-1	 2	-3	-7	 8	-1	-5	 9	 .;

param h :=
1		1
2		8
3		2
4		9
5		1
6		9
7		1
8		8
9		2;

end;
