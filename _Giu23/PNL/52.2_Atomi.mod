param nA := 10;
set A := 1..nA;
param x{A};
param y{A};
param z{A};
param PA{A};
param PB{A};

#Var
#posizione dell'atomo sonda
var xx;
var yy;
var zz;
#Tolgo la radice ed introduco invece la distanza al quadrato
#var d{i in A} = sqrt((xx-x[i])^2 + (yy-y[i])^2 + (zz-z[i])^2);
var d2{i in A} = (xx-x[i])^2 + (yy-y[i])^2 + (zz-z[i])^2;


#OB: rovare il punto di minima energia a cui la sonda (anch’essa supposta puntiforme) tende a
#stabilizzarsi per effetto delle interazioni con gli atomi stessi.
#Ho fatto la radice delle potenze dato che ho elevato alla seconda la distanza
minimize energia:
	 sum {i in A} (PA[i]/d2[i]^6 - PB[i]/d2[i]^3);
#d è la distanza euclidea tra atomo e sonda
 
data;
param:    	   x   y   z  :=
			1 3.2 2.5 4.8
			2 2.1 3.7 8.4
			3 7.5 2.5 5.0
			4 6.6 1.2 4.5
			5 0.8 5.1 5.6
			6 6.3 8.8 3.5
			7 2.4 1.0 3.1
			8 1.2 4.6 9.0
			9 8.5 7.8 1.5
			10 4.1 9.3 0.9;
			
param:  PA   PB := 
	1	1.0 200
	2	1.1	400
	3	2.1	320
	4	3	250
	5	0.5	400
	6	0.2	200
	7	.8	120
	8	1.1	300
	9	1.5	100
	10	1.7 500
;	

end;

