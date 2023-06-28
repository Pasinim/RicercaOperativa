# DATI
param N; # quantità di punti
set P := 1..N; # insieme dei punti 
param x{P}; # coordinate x a disposizione
param y{P}; # coordinate y a disposizione
param e := 2.71828;

# VARIABILI

var k; # scalatara della funzione;
var tx integer; # traslazione orizzontale della funzione;
var ty; # traslazione verticale della funzione;
var delta;
var newX{P};
var errori{P};

# VINCOLI

# definizione delle newX
subject to defNewX {p in P} :
    newX[p] = x[p] + tx; 

# definizione degli errori
subject to DefErrori {p in P}:

    #               y calcolata          traslazione verticale       y osservato
	errori[p] = (e^(x[p])/(1+e^(x[p])) + ty)                         - y[p]; 


# OBIETTIVO
# minimizzare il massimo errore in valore assoluto;
#    minimize z : delta;
#    subject to MaxValorePos {p in P}:
#    	delta >= errori[p];
#    subject to MaxValoreNeg {p in P}:
#    	delta >= -errori[p];

# minimizzare la somma degli errori in valore assoluto 
   minimize z : sum {p in P} abs(errori[p]);



######################

data;
param N := 12;





param :  x       y :=
 1  	 2	    28
 2  	 1	    20
 3  	 8	    40
 4  	 5	    36
 5  	-6	    16
 6  	-2	    16
 7  	 0	    16
 8  	-3	    16
 9  	 7	    40
10  	 6	    40
11  	-4	    16
12  	 3	    32;


end;
