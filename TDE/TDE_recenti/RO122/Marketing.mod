set P; #Insieme dei prodotti
set M; #Insieme delle materie prime
set C; #Insieme dei componenti
param prezzo{P}; #Prezzo dei prodotti
param quantitaMP{M}; #Quantita delle materie prime [u]
param quantitaC{C}; #Quantità disponibili dei componenti[u]
param consumiMaterie{M, P}; #Consumi unitari delle materie prime[u]
param consumiComponenti{C, P}; #Consumi unitari dei componenti [u]

#Variabili
var x{P} >= 0; #Unità prodotte per ogni prodotto [u]
#Vincoli
#Disponibilità delle materie prime
s.t. disponibilitaMaterie {m in M}:
	sum {p in P} consumiMaterie[m,p] * x[p] <= quantitaMP[m];
#Disponibilità dei componenti
s.t. disponibilitaComponenti{c in C}:
	sum {p in P} consumiComponenti[c,p] * x[p] <= quantitaC[c];
#Q1: Massimizzare il profitto
maximize z:
	sum {p in P} x[p] * prezzo[p]; 
data;
set P := P1 P2 P3;
set M := M1 M2;
set C := C1 C2;
param quantitaMP :=
  M1            37000
  M2            32000;
   
param quantitaC :=
   C1         40000
   C2         47000;

param consumiMaterie :
	  P1    P2    P3 :=
M1    18    12    12
M2    15    12    11;

param consumiComponenti :
	  P1	P2	  P3 := 
C1    18    18    13
C2    25    18    12;

param prezzo:=
P1 900
P2 750
P3 600;


end;
