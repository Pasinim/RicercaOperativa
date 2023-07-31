# Esercizio Investimenti

# Dati

param nN;			# Numero nazioni
set N := 1..nN;		# Insieme delle nazioni
param nF;			# Numero dei fondi, uguale al numero delle azioni
set F := 1..nF;		# Insieme dei fondi
set A := 1..nF;		# Insieme delle azioni
param nM;			# Numero di mercati
set M := 1..nM;		# Insieme dei mercati
param R{F,M};		# Rendimento percentuale di ogni fondo per mercato.
param massimo{A,M};	# Tetto massimo comprabile per ogni azione in milioni di euro.
param cA{F,A};		# Composizione fondi americani
param cE{F,A};		# Composizione fondi europei
param cG{F,A};		# Composizione fondi giapponesi
param cap{N};		# Capitale in milioni di euro in ogni nazione

# Variabili

var inv{F,M} >= 0;		# Investimenti in milioni di euro per ogni fondo di ogni mercato

# Vincoli

s.t. maxAcquistabileA{i in A}:
	sum{j in F} (cA[j,i]/100)*inv[j,1] <= massimo[i,1];
s.t. maxAcquistabileE{i in A}:
	sum{j in F} (cE[j,i]/100)*inv[j,2] <= massimo[i,2];
s.t. maxAcquistabileG{i in A}:
	sum{j in F} (cG[j,i]/100)*inv[j,3] <= massimo[i,3];

s.t. massimoCapitale:
	sum{i in M, j in F} inv[j,i] <= sum{i in N} cap[i];

# Obiettivo

maximize z : sum{i in F,j in M} inv[i,j]*R[i,j]/100;

###################

data;

param nF := 4;
param nM := 3;
param nN := 3;

param R: 1		 2		 3 :=
1		35		10		40
2		10		30		30
3		60		80		20
4		40		30		10;

param massimo: 1 	2	 	3:=
1			 100  150	  110
2			 100  120	   90
3			  79   80	  200
4			  98   90	  130;

param cA: 1 2 3 4 :=
1    50     10     25     20
2    30     80     20      0
3    20      0     35     30
4     0     10     20     50;

param cE: 1 2 3 4 :=
1       90        20            0          10
2       10        30           20          70
3        0        40            0          10
4        0        10           80          10;

param cG: 1 2 3 4 :=
1        70       0     10       20
2        20      10     50       20
3 		 10      10     30       60
4         0      80     10        0;

param cap := 
1	433
2	320
3	377;
end;
