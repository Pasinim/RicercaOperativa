param nA := 10; #Numero allevamenti
param nP := 20; #Pti vendita
param  nC := 7; #Caseifici
set A := 1..nA;
set P := 1..nP;
set C := 1..nC;
set C2 within C;
set cat;
param produzione{A}; #Produzone latte  [q/gg]
param xA {A};
param yA {A};
param xP {P};
param yP {P};
param catena{P};
param xC {C};
param yC {C};
param cap{C2}; #Capacita di lavorazione dei caseifici già esistenti

data;
set cat := 1 2 3 4;

param cap :=
1	1600
2	1800;

param: xP yP catena :=
1 24 164 1
2 30 206 2
3 42 180 3
4 45 140 1
5 56 150 3
6 69 199 1
7 75 130 2
8 78 240 4
9 91 195 1
10 104 178 2
11 124 135 3
12 126 148 3
13 146 210 1
14 150 240 2
15 152 176 1
16 168 231 3
17 170 142 4
18 180 190 4
19 195 224 2
20 210 171 1
;
param : xA yA produzione := 
1 30 140 320
2 25 150 460
3 30 200 190
4 42 220 400
5 58 180 380
6 21 165 440
7 14 133 280
8 68 112 200
9 70 85 295
10 51 190 145
;


param: xC yC :=
1 60 120 
2 140 150 
3 76 128
4 42 141
5 90 166
6 85 98
7 31 102
;

end;

