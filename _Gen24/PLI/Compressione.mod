param nF := 8;
param nCD := 3;
set CD := 1..nCD;
set F := 1..nF;
param size{F};
param comp{F};
param c := 700; #Capacita totale cd

var ass{F, CD} binary; #Indica su che cd si trova il file
var assCompresso{F, CD} binary;

minimize z:
	sum {i in F, j in CD} assCompresso[i, j];

subject to capTot{j in CD}:
	c >=  sum {i in F} (ass[i, j] * size[i] + assCompresso[i, j] * comp[i]);
subject to assegnamento {i in F}:
	sum {j in CD} (ass[i,j] + assCompresso[i,j]) = 1;


data;
param: size		comp :=
    1        450         220
    2        550         240
    3        600         235
    4        120          70
    5        530         260
    6        480         240
    7        200         180
    8        240         110
;
end;

