param cf := 1000; #[e]
param cv := 10; #[e/kg]
param k := 80; 
param Q := 70; #[kg/mese]
param P  := 20; #massimo prezzo di vendita [e/kg]

#Var
var A >= 0, <=Q, := 65; #quantita da acquistare [kg/mese]


#Obj
#Conviene entrare sul mercato? Massimizzare i profitti [e/mese]
maximize z: 
	P*A - (k*sqrt(A) + cv*A);

end;
#Si possono avere degli errori di compilazsione, in questao caso parte a calcolare
#il gradiente dal punto 0 e esce errore perchè sta calcolando la derivata (tangente verticale)
#in cui non esiste; Per evitare questo problema devo definire il punto in cui iniziare
#a calcolare il gradiente. Per questo motivo defisco A:=1
#Da comunque errore con 1 perchè è nel bacino di attrazione del punto 0 e da errore quando si avvicina al punto 0/
#parto quindi dall'altro minimo locale, cioè 70