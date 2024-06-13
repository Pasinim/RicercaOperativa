param B := 100;
param H := 50;
param nT := 5;
set T := 1..nT;
param bmin := 5;
param pNaz{T}; 
param pEsp{T};
param espMin{T}; 
param espMax{T};
param acqua{T};
param cA{T};
param cB{T};
param CC := 50; #prezzo concime [e/kg}

var Ac{T} >= bmin; #Area coltivabile per ogni tulipano
var Ae{T} >= 0; #Area destinata all'esportazone
var An{T} >= 0; #Area destinata alla vendita nazionale

var c{T} >= 0;
var r{T} >= 0; #Ricavo per ogni tulipani


s.t. def_An {t in T}:
	An[t] = Ac[t] - Ae[t];
s.t. areaTot:
	sum {t in T} Ac[t] / H <= B;
s.t. esportazioneMinima {t in T}:
	Ae[t] >= espMin[t] * Ac[t];
s.t. esportazioneMassima {t in T}:
	Ae[t] <= espMax[t] * Ac[t];
	
s.t. def_r {t in T}:
	r[t] = pNaz[t] * An[t] + pEsp[t] *Ae[t];
s.t. def_c {t in T}:
	c[t] =  CC*Ac[t]*(cA[t] + cB[t]);

s.t. disp_acqua:
	sum {t in T} acqua[t] * Ac[t] <= 30000;
s.t. dispConcimeA:
	sum {t in T} (cA[t] *Ac[t]*H) <= 3000;
s.t. dispConcimeB:
	sum {t in T} (cB[t] *Ac[t] *H) <= 5000;

maximize profitto:
	sum {t in T} (r[t] - c[t]);
data;
param: pNaz	pEsp :=
1 60 90
2 80 110
3 120 155
4 75 100
5 80 85;

param: espMin espMax :=
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
