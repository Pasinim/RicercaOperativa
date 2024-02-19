reset;
param nS; #Numero di sensori
param nA; #Numero di attuatori
set S := 1..nS; #Insieme dei sensori
set A := 1..nA; #Insieme degli attutatori
set nodi := 1..nS + nA;
set E within S cross A;
param u{S, A}; #Utilita dei dati trasmessi per ogni coppia sensore-attuatore [coeff]

var x{S, A} binary; #Variabile binaria di assegnamento sensore-attuatore
#Variante 1
#Ogni sensore può trasmettere ad un solo attuatore (o a nessuno) 
s.t. univocitaSensori {s in S}: sum{a in A} x[s,a] <= 1;
#ogni attuatore può ricevere da un solo sensore (o da nessuno)
s.t. univocitaAttuatori {a in A}: sum{s in S} x[s,a] <= 1;
#Ogni sensore deve avere un attuatore associato:
#s.t. assegnamentoSensori {s in S}: sum {a in A} [s,a] = 1;

s.t. elementary_out {i in nodi}: sum{j in nodi: (i,j) in E} x[i,j] <= 1;
s.t. elementary_in  {i in nodi}: sum{j in nodi: (j,i) in E} x[j,i] <= 1;

maximize utilita: sum{s in S} sum{ a in A}  u[s,a] * x[s,a];
data;
param nS := 6;
param nA := 6;
param u :
	1	2	3	4	5	6 := 
1	1	10	15	47	68	130
2	9	4	7	18	40	98
3	15	10	5	10	23	82
4	45	18	9	8	14	50
5	67	50	31	24	13	29
6	131	100	82	50	26	14;
solve;
display univocitaSensori, univocitaAttuatori, utilita, x;
end;


