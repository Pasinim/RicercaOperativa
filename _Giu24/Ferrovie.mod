set M; #insieme delle merci
set S := 0..9;
set E within S cross S; #Grafo delle tratte
param nTreni{E};
param nVagoni{E};
param c{E};
param v{M};
param limiti{S, M};

var x{S, S,  M} >= 0; #Quantita trasportata per ogni tratta di ogni merce


#Vincolo di conservazione del flusso
s.t. conservazioneFlusso {s in S, m in M: s>0 and s<9}:
        sum {i in S: (i, s) in E} x[i,s,m] = sum {j in S: (s,j) in E} x[s,j,m];
        
#Vincolo di capacità sugli archi
s.t. capacitaArchi {(i,j) in E}:
       nVagoni[i,j] * c[i,j] * nTreni[i,j]  >=  sum {m in M} x[i,j,m] ;

#Vincolo di capacità sui nodi
s.t. capacitaNodi{s in S, m in M}:
        sum {i in S: (i,s) in E} x[i,s,m] <= limiti[s,m];
#È necessario aggiungere un vincolo sulla stazione di partenza perchè non riceve un flusso entrante
s.t. limiteStazioneOrigine {m in M}:
        sum {j in S: (0,j) in E} x[0,j,m] <= limiti[0,m];

maximize z: sum {i in S, m in M: (i,9) in E} v[m] * x[i,9,m];

#maximize guadagno :
 #       sum {m in M, (i,j) in E} v[m] * x[i,j,m]; 
data;
set M := A B C;
param v :=
A 80
B 50
C 65;

param limiti :  A   B   C   :=
0 1000 1000 1000
1 300 1800 1400
2 250 900 100
3 900 650 1400
4 2000 1500 2000
5 1000 1000 1000
6 1200 1200 1400
7 600 700 950
8 300 1700 1900
9 1000 1000 1000
;
set E :=
0  1,
0  2,
1  3,
1  4,
2  4,
2  5,
3  6,
3  7,
4  6,
4  7,
4  8,
5  7,
5  8,
6  9,
7  9,
8  9;

param: nTreni   nVagoni     c :=
0,1 4 10 20
0,2 4 8 15
1,3 2 10 20
1,4 3 6 20
2,4 8 2 16
2,5 1 8 16
3,6 5 4 16
3,7 4 6 16
4,6 3 5 16
4,7 3 4 16
4,8 3 5 16
5,7 4 18 10
5,8 4 10 10
6,9 3 9 18
7,9 5 3 20
8,9 2 11 18
;





end;

