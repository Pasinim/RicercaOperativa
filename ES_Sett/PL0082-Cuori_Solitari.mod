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
		1   2   3    4    5   6   7   8   :=
  1    31  15  27   24   24  21  22  12 
  2    16  19  20   23   27  35  37   8 
  3    25  30  31    5    8   9  20  15 
  4    36  34  29   37   38  26  12  17 
  5    23  23  23   25   26  23  22  21 
  6    12  14  17   15   16  19  11   5 
  7     3   2   6   18   20  22  21  28 
  8    34  36  28   27   26  25  30  30 
  9    20  18  17   19   19  18  21  20 
  10     4   5   7   32    9  30  25  29 
  11    5   6   7    6   10   9   9   9 
  12   38  37  35   34   33  35  28  27 
  13   25  26  28   21   20  16  17  16 
;

param gdu:
		1   2   3    4    5   6   7   8   :=
  1    13  18  23  36  25  24  22   4
  2    15  14  30   4  24  25  22   5
  3    19  15  31   6  22  28  21  12
  4    21  16  28  12  21  21  13  15
  5    23  16  36   9  20  20  16   7
  6    25  15  38  21  17  17  17  13
  7    24  14  39  16  24  15  19  14
  8    24  10  31  16  27  18  20  10
  9    22  12  29  17  28  28  10  20
  10    18   5  27  14  10  29  14  18
  11   16   5  27  13  15  22  20  15
  12   16   8  30   9  18  33  21  13
  13   30  10  31  10  19  11  21  16
;

end;
