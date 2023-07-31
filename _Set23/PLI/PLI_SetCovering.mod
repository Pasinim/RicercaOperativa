param nU := 5;
param nL := 10;
set U := 1..nU;
set L := 1..nL;
param m{U, L}; 
param c{L};

var x{L} binary;

#Ogni utente deve avere un luogo assegnato
subj to copertura{u in U}:
	sum {l in L} x[l] * m[u,l] >= 1;
	
minimize costo:
	sum{ j in L} x[j] * c[j];


#Dati un insieme di luoghi da cui si pu`o erogare un servizio, ciascuno con un dato costo corrispondente, ed un insieme di utenti che possono ricevere il servizio
#ciascuno da alcuni dei luoghi, decidere da dove erogare il servizio in modo da
#minimizzare il costo complessivo

data;
param m : 1 2 3 4 5 6 7 8 9 10 :=
1	 1 0 0 0 1 1 1 0 1 1 
2	 0 0 0 1 1 0 0 0 1 0
3	 0 0 0 0 1 1 0 0 0 0
4	 0 0 0 0 0 0 1 1 1 0
5	 1 1 1 0 0 0 0 1 1 1
;

param c :=
1 205
2 311
3 450
4 274
5 321
6 469
7 327
8 631
9 750
10 400
;

end;

