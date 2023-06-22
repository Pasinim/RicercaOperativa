param nS := 6; #Numero di strumenti
param nT := 9; #Numero di intervalli temporali
set s := 1..nB;
set t := 1..nT;

param p{t, s}; #Produzioneper ogni strumento [Mb]
param c{s}; #grandezza memoria [Mb]
param occ_c{s}; #occupazione iniziale memoria [Mb]
param time{t}; #tempo disponibile per la trasmissione [s]
param birate{t}; #bitrate per ogni intervallo [kbit/s]

#Var
var x{t,s}; #dati letti (scaricati) per ogni  strumento prer intervallo di tempo [Mbit]

#Vincoli
subj to max_capacita {j in s}:
	sum {i in t} p[i,j] <= c[j];



#Ob
# obiettivo del pianificatore delle trasmissioni è di mantenere il più basso possibile in ogni banco di memoria il rapporto tra il livello di occupazione e la capacità
minimize z:
	

data;
param p :	1	2	3	 4	   5	6 :=
		1   4   11   31    3   18   27
		2   6    8   34    4   19   23
		3   7   23   38    5   21   19
		4   3   31   35    6   15   18
		5   3   14   37    7   14   23
		6   8    8   35    6   14   24
		7   1   10   31    5   14   25
		8   3   20   40    4   18   20
		9   4   13   28    5   19   13
;

param c := 
    1         32
    2         60
    3        100
    4         30
    5         50
    6         80
;

param occ_c :=
	1         8      
    2        15      
    3        25      
    4         5      
    5        16      
    6        23    
;

param time :=
   1          490      
   2          420      
   3          460      
   4          485      
   5          400      
   6          455      
   7          480       
   8      	  380      
   9          450      
;

param bitrate :=
   1          195
   2          160
   3          180
   4          195
   5          160
   6          180
   7          195
   8          160
   9          180
   ;
   
end;

