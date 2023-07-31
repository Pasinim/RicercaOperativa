param nA;
set A := 1..nA;
param T{A};

var xR{i in A} >=5 := T[i] ;

minimize z: xR[1];

data;

param nA := 3;
param T :=
1	60
2	60
3	40;

end;
