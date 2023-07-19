# Esercizio: Consumo degli elettrodomestici

# DATI
param nG;                # Numero di giorni
param nED;               # Numero di elettrodomestici
set Giorni := 1..nG;     # Insieme dei giorni
set ED     := 1..nED;    # Insieme degli elettrodomestici
param consumo {Giorni};  # Consumo complessivo misurato in ogni giorno [KWH]
param tempo {Giorni,ED}; # Tempo di funzionamento di ogni elettrodomestico in ogni giorno [min]

# VARIABILI
var x {ED} >=0;          # Potenza assorbita da ogni elettrodomestico [KW]
var err {Giorni};        # Approssimazione nel rilevamento dei consumi in ciascun giorno [KWH]
var z2;                  # Variabile ausiliaria: valore assoluto della media degli errori [KWH]

# VINCOLI
# Definizione dell'errore di rilevamento dei consumi [KWH]
subject to Def_errore {g in Giorni}:
  err[g] = consumo[g] - sum {e in ED} tempo[g,e] * x[e];

# OBIETTIVO
# Minimizzazione del valore assoluto della media degli errori [KWH]
minimize abs_avg_err: z2;
# Vincoli per linearizzare la funzione obiettivo
subject to minmax1: z2 >=  sum {g in Giorni} err[g]/nG;
subject to minmax2: z2 >= -sum {g in Giorni} err[g]/nG;

#####
data;
#####

param nG := 12;
param nED := 8;

param consumo :=
 1		10
 2		20
 3		10
 4		15
 5		 5
 6		10
 7		10
 8		20
 9		12
10		25
11		 2
12		 5;

param tempo:	1	2	3	4	5	6	7	8 :=
1				0.2	0.4	0.5	0.6	0.6	0.5	0.2	0.2
2				0.1	1.0	0.1	1.2	1.1	1.0	0.6	0.3
3				0.1	0.5	0.5	0.7	0.5	0.5	0.1	0.2
4				0.2	0.6	0.6	0.8	0.6	0.6	0.2	0.3
5				0.1	0.4	0.2	0.3	0.2	0.2	0.0	0.2
6				0.2	0.5	0.4	0.7	0.5	0.4	0.2	0.3
7				0.3	0.4	0.5	0.8	0.4	0.4	0.2	0.2
8				0.6	0.8	1.0	1.5	1.3	0.6	0.5	0.6
9				0.3	0.4	0.5	0.7	0.5	0.5	0.3	0.2
10				0.5	0.9	1.1	1.3	0.9	1.2	0.8	0.5
11				0.0	0.2	0.0	0.0	0.1	0.0	0.0	0.1
12				0.0	0.5	0.2	0.3	0.2	0.1	0.1	0.3;

end;
