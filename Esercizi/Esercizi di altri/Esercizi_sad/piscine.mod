#Esercizio

#DATI
param n;	 # Numero di alberi nel parco
set N:=1..n; # Insieme degli alberi nel parco
param x{N};  # Coordinata X degli alberi nel parco
param y{N};	 # Coordinata Y degli alberi nel parco
set L:=0..3; # Insieme dei lati della piscina
set R:=0..3; # Insieme delle coordinate degli angoli del parco
param xR{R}; # Cooridnate degli angoli del parco X
param yR{R}; # Coordinate degli angoli del parco Y
param k;     # Rapporto tra base e altezza piscina

#VARIABILI
#indico rette che formano rettangolo
var a{L};
var b{L};
var c{L};

var xP{L};
var yP{L};

var base = sqrt((xP[0]-xP[2])^2+(yP[0]-yP[2])^2);
var h =  sqrt((xP[1]-xP[3])^2+(yP[1]-yP[3])^2);

#VINCOLI

#normalizzazione
s.t. normalizzazione{i in L}: a[i]^2 + b[i]^2=1;

#ogni lato è perpendicolare al successivo
s.t. perpendicolare{i in L, j in L: (i+1)mod 4 = j}:
	a[i]*a[j] + b[i]*b[j] = 0;

#piscina dentro al parco
s.t. dentro_parco1{i in L}:
	xP[i]>=0;
s.t. dentro_parco2{i in L}:
	xP[i]<=100;
s.t. dentro_parco3{i in L}:
	yP[i]>=0;
s.t. dentro_parco4{i in L}:
	yP[i]<=100;
	

#da ogni angolo passa la retta con lo stesso numero
s.t. angoli_piscina{i in L}:
	a[i]*x[i] + b[i]*y[i] + c[i]=0;

#da ogni angolo passa la retta con il numero successivo
s.t. angoli_piscina{i in L, j in L: (i+1)mod 4 = j}:
	a[j]*x[i] + b[j]*y[i] + c[j]=0;

	
#rapporto tra i lati
s.t. rapporto1:
	base>=h*k;
s.t. rapporto2:
	h>=base*k;

#alberi fuori dalla piscina
var z{N,L} binary;
param M:=100;

#punti interno tutti dallo stesso lato
s.t. punti_interni{i in L, j in L}:
	a[j]*xP[i] + b[j]*yP[i] + c[j] <=0;
	
#vincolo disattivato se rispetto a quel lato il punto è esterno
s.t. albero_fuori{i in N, j in L}:
	a[j]*x[i] + b[j]*y[i] + c[j] >= - M*z[i,j];
#almeno per un lato la z = 0 ovvero vincolo disattivo
s.t. almeno_un_lato{i in N}:
	sum{j in L}z[i,j]<=3;

#OBIETTIVO
maximize w: base*h;

#################
data;
param n:=9;
param: xR yR:=
0 0 0
1 0 100
2 100 100
3 100 0;
param: x y:=
1 5 90
2 85 10
3 92 86
4 7 12
5 50 48
6 52 25
7 28 51
8 73 50
9 54 75;
param k:= 0.4;
end;
