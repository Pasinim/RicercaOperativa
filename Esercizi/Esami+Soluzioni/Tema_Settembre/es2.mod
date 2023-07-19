#Sorvegliare incroci -> ogni sentinella sorveglia l'incrocio in cui è posta e quelli adiacenti. Le sentinelle devono controllarsi due a due
#Dati 

param nI;
set I := 1..nI;
param x {I};
param y {I};
param nS; 		
set S := 1..nS;

#Variabili
var w{S, I} binary; #variabile binaria che indica se la sentinella sorveglia l'incrocio

#Vincoli
subj to ass {i in I}: 
	sum {s in S} w[s,i] = 1;

#Ob
	
data;
param nI := 30;
param nS := 20; #numero arbitrario di sentinelle, nella funzione obiettivo devo minimizzare questa variabile
param:	x	y :=

		1 2 
		1 3 
		1 4 
		2 30 
		3 13 
		3 16 
		4 5 
		4 6 
		4 24 
		5 6 
		5 8 
		5 13 
		6 7 
		7 9 
		7 10 
		8 9 
		8 12 
		8 13 
		8 27 
		9 10 
		9 27
		10 11 
		11 23 
		11 29 
		12 13 
		12 18 
		12 19 
		12 27 
		13 14 
		14 15 
		14 18 
		15 16 
		15 17 
		18 19 
		18 28 
		19 20 
		19 28 
		20 21 
		20 22 
		20 29 
		24 25 
		24 26 
		27 29 
	;
	
end;
