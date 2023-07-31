param nM := 4;
set M := 1..nM;
param d{M}; #Domanda [tonnelalte]
param o{M}; #Offerta[t]
param p{M}; #prezzo [e/t]
param imm{M}; #costo immagazzinamento[e/kg]

var y{M} >= 0; #quantita immagazzinata[t]
var x{M} >= 0; #quantita di gelato da produrre nei mesi

#ogni mese si ha la produizione di quel mese + la giacenza di quello scorso = domanda di quel mese + la giacenza del mese corrente
subj to def_y {m in M: m>1}:
	x[m]+y[m-1] = d[m] + y[m];

subj to domanda_giugno:
	x[1] = d[1] + y[1];

subj to domanda {m in M: m > 1}:
	x[m] + y[m-1]>= d[m];

subj to produzione {m in M}:
	x[m] <= o[m];
	
minimize spesa:
	sum {m in M} ( x[m] * p[m] + y[m] * 1000 * imm[m]);

data;
param o :=
1 400
2 500
3 300
4 500
;

param imm :=
1 2 
2 3
3 2
4 3
;

param p :=
1 34
2 36
3 32
4 38
;


param d :=
1 200
2 300
3 500
4 400
;
end;

