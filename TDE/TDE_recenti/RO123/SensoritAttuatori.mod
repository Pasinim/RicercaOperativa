
param nS; #Numero di sensori
param nA; #Numero di attuatori
set S := 1..nS; #Insieme dei sensori
set A := 1..nA; #Insieme degli attutatori
set N := 1..nS+nA;
param u{S, A}; #Utilita dei dati trasmessi per ogni coppia sensore-attuatore [coeff]

var x{S, A} binary; #Variabile binaria di assegnamento sensore-attuatore

data;

end;
