param B := 100; #base
param H := 50; #altezza
param nT := 5;
set T := 1..nT;
param pMin{T}; #Quantita minima esportabile [%]
param pMax{T}; #produzioen massima esportabile [%]
param acqua{T}; #acqua per m2 [m3]
param cA {T}; #concime A [kg/m2]
param cB {T};#concime B [kg/m2]

param pNaz{T}; #[e/mq]
param pEsp{T};

var x{T} >= 0; #produzione totale per tulipano[m2]
var y{T} >= 5; #base delle strisce 
var esp{T} >= 0;
var naz{T} >= 0;


#devo prima definire le strisce in cui vengono coltivati le specie
s.t. terrenoDisponibile:
	sum {t in T} y[t] <= B;  ##SE METTO SOLO = NON ESEGUE
#La quantita di tulipani è calcolata sulla base della superficie ad essi dedicata
s.t. produzionePerTerreno {t in T}:
	y[t] * H = x[t];
s.t. sommaEspNaz{t in T}:
	esp[t] + naz[t] = x[t];
#Limiti di esportazione 
s.t. upperBound {t in T}:
	esp[t] <= pMax[t] * x[t];
s.t. lowerBound {t in T}:
	esp[t] >= pMin[t] * x[t];

#Vincoli sulle risorse disponivile 
s.t. dispAcqua:
	sum {t in T} x[t] * acqua[t] <= 30000;
s.t. dispConcimeA:
	sum {t in T} x[t] * cA[t] <= 3000;
s.t. dispConcimeB:
	sum {t in T} x[t] * cB[t] <= 5000;
#f.o.
maximize profitto:
	sum {t in T} (esp[t] * pEsp[t] + naz[t] * pNaz[t]);


data;
param: pNaz	pEsp :=
1 60 90
2 80 110
3 120 155
4 75 100
5 80 85;

param: pMin pMax :=
1	0.1		0.4
2	0.15	0.6
3	0.05	0.75	
4	0.5		1	
5	0		0.5;

param: acqua	cA	cB :=
1 4.0 1.2 0.5
2 3.0 1.5 0.4
3 8.5 0.3 1.3
4 1.0 2.8 1.0
5 2.5 1.9 0.8;

end;
