# ESERCIZIO PLI 83.2 - Alpinisti

#NOTA: la soluzione non è unica poiché non vi è alcun vincolo esclusivo sui Team, quindi si può generare una soluzione equivalente assegnando i membri a sqaudre diverse (se tutti i membri del Team2 vanno nel Team1 e viceversa ad esempio, la soluzione rimane ugualmente ottima)

#DATI

param nT;		# Numero di Team
param nA;		# Numero di Alpinisti
param nS;		# Numero di Skill
set T:=1..nT;	# Insieme dei Team
set A:=1..nA;	# Insieme degli Alpinisti
set S:=1..nS;	# Insieme di Skill
param r{A};		# Rischio relativo all'Alpinista
param c{A,S};	# Competenza in una Skill
param lc{S};	# Livello complessivo richiesto da ogni Team
param ApT;		# Numero di Alpinisti per Team

#VARIABILI
var x{A,T} binary;	#assegnamento Alpinista-Team

#VINCOLI

#ogni Alpinista può appartenere ad un solo Team
subj to Assign{a in A}: sum{t in T} x[a,t] <= 1;

#ogni Team deve essere composto da ApT persone
subj to Formation{t in T}: sum{a in A} x[a,t] = ApT;

#ogni Team deve soddisfare i requisiti di Skill
subj to Level{t in T, s in S}: sum{a in A} x[a,t] * c[a,s] >= lc[s];

#OBIETTIVO
minimize z: sum{t in T, a in A} r[a] * x[a,t];

####################################

data;

param nA:=20;
param nT:=4;
param ApT:=4;
param nS:=3;

param c: 1  2  3:=
 1       3  2  5
 2       3  2  5
 3       4  5  4
 4       4  5  5
 5       2  4  4
 6       1  4  4
 7       2  5  3
 8       5  5  3
 9       4  5  4
10       5  3  5
11       3  2  5
12       3  5  4
13       4  5  5
14       4  5  4
15       5  4  2
16       5  4  2
17       5  4  3
18       3  1  4
19       4  3  5
20       5  5  4;

param r:=
 1              0.21
 2              0.15
 3              0.12
 4              0.11
 5              0.12
 6              0.14
 7              0.08
 8              0.10
 9              0.05
10              0.19
11              0.13
12              0.01
13              0.07
14              0.15
15              0.18
16              0.16
17              0.09
18              0.08
19              0.02
20              0.10;

param lc:=
 1         16
 2         16
 3         16;

end;
