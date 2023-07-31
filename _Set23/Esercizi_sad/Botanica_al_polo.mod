# Esercizio Botanica al polo

# L'esperimento è conveniente dal punto di vista economico.
# No, non mi servono 100 mq in più, ne sto usando solo 320 non ha senso prenderne di più.
# Le piante più redditizie, in ordine, sono : Begonia, Carota e Giaggiolo
# Accettiamo la proposta del botanico giapponese.
# Dovrebbero avere commerciale di 1632. (superiore a 1631).

# DATI

param nP;				# Numero tipi di piante
set P := 1..nP;			# Insieme delle piante
param nE;				# Numero elementi nutrizionali
set E := 1..nE;			# Insieme degli elementi nutrizionali
param C{E};				# Costi degli elementi nutrizionali  [€/( possono essere espressi al litro, al grammo, alla caloria o al minuto di illuminazione, dipende dall'unità di misura dell'elemento)].
param F{P,E};			# Fabbisogno giornaliero per m^2  coltivato di ogni tipo di pianta per ogni unità di elemento nutrizionale
param T{P};				# Tempo di crescita delle piante in giorni
param R{P};				# Ricavo stimato per metroquadro coltivato per ogni pianta [€/m^2]
param cI;				# Costo iniziale dell'esperimento  [€]

# VARIABILI

var mP{P} >= 5 <= 100;			# Metri quadri dedicati ad ogni piantina
var el{E} >= 0;					# Elementi nutrizionali per unità necessari totale esperimento

# VINCOLI

s.t. totaleSuperficie:
	sum{i in P} mP[i] <= 500;

s.t. elementiNecessari{i in E}:
	sum{j in P} mP[j] * F[j,i] * T[j] = el[i];

# OBIETTIVO
maximize z : sum{i in P} R[i]*mP[i] - sum{i in E} el[i]*C[i] -  cI;


################

data;

param nP := 7;
param nE := 5;
param cI := 50000;

param C := 
1    1   
2    4  
3    1 
4    1.5 
5    3.6;

param F :         1			2		3 		4		5   :=
1                 0.5      20      10     100       1.5
2            	  0.8       3      12       3       0.5
3            	  0.1       5       5       5       2.4
4           	  0.2      90      50     450       3
5     			  0.3      30       0      50       0
6  				  0.8      60      20      40       1.5
7        	      0.7       0      25     150       9;

param T :=
1  30 
2  40 
3  10 
4 100 
5   5 
6   5 
7  20;

param R :=
1  6000 
2  4000 
3  2000 
4 18000
5   100
6   500
7  7000;

end;
