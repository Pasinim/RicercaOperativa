
# DATI

set T; # insieme dei tulipani

param base;#  base della stesura
param altezza; # altezza della stesura 
param maxh2O; # massima quantità d'acqua
param maxC1 ; # massima quantità del primo concime
param maxC2 ; # massima quantità del secondo concime

param lB{T};# lowerbound di fiori internazionali
param uB{T};# upperbound di fiori internazionali
param h{T}; # consumo di h20 per ogni tulipano
param c1{T};# consumo del primo concime
param c2{T};# consumo del secondo concime
param cN{T};# costi di ciascun tulipano nazionalmente
param cI{T};# costi di ciascun tulipano internazionalmente


# VARIABILI
var x{T} >= 0; # variabile tulipani nazionali
var y{T} >= 0; # variabile tulipani internazionali


# VINCOLI

subject to lBound {i in T} :
    y[i] * 100>= lB[i]*(x[i] + y[i]); 

subject to uBound {i in T} :
    (y[i] * 100)  <=  uB[i] * (x[i] + y[i]);

subject to MaxAcqua :
    sum {i in T} ((x[i]+y[i]) * h[i]) <= maxh2O;

subject to MassimoC1 :
    sum {i in T} ((x[i]+y[i]) * c1[i]) <= maxC1;

subject to MassimoC2 :
    sum {i in T} ((x[i]+y[i]) * c2[i]) <= maxC2;

subject to AreaMin {i in T}:
     x[i] + y[i] >= 250;

subject to AreaMax :
    sum {i in T} (x[i] + y[i]) <= base*altezza;

 



# OBIETTIVO

maximize z: sum{i in T} (x[i]* cN[i] + y[i]*cI[i]);


data;

set T := A B C D E;

param base := 100;
param altezza := 50;
param maxh2O := 30000;
param maxC1 := 3000;
param maxC2 := 5000;

# Per ogni tipo di tulipano la percentuale destinata all'esportazione deve essere compresa entro i limiti seguenti:

param lB :=
   A       10
   B       15
   C        5
   D       50
   E        0;

param uB :=
   A   40  
   B   60  
   C   75  
   D  100  
   E   50; 


# Ciascun tipo di tulipano richiede per ogni metro quadrato le seguenti quantità di acqua e concimi:
param h:=
   A     4.0     
   B     3.0     
   C     8.5     
   D     1.0     
   E     2.5; 

param c1 :=
   A     1.2     
   B     1.5     
   C     0.3     
   D     2.8     
   E     1.9;

param c2 :=
   A      0.5 
   B      0.4 
   C      1.3 
   D      1.0 
   E      0.8; 

# Il prezzo di vendita dei tulipani (espresso in Euro/mq) Ë il seguente:

param cN :=
   A         60    
   B         80    
   C        120    
   D         75    
   E         80;    


param cI :=
   A      90 
   B     110 
   C     155 
   D     100 
   E      85; 

end;
