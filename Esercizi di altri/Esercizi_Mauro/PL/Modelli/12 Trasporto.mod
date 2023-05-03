# Esercizio: Trasporto

# DATI
param nO;
param nD;
set Origini := 1..nO;
set Destinazioni := 1..nD;
param Offerta {Origini};
param Domanda {Destinazioni};
param Costi {Origini,Destinazioni};

# VARIABILI
var x {Origini,Destinazioni} >=0;    # Quantità trasportate da ogni origine ad ogni destinazione

# VINCOLI
# Vincoli sull'offerta alle origini
subject to Vincoli_offerta {o in Origini}:
  sum {d in Destinazioni} x[o,d] = Offerta[o];
  
# Vincoli sulla domanda nelle destinazioni
subject to Vincoli_domanda {d in Destinazioni}:
  sum {o in Origini} x[o,d] = Domanda[d];

# OBIETTIVO
minimize z: sum {o in Origini, d in Destinazioni} Costi[o,d] * x[o,d];

####
data;
####

param nO := 8;
param nD := 4;

param Costi:	1	2	3	4	:=
1				20	25	30	28
2				15	12	32	26
3				18	41	36	37
4				32	23	35	20
5				31	40	19	38
6				33	22	34	21
7				25	29	26	27
8				30	24	39	28;

param Offerta :=
1		30
2		40
3		20
4		35
5		40
6		30
7		25
8		50;

param Domanda :=
1	70
2	70
3	50
4	80;

end;
