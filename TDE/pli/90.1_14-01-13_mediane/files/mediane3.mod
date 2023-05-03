# Versione 2

set Origini := 1..7;
set Destinazioni := 1..10;
param distanza {Origini,Destinazioni};
param fixedcost {Origini};
param budget;

var x {Origini, Destinazioni} binary;
var y {Origini};

minimize dist_tot: sum {i in Origini, j in Destinazioni} distanza[i,j]*x[i,j];

s.t. assegnamento {j in Destinazioni}: sum {i in Origini} x[i,j] = 1;

s.t. relazione_xy {i in Origini, j in Destinazioni}: x[i,j] <= y[i];

s.t. numero_mediane: sum {i in Origini} y[i] = 2;

s.t. budget_constr: sum {i in Origini} fixedcost[i]*y[i] <= budget;

data;

param distanza :  1   2   3   4   5   6   7   8   9   10 :=
1                 0 565 401 529 295 720 550 817 891  539
2               565   0 210 474 799 665 760 936 1008 979
3               401 210   0 309 635 500 674 771 949  838
4               529 474 309   0 375 194 377 465 643  579
5               295 799 635 375   0 411 259 394 599  293
6               720 665 500 194 411   0 281 861 450  570
7               817 936 771 465 394 861 117   0 220  378
;

param fixedcost :=
1    40
2    50
3    40
4    40
5    40
6    40
7    60 
;

param budget := 100;

end;

