param k;
param nU;
param nD;
set U := 1..nU; #insieme uomini
set D := 1..nD; #insieme donne
param gud {U, D}; #gradimento uomini di donne
param gdu {U, D};
param g { u in U, d in D} = min(gud[u,d], gdu[u,d]); #affinità
#Variabili
var x {U, D} >= 0, <= 1; #affiatamento	

#Vincoli
#non più di k match:
subj to MatchU {u in U}:
	sum {d in D} x[u,d] <= k;
subj to MatchD {d in D}:
	sum {u in U} x[u,d] <= k;


#Ob: massimizzare il totale affiatamento delle coppie proposte. K nominativi, si vuole risolvere il problema con k = 1, 2 e 3
	#affiatamento = (in base a passate esperienze) come il minimo tra gli indici di gradimento presunto di ciascuno dei due verso l'altro. Il valore minimo tra i due è quello che conta
maximize z:
	sum {u in U, d in D} g[u,d] * x[u,d];
	
	
data;
param k := 1;
param nU := 13;
param nD := 8;
	
	
param gud : 
		a   b   c    d    e   f   g   h   :=
  A    31  15  27   24   24  21  22  12 
  B    16  19  20   23   27  35  37   8 
  C    25  30  31    5    8   9  20  15 
  D    36  34  29   37   38  26  12  17 
  E    23  23  23   25   26  23  22  21 
  F    12  14  17   15   16  19  11   5 
  G     3   2   6   18   20  22  21  28 
  H    34  36  28   27   26  25  30  30 
  I    20  18  17   19   19  18  21  20 
  J     4   5   7   32    9  30  25  29 
  K     5   6   7    6   10   9   9   9 
  L    38  37  35   34   33  35  28  27 
  M    25  26  28   21   20  16  17  16 
;

param gdu:
		a   b   c   d   e   f   g   h   :=
  A    13  18  23  36  25  24  22   4
  B    15  14  30   4  24  25  22   5
  C    19  15  31   6  22  28  21  12
  D    21  16  28  12  21  21  13  15
  E    23  16  36   9  20  20  16   7
  F    25  15  38  21  17  17  17  13
  G    24  14  39  16  24  15  19  14
  H    24  10  31  16  27  18  20  10
  I    22  12  29  17  28  28  10  20
  J    18   5  27  14  10  29  14  18
  K    16   5  27  13  15  22  20  15
  L    16   8  30   9  18  33  21  13
  M    30  10  31  10  19  11  21  16
;
end;
