#Dati
set A := 0..2; #insieme appigli = vertici del triangolo
param x{A};
param y{A};
param z{A};
param minA = 100; #[cm2]

#Var: coordinate dei vertici della ragnatela
var xx{A};
var yy{A};
var zz{A};

#Lunghezze lati
var lato{i in A} = sqrt((xx[(i+1) mod 3]-xx[(i+2) mod 3])^2 + 
						(yy[(i+1) mod 3]-yy[(i+2) mod 3])^2 +
						(zz[(i+1) mod 3]-zz[(i+2) mod 3])^2 
						);

#semiperimetro      
var p = sum {i in A} lato[i]/2; 


s.t. areaMinima:
	minA^2 <= (p*(p-lato[0])*(p-lato[1])*(p-lato[2]));

#OBJ
#Minimizzare quantita di filo, cioè minimizzare il perimetro
minimize obj: sum {i in N} lato[i] + 
			  sum {i in N} sqrt ( (xx[i]-x[i])^2 + (yy[i]-y[i])^2 + (zz[i]-z[i])^2); 

data;
param: 	  x  y  z := 
		1 30 50 50 
		2 60 10 45
		3 40 30 10
;



end;



