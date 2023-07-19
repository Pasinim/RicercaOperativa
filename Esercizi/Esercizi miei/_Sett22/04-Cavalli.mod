set cavalli;
param b := 57; #budget [eur]
param quota {cavalli};

#Variabili
var p {cavalli} >= 0; #puntata per ogni cavallo [eur]
var y >= 0; #vincita minima

#Vincoli 
subject to budget:
    sum {c in cavalli} p[c] <= b;

#variabile ausiliaria che permette di espirmere "minimo di".
#"minimo di" non è una funzione lineare, quindi devo linearizzare
subject to Linearizzazione {c in cavalli}:
    y <= quota[c] * p[c];
    
#Obiettivo
maximize vincita: y;

data;
set cavalli := FULMINE FRECCIA DARDO LAMPO;
param quota :=
FULMINE 3
FRECCIA 4
DARDO 5
LAMPO 6
;

end;