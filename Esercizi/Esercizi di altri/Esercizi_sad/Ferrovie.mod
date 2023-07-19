# Esercizio Ferrovie

# DATI

param nS;						# Numero delle stazioni
set S := 0..nS;					# Insieme delle stazioni
set E within (S cross S);
param TT{E};					# Numero treni al giorno per tratta
param VT{E};					# Numero vagoni per ogni treno per ogni tratta
param CT{E};					# Capacità di ogni vagone [ton/vagone]
param nM;						# Numero merci
set M := 0..nM;					# Insieme delle merci
param VA{M};					# Valore delle merci [€/ton]
param LIM{S,M};					# Limiti scaricabili per ogni stazione [ton]

# VARIABILI

var flusso{E,M} >= 0;		    # Quantità di merce per ogni tratta [ton]

# VINCOLI

s.t. conservazioneDelFlusso{j in S, m in M : j not in {0,9}}:
	sum{ (i,j) in E} flusso[i,j,m] = sum{(j,i) in E} flusso[j,i,m];

s.t. capacitaArchi{(i,j) in E}:
	sum{m in M} flusso[i,j,m] <= CT[i,j]*VT[i,j]*TT[i,j];

s.t. capacitaNodi{i in S, m in M} :
	sum{(j,i) in E} flusso[j,i,m] <= LIM[i,m];

# OBIETTIVO

maximize z: sum{j in S,m in M: (0,j) in E} VA[m]*flusso[0,j,m];

########################

data;

param nS := 9;
param nM := 2;

set E := (0,1) (0,2) (1,3) (1,4) (2,4) (2,5) 
         (3,6) (3,7) (4,6) (4,7) (4,8) (5,7) 
		 (5,8) (6,9) (7,9) (8,9);

param LIM: 0 1 2 :=
0	1000 1000 1000
1   300  1800 1400
2	250  900  100
3   900  650  1400
4   2000 1500 2000
5   1000 1000 1000
6   1200 1200 1400
7   600  700  950
8   300  1700 1900
9   1000 1000 1000;


param VA :=
0	80
1	50
2	65;


param TT :=
[0,1] 4
[0,2] 4
[1,3] 2
[1,4] 3
[2,4] 8
[2,5] 1
[3,6] 5
[3,7] 4
[4,6] 3
[4,7] 3
[4,8] 3
[5,7] 4
[5,8] 4
[6,9] 3
[7,9] 5
[8,9] 2;

param VT :=
[0,1] 10
[0,2] 8
[1,3] 10
[1,4] 6
[2,4] 2
[2,5] 8
[3,6] 4
[3,7] 6
[4,6] 5
[4,7] 4
[4,8] 5
[5,7] 18
[5,8] 10
[6,9] 9
[7,9] 3
[8,9] 11;

param CT :=
[0,1] 20
[0,2] 15
[1,3] 20
[1,4] 20
[2,4] 16
[2,5] 16
[3,6] 16
[3,7] 16
[4,6] 16
[4,7] 16
[4,8] 16
[5,7] 10
[5,8] 10
[6,9] 18
[7,9] 20
[8,9] 18;


end;


