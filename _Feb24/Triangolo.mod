#Data

param nP;		#Numero dei punti
set P:=1..nP;	#insieme dei punti

param xP{P};	#Coordinata x dei punti
param yP{P};	#Coordinata y dei punti

set T:=1..3;	#Componenti triangolo

#Var

#Triangolo
var xT{T};	#Coordinata x dei vertici	
var yT{T};	#Coordinata y dei vertici	

var aT{T};   	# coef a della retta del lato
var bT{T};   	# coef b della retta del lato
var cT{T};		# coef c della retta del lato

/*
rappresentazione
	   2
	   *
  L3  / \ L1  
	 /   \
   1*-L2--*3
   
*/

var lato >= 1;

#Vincoli

#Normalizzazione retta
subject to normalizzazione{t in T}:
	aT[t]^2+bT[t]^2=1;

#Condizione di intersezione con 2 vertici
subject to intersezione_rettaVertici{t1 in T, t2 in T: t1<>t2}:
	aT[t1]*xT[t2]+bT[t1]*yT[t2]+cT[t1]=0;


#Lato 1-2,1-3,2-3
subject to equilatero {t1 in T, t2 in T: t1>t2}:
	(xT[t1]-xT[t2])^2+(yT[t1]-yT[t2])^2 = lato^2;


#Intersezioni
subject to interseption_1{p in P, t in T: t<>2}:
		aT[t]*xP[p]+bT[t]*yP[p]+cT[t]>=0;
		
subject to intersezione_2{p in P}:
		aT[2]*xP[p]+bT[2]*yP[p]+cT[2]<=0;

#Impongo che il verrtice opposto sia dalla parte dei punti
subject to vertice_opposto_1{t in T: t<>2}:
	aT[t]*xT[t]+bT[t]*yT[t]+cT[t]>=0;

subject to vertice_opposto_2{t in T}:
	aT[2]*xT[2]+bT[2]*yT[2]+cT[2]<=0;
	
#Obj
minimize l:
	3*lato;

data;

param nP:=5;

param:
 	xP   yP:=
1   24 -17
2   15  14
3   -2   0
4   21  20
5   18  -6;

var: 	aT				bT				cT:=
1		1.09498     	2.45039     	15.3771
2		-0.713299       0.893569      -14.8163
3		-0.554624      -0.35308        18.7087;



end;