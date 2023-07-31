# Esercizio Sabotaggio

# E' un problema di PNL sul flusso. Massimizzo il flusso che arriva alle destinazioni.

# I guastatori vorranno colpire l'arco (4,6) che ha un flusso di 61 e capacit� massima di 66.
# Se i guastatori danneggiano l'arco (4,6) di al massimo 5 unit�, non provocano nessun danno, 
# dato che la capacit� � 66, e con un danneggiamento di 5 arriva a 61, che � quanto viene trasportato sull'arco. Se per� continuano a danneggiarlo,
# il flusso totale fino alle destinazioni diminuir� di 1 per ogni unit� di danno inflitta, fino ad arrivare ad un danno totale di 66.

# Per ogni unit� di danneggiamento pago k.

# CASO k >= 1

# Considero k = 1 (si pu� rifare il ragionamento analogo per ogni k >= 1).
# Il punto utopia si trova in (0,61). 0 � per la funzione obiettivo di minimizzare il danno fatto alla capacit� ( se faccio 0 danni pago 0),
# 61 � per la funzione obiettivo due che vuole massimizzare l'effetto del sabotaggio. 
# Le soluzioni paretiane sono 5 .  La soluzione di base paretiana che si trova pi� vicino al punto utopia si trova in (0,0).
# Quindi, non mi conviene danneggiare 

# CASO k < 1 e k > 0 (non considero k = 0, perch� il costo del sabotaggio non sarebbe crescente rispetto alla diminuzione di capacit�, infatti sarebbe sempre 0)

# Se k  � maggiore di 0.92 circa (valore trovato facendo 61/66, ovvero flusso dell'arco / capacit�), come fatto prima, non conviene danneggiare l'arco.
# Da 0.92 in gi� conviene invece danneggiare l'arco. Pi� 0.92 scende pi� diventa conveniente anche per piccoli danneggiamenti.
# Il punto pi� vicino al valore utopia dipende da k, ma se k <= 0.92 quel punto non � pi� (0,0). Il punto pi� vicino al punto utopia diventa (61,66*k).

# DATI

param nN;                   # Numero nodi del grafo
set N := 1..nN;             # Insieme dei nodi del grafo
set E within (N cross N);   # Insieme degli archi del grafo
param cap{E};               # Capacit� dei nodi
set o;                      # Nodi di origine del flusso
set d;                      # Nodi di destinazione del flusso
param k := 0.91;

# VARIABILI

var flusso{(i,j) in E} >= 0 <= cap[i,j];              # Flusso su ogni arco del nodo
var danno >= 0;                                       # Danno dei sabatotori all'arco (4,6)
var costo ;

# VINCOLI

s.t. flussoMassimoSuArco{i in N, j in N: (i,j) in E}:
    flusso[i,j] <= cap[i,j];

s.t. conservazioneFlusso{i in N: i not in o and i not in d}:
   sum{j in N: (i,j) in E} flusso[i,j] = sum{j in N: (j,i) in E} flusso[j,i];

s.t. dannoFattoAllarco:
   flusso[4,6] <= cap[4,6] - danno;

s.t. dannoArco:
   danno = 66;

s.t. quantoPago:
   costo = danno*k;

# OBIETTIVO

maximize z:  sum{i in N, j in N: j in d and (i,j) in E} flusso[i,j];

#################

data;

param nN := 8;
set E := 1,3 2,4 3,4 3,5 4,6 5,7 6,5 6,8;
set o := 1 2;
set d := 7,8;

param  cap :=
1,3      58    
2,4      31    
3,4      40    
3,5      12    
4,6      66    
5,7      59    
6,5      25    
6,8      36;

end;
