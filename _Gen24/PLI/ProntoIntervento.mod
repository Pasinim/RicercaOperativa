param nO;
set O := 1..nO; #Insieme degli obioettivi sensibili
set S := 1..3;
set L := 1..6; #Insieme dei luoghi
param time {L, O};


var x{S, L} binary; #Variabile di localizzazione, indica il luogo in cui possono essere posizionate le squadre
var y{O, L} binary; #Coppia Obiettivo-luogo
var z >= 0; #Tempo di reazione massimo


#E’ necessario anche introdurre vincoli che legano le variabili di assegnamento a
#quelle di localizzazione: tali vincoli impongono che un obiettivo non può essere
#assegnato ad un luogo se in quel luogo non è stata localizzata una squadra.
s.t. Vincolo1{o in O, l in L}: y[o,l] = sum{s in S} x[s,l];
#E’ necessario poi imporre che il numero di variabili di localizzazione poste a 1 sia
#pari al numero di sqquadre disponibili e anche che il numero di assegnamenti per ogni
#obiettivo sia pari a 1.
s.t. Vincolo2{l in L}: sum{s in S} x[s,l] = 3;

#Minimizzare il tempo di intervento di ogni squadra
s.t. def_z{s in S, l in L}:
	z >= sum {o in O} (time[l,o] * y[o,l]) *  x[s,l];

#Minimizzare il tempo di reazione massimo
minimize z1: z;

data;
param nO := 7; #Numero di obiettivi
param time : 
  1 2 3 4 5 6 7:= 
1 0 9 7 15 3 4 2
2 12 0 2 14 8 4 3
3 6 4 9 9 19 11 15
4 5 1 8 0 6 12 17
5 2 10 11 10 0 6 20
6 8 7 15 5 5 0 12;
end;
