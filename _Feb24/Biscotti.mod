#reset;
set B;
set I;
param perc{I, B}; #percentuale di ingrendienti
param qAll{B}; #Quantita massima che può essere prodotta [kg/gg]
param prezzi{B}; #Prezzi al kg
param cIngredienti{I}; #Costi ingredienti [e/kf]
param ingMin{I}; #Quantita minima acqusitabile di ingredienti[kg/sett]
param qMin{B}; #Quantita minima da produrre [kg/sett]
param qMax{B}; #Quantita massima da produrre [kg/sett]
param budget := 21600;
param pubbli := 5000; #[e/trimestre]
# L’azienda deve pianificare la sua produzione per il prossimo trimestre (12 settimane di 5
# giorni lavorativi) ed ha a disposizione per il periodo in questione un certo budget.

var x {B} >= 0; #Quantita da produrre a settimana 
var ingTot{I} >= 0; #Quantita totale di ingredienti utilizzati [kg/sett]
#Devo mettere >= non solo = altrimenti si rompe
s.t. def_ingTot {i in I}:
	ingTot[i] >= sum{b in B} x[b] * perc[i,b];
s.t. ingredienti {i in I}:
	ingTot[i] >= ingMin[i];
s.t. quantitaMinima {b in B}: x[b] >= qMin[b];
s.t. quantitaMassima {b in B}: x[b] <= qMax[b];
s.t. budg: sum{i in I} cIngredienti[i] * ingTot[i] <= budget;

maximize profitto:
	sum {b in B} x[b] * prezzi[b];

data;
set B:= Svegliallegra FrollinoDelMattino AlbaRadiosa ProntiVia;
set I := Farina Uova Zucchero Burro Latte Additivi Nocciole Acqua;

param perc :
          Svegliallegra   FrollinoDelMattino AlbaRadiosa  ProntiVia :=
                         
Farina          0.20           0.25           0.30           0.20
Uova            0.15           0           0.10           0.20
Zucchero        0.20           0.15          0.25           0.10
Burro           0              0           0.10           0.10
Latte           0.10           0.20           0.20           0.15
Additivi        0.15           0.20            0           0.15
Nocciole        0.10           0            0            0
Acqua           0.10           0.20            0.5           0.10;

param qAll :=
Svegliallegra    165
FrollinoDelMattino  250
AlbaRadiosa     500
ProntiVia       250;

param prezzi :=
Svegliallegra    1.75
FrollinoDelMattino  1.00
AlbaRadiosa     1.25
ProntiVia       1.50;

param cIngredienti := 
Farina    0.5
Uova      2
Zucchero  0.5
Burro     1
Latte     1.5
Additivi  1
Nocciole  5 
Acqua 	0;

param ingMin := 
Farina    450
Uova      200
Zucchero  320
Burro     140
Latte     320
Additivi  100
Nocciole   50
Acqua 	1;

param: qMin		qMax :=
Svegliallegra       50     300
FrollinoDelMattino    100     500
AlbaRadiosa       500    1000
ProntiVia         300     500;
#solve;
#display x, ingTot, profitto;
end;



