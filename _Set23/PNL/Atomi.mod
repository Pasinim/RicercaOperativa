param nA := 10;
set At := 1..nA;
param x{At};
param y{At};
param z{At};
param A{At};
param B{At};
#Var
#Posizione atomo sonda
var xx;
var zz;
var yy;
var d {a in At} = ((xx - x[a])^2 + (yy - y[a])^2 + (zz - z[a])^2);

#OB: pto che minimizza l'energia
minimize energia:
	sum {a in At} ((A[a]/d[a]^6) - (B[a]/d[a]^3));
	
	
data;
param: x y z A B := 
1  	 3.2 2.5 4.8 1.0 200
2 	 2.1 3.7 8.4 1.1 400
3 	 7.5 2.5 5.0 2.1 320
4	 6.6 1.2 4.5 3.0 250
5	 0.8 5.1 5.6 0.5 400
6	 6.3 8.8 3.5 0.2 200
7	 2.4 1.0 3.1 0.8 120
8	 1.2 4.6 9.0 1.1 300
9	 8.5 7.8 1.5 1.5 100
10	 4.1 9.3 0.9 1.7 500
;

end;