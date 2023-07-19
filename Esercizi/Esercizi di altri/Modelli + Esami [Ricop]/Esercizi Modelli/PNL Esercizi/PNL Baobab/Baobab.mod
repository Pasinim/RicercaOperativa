#ESERCIZIO PNL Baobab

#DATI

param f;			#Costi fissi [Euro]
param v;			#Costi variabili [Euro/kg]
param k;			#Coefficiente di proporzionalita' [Euro/ sqrt(Kg mese)]
param V;			#Quantita' massima che il mercato puo' assorbire [Kg/mese]
param Pmax;			#Prezzo massimo di vendita' [Euro/kg]

#VARIABILI
# Dobbiamo decidere la quantita' di produzione (una sola variabile)
var x >= 0, <=V, :=70;			#Quantita' acquistata, prodotta e venduta [Kg/mese]

#VINCOLI
#Siccome sono dei upperbound, i vincoli li possiamo scrivere nella sezione VARIABILI

#OBIETTIVO
# Massimizzare i ricavi netti (Ricavi - Costi)
maximize z: Pmax * x - v * x - k * sqrt(x);

############################
data;

param f := 1000;
param v := 10;
param k := 80;
param V := 70;
param Pmax := 20;

end;
 