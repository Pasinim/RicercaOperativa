# Esercizio Zoo

# CON 4 PRODOTTI, Z = 1527.866667
# CON 5 PRODOTTI NON CAMBIA NIENTE

# POSSIAMO PRENDERE TUTTE LE 8 GIRAFFE SENZA ALZARE I COSTI
# MA NON POSSIAMO PRENDERE NEANCHE 1 ELEFANTE.

# CON UN ORSO IN PIU' Z VALE 1607.866667. SICCOME UN ORSO AUMENTA I GUADAGNI DI 90€, CONVIENE.

# Dati

set a;					# Insieme degli animali.
set p;					# Insieme dei prodotti.
set s;					# Insieme delle sostanze nutritive.
param q {a};			# Quantità di animali nello zoo [u].
param cp {s,p};			# Composizione percentuale dei prodotti.
param fg {a,s};			# Fabbisogno giornaliero di ogni singolo animale per prodotto [kg/d].
param cs {p};			# Costi dei prodotti [€/kg]

# Variabili

var acquisti {p} >= 0;	# Quantità prodotti acquistati giornalmente [kg/d].
var nS{s} >= 0;			# Totale sostanze necessarie giornalmente [kg/d].

# Vincoli

s.t. vincoloSostanze {k in s}:
	sum{j in a} q[j]*fg[j,k] <= nS[k];

s.t. vincoloAcquisti {k in s}:
	sum{i in p} acquisti[i]*cp[k,i]/100 >= nS[k];

# Obiettivo

minimize z: sum{i in p} acquisti[i]*cs[i];

################

data;


set a :=  Antilope Babbuino Canguro Dromedario Elefante Fringuello Giraffa Ippopotamo Koala Leone Muflone Narvalo Orso Pappagallo Rinoceronte Serpente_a_sonagli Tapiro Upupa Visone Zebra;

param q :=
Antilope           1
Babbuino           2
Canguro            1
Dromedario         1
Elefante           1
Fringuello         8
Giraffa            1
Ippopotamo         1
Koala              3
Leone              2
Muflone            2
Narvalo            1
Orso               1
Pappagallo         8
Rinoceronte        1
Serpente_a_sonagli 6
Tapiro             1
Upupa              4
Visone             4
Zebra              2;


set s := Carne Latte Frutta Verdure Zuccheri Grassi Farine Acqua;
set p := P1 P2 P3 P4 P5;


param cp: P1     P2      P3      P4    P5 :=
Carne     80       5       0      25   50
Latte      0       5       0       0    5
Frutta     0      25      30       5   10
Verdure    5      40      25      10   35
Zuccheri   5       0       0       0    0
Grassi     0       0       0      15    0
Farine     0       0      25       0    0
Acqua     10      25      20      45    0;  


param fg:            Carne Latte Frutta Verdure Zuccheri Grassi Farine Acqua  :=
Antilope               0.0   0.0    0.0     2.0      0.2    0.5    1.0   3.0
Babbuino               1.0   1.0    3.0     0.3      0.2    0.2    0.0   2.0
Canguro                0.1   0.5    0.1     1.0      0.1    0.3    0.0   4.0
Dromedario             0.5   0.5    1.0     0.5      0.1    0.5    0.5   5.0
Elefante               0.0   0.5    5.0     9.0      0.5    1.0    1.0   9.0
Fringuello             0.0   0.0    0.0     0.0      0.0    0.0    0.1   0.1
Giraffa                0.0   0.0    0.2     3.0      0.0    0.0    0.0   4.0
Ippopotamo             0.0   0.0    8.0     6.0      0.5    1.0    0.0  20.0
Koala                  0.0   1.0    1.0     1.0      0.0    0.0    0.2   0.5
Leone                  5.0   0.0    0.0     0.0      1.0    0.5    0.0   5.0
Muflone                0.0   1.0    0.0     5.0      0.0    0.0    0.0   3.0
Narvalo                0.0   0.0    0.0     0.0      0.0    0.0    3.0   0.0
Orso                   5.0   0.5    3.0     1.0      0.0    0.0    0.0  10.0
Pappagallo             0.0   0.0    0.0     0.0      0.0    0.0    0.2   0.5
Rinoceronte            1.0   0.0    0.0    12.0      0.0    2.0    0.0  15.0
Serpente_a_sonagli     0.5   0.0    0.0     0.1      0.0    0.0    0.0   0.1
Tapiro                 0.0   0.2    1.0     9.0      0.2    0.5    0.0   6.0
Upupa                  0.0   0.0    0.0     0.5      0.1    0.0    0.5   1.0
Visone                 0.0   0.2    0.5     3.0      0.0    0.0    1.0   1.0
Zebra                  0.0   0.0    0.0     5.0      0.5    0.2    0.5   5.0;

param cs :=
P1   5
P2   2
P3   3
P4   4
P5   0.5;

/*
Dati aggiuntivi 

Prodotto P5:
Composizione: carne 50%, latte 5%, frutta 10%, verdura 35%.
Prezzo: 0.5 Euro / kg.

L'acquisto di un ulteriore orso porterebbe un incasso aggiuntivo di 90 Euro al giorno.
*/

end;
