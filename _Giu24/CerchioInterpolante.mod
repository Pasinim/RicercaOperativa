reset;
param nP;
set P := 1..nP;
param x{P};
param y{P};
param peso{P};

#Coordinate del centro della circonferenza
var xx; 
var yy;
var d{P};


s.t. distanza_pesata{i in P}:
    d[i]=sqrt((x[i] - xx)^2 + (y[i] - yy)^2);
minimize z:
	sum {p in P} (d[p] * peso[p])/nP;
#minimizzare il valor medio delle distanze pesate dei punti dalla circonferenza,
data;
param nP := 10;
param:	x	y	peso :=
  1   51   13   3
  2   48   75   5
  3   16   57   4
  4   33   70   2
  5   95   52   3
  6   59   10   3
  7   23   61   4
  8   32   70   4
  9   87   50   2
 10   46   98   1;
 
 
 
 data;
 solve;
 end;