# Esercizio Piscina nel parco

# DATI
	
param nP;			# Numero degli alberi
set P := 1..nP; 	# Insieme degli alberi
param xP{P};		# Posizione X dei punti
param yP{P};		# Posizione Y dei punti
param nV;			# Numero vertici del rettangolo
set V:= 0..nV;		# Insieme dei vertici del rettangolo
param p;			# Proporzione lato lungo/corto del rettangolo

# VARIABILI

var x{V};		
var y{V};

var a{V};	 
var b{V};
var c{V};

var base = sqrt((x[0]-x[2])^2+(y[0]-y[2])^2);
var h =  sqrt((x[1]-x[3])^2+(y[1]-y[3])^2);

# VINCOLI

# Normalizzazione retta

s.t. normalizzazione{i in 0..3}:
	a[i]^2 + b[i]^2 = 1;

# Perpendicolarità delle rette

s.t. perpendicolare{i in V, j in V : j = (i+1) mod 4}:
	a[i]*a[j] + b[i]*b[j] = 0;

# Piscina dentro al parco

s.t. dentroParco1{i in V}:
	x[i] <= 100;
s.t. dentroParco2{i in V}:
	x[i] >= 0;
s.t. dentroParco3{i in V}:
	y[i] <= 100;
s.t. dentroParco4{i in V}:
	y[i] >= 0;

# Passaggio retta

s.t. passaPerPunto{i in V}:
	a[i]*x[i] + b[i]*y[i] + c[i] = 0;
s.t. passaPerPunto2{i in V, j in V: (i+1) mod 4 = j}:
	a[i]*x[i] + b[i]*y[i] + c[i] = 0;

# Rapporto tra i lati

s.t. lato1:
	base >= p*h;
s.t. lato2:
	h >= p*base;

#alberi fuori dalla piscina
var z{P,V} binary;
param M:=100;

#punti interno tutti dallo stesso lato
s.t. punti_interni{i in V, j in V}:
	a[j]*x[i] + b[j]*y[i] + c[j] <=0;
s.t. albero_fuori{i in P, j in V}:
	a[j]*xP[i] + b[j]*yP[i] + c[j] >= - M*z[i,j];
#almeno per un lato la z = 0 ovvero vincolo disattivo
#ovvero per almeno un lato è esterno
s.t. almeno_un_lato{i in P}:
	sum{j in V}z[i,j]<= 3;


# OBIETTIVO

maximize w: base * h;


#########################

data;

param nP := 9;
param p := 0.4;
param nV := 3;

param: xP yP :=
1     5   90
2    85   10
3    92   86
4     7   12
5    50   48
6    52   25
7    28   51
8    73   50
9    54   75;

end;
