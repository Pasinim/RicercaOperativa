reset;
param nS; #Numero di sensori
param nA; #Numero di attuatori
set S := 1..nS; #Insieme dei sensori
set A := 1..nA; #Insieme degli attutatori
param u{S, A}; #Utilita dei dati trasmessi per ogni coppia sensore-attuatore [coeff]
var y{S, A} binary; #Variabile binaria di assegnamento sensore-attuatore
#Variante 1
#Ogni sensore può trasmettere ad un solo attuatore (o a nessuno) 
s.t. univocitaSensori {s in S}: sum{a in A} y[s,a] >= 0;
#ogni attuatore può ricevere da un solo sensore (o da nessuno)
s.t. univocitaAttuatori {a in A}: sum{s in S} y[s,a] >= 0;

maximize utilita: sum{s in S, a in A}  u[s,a] * y[s,a];
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
display utilita, y;
end;


