# Esercizio Biscotti

# DATI

set biscotti;								# Biscotti
set ingredienti;							# Ingredienti
param consumi {ingredienti,biscotti};		# Composizione percentuale dei biscotti.
param massimaQuantita{biscotti};			# Massima quantità producibile giornalmente per biscotto se tutto l'impianto fosse dedicato [Kg/giorno];
param costoIngredienti{ingredienti};		# Costi ingredienti [€/kg].
param minimoAcquisto{ingredienti};			# Quantità minime di ingredienti da acquistare [Kg/settimana]
param quantitaMinime {biscotti};			# Quantità minime da produrre per biscotto     [Kg/settimana]
param quantitaMassime{biscotti};			# Quantità massime da produrre per biscotto   [Kg/settimana]
param budgetDisponibile;					# Budget disponibile per il trimestre [€]
param prezziVendita{biscotti};				# Prezzo di vendita di un biscotto [€/kg]

# VARIABILI

var produzione{i in biscotti} >= quantitaMinime[i] <= quantitaMassime[i];				# Quantitò biscotti prodotti settimanalmente
var acquisto{i in ingredienti} >= minimoAcquisto[i];				# Quantità di ingredienti acquistati settimanalmente

# VINCOLI


s.t. massimaProduzione :
	  sum {i in biscotti} 1 / massimaQuantita[i] * produzione[i] <= 5;

s.t. ingredientiPerBiscotto{i in ingredienti}:
	sum{j in biscotti} produzione[j]* consumi[i,j]/100 <= acquisto[i];

s.t. massimoAcquisto:
	 sum{i in ingredienti} acquisto[i]*3*4*costoIngredienti[i]  <= budgetDisponibile; # 3*4 è il numero di settimane in un trimestre circa.

# OBIETTIVO

maximize z : (sum{i in biscotti} prezziVendita[i] * produzione[i])- (sum{i in ingredienti} acquisto[i]*costoIngredienti[i]);

#########
data;

set biscotti := Svegliallegra Frollino Alba ProntiVia;
set ingredienti := Farina Uova Zucchero Burro Latte Additivi Nocciole Acqua;
param consumi :  Svegliallegra     Frollino         Alba   ProntiVia := 
Farina                      20           25           30           20
Uova                        15            0           10           20
Zucchero                    20           15           25           10
Burro                        0            0           10           10
Latte                       10           20           20           15
Additivi                    15           20            0           15
Nocciole                    10            0            0            0
Acqua                       10           20            5           10;

param massimaQuantita :=
Svegliallegra  165
Frollino       250
Alba           500
ProntiVia      250;

param costoIngredienti :=
Farina   0.5
Uova     2
Zucchero 0.5
Burro    1
Latte    1.5
Additivi 1
Nocciole 5
Acqua    0;

param minimoAcquisto :=
Farina     450
Uova       200
Zucchero   320
Burro      140
Latte      320
Additivi   100
Nocciole    50
Acqua        0;

param quantitaMinime :=
Svegliallegra 	50
Frollino	   100
Alba		   500
ProntiVia	   300;

param quantitaMassime :=
Svegliallegra  300
Frollino	   500
Alba		  1000
ProntiVia	   500;

param budgetDisponibile := 21600;

param prezziVendita :=
Svegliallegra    1.75
Frollino         1.00
Alba		     1.25
ProntiVia        1.50;

end;
