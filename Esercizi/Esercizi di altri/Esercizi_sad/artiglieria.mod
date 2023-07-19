#Esercizio Artiglieria
#dati
param v;
param g;

#variabili
var x0 <=8500;
var alpha >=0 <=90;
var delta >=0; #delta arrivo

#vincoli
#deve superare il muro
s.t. muro:
	tan(alpha)*(1-((g*10000)/v*sin(2*alpha)))>=401;

#deve partire dal punto che stiamo cercando
s.t. partenza:
	tan(alpha)*(1-((g*(-x0))/v*sin(2*alpha)))=0;


#deve colpire il nemico
s.t. colpito:
	tan(alpha)*(1-((g*(11000-delta))/v*sin(2*alpha)))=200;
	
#obiettivo
minimize w:delta;

############
data;

param v:= 100;
param g:= 9.8;

end;

