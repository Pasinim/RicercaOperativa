

#	Per pattugliare la città in piena guerra civile, il comandante della polizia deve disporre delle sentinelle in modo da sorvegliare tutti gli incroci.
#Poichè le strade sono tutte rettilinee, ogni incrocio può essere sorvegliato anche da una sentinella posta in un incrocio adiacente. 
#Siccome il personale è scarso, il problema deve essere risolto impiegando il minor numero possibile di sentinelle
#
#L città ha 30 tra piazze e incroci, collegati dalle seguenti vie.
#Alcune piazze possono avere una sola via incidente ad esse.


# edge - archi: 
# nodi: piazze e incroci

param n;
set N := 1..n;
set E within N cross N; #insieme (sottoinsieme) del prodotto cartesiano NxN

#Sto cercando il minor numero possibile di vertifci facendo in modo che tutti i nodi siano sorvegliati -> Cerco il Dominating Set (Vertici che dominano tutti gli altri vertici del grafo)
#Variabili: 
 var x {N} binary; #var binarie associate ai nodi, che indica se il nodo fa parte del dominatin sedt (quindi se c'è una sentiella)
 
 #Obiettivo 
 #minimizzare la cardinbalità del dominating set (cioe meno sentinelle possibili)
 minimize z: sum {i in N} x[i];
 
 #Vincoli
 # Ogni incrocio deve essere sorvegliato:
subj to sorvegliato {i in N}: #deve esserci una sentinella oppure deve esserci nei nodi adiacenti
#x[i]  + sum {j adiacenti} x[j] >= 1;
x[i] + sum {j in N: (i,j) in E or (j,i) in E} x[j] >= 1;


data;
param n := 30;
set E := 
1 2, 
1 3 
1 4 ,
2 30 ,
3 13 ,
3 16 ,
4 5 ,
4 6 ,
4 24 ,
5 6 ,
5 8 ,
5 13 ,
6 7 ,
7 9 ,
7 10 ,
8 9 ,
8 12 ,
8 13 ,
8 27 ,
9 10 ,
9 27,
10 11 ,
11 23 ,
11 29, 
12 13 ,
12 18 ,
12 19 ,
12 27 ,
13 14 ,
14 15 ,
14 18 ,
15 16 ,
15 17 ,
18 19 ,
18 28 ,
19 20 ,
19 28 ,
20 21 ,
20 22 ,
20 29 ,
24 25 ,
24 26 ,
27 29 ,
;


end;



