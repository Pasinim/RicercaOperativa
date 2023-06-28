

# DATI

set C; # Insieme di chitarre
set R; # Insieme di reparti

param c{C}; # ricavo unitario di ogni chitarra
param a{R}; # Numero di addetti per ogni reparto
param t{R,C}; # Tempi necessari alla lavorazione delle chitarre in ogni stadio (ore/unita) 


# VARIABILI
var x{C}; # produzione di chitarre

# VINCOLI

subject to NumeroMinimo :
    sum {i in C} x[i] >= 100; # numero minimo di chitarre che posso produrre

subject to Produzione {i in R}:
    sum {j in C} x[j]* t[i,j] <= a[i] * 8 * 5; # 8 ore 5 giorni a settimana



# OBIETTIVO
maximize z: sum {i in C} x[i]* c[i];



data;

set C := De_Paoli LittleDiablo Stradivarius;
set R := Falegnameria Elettrotecnica Liuteria;       


# Ricavo per unita di produzione di chitarre (euro/unita)

param c :=
De_Paoli 350
LittleDiablo 160
Stradivarius 100;


# Numero di addetti in ogni reparto
param a := 
Falegnameria           10
Elettrotecnica          5
Liuteria                3;



# Ogni addetto lavora 8 ore al giorno, per 5 giorni ogni settimana.



# Tempi necessari alla lavorazione delle chitarre in ogni stadio (ore/unita)

param t:		   De_Paoli   LittleDiablo	  Stradivarius :=

Falegnameria       2          4               1
Elettrotecnica     2          4               1.5
Liuteria           4          1               1;

#La quantit‡ minima di chitarre da produrre Ë 100 unit‡ ogni settimana.

end;
