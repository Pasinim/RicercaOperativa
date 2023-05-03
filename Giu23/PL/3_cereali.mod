 
 
 ##SBAGLIATO, DA RIFARE!!!
 
 set c := 1..6;
 set t := 1..2; 
 
 param limAcq := 400000;
 param limAcri{t};
 param profitto{c};
 param acriReq {t, c};
 param acqReq{c};
 
 
 var x{t, c} >= 0; #quantita da coltivare di ogni cereale
 
 #Vincoli
 subj to acquaMax {j in t}:
	sum{i in c} x[j, i] * acqReq[i] <= limAcq;
subj to acquaNecessaria {i in c, j in t}:
	x[j, i] <= acqReq[i]
	;
subj to acriMax {j in t}:
	sum {i in c} x[j, i] * acriReq[j, i] <=  limAcri[j]
	;
 

#ob
maximize prof:
	sum  {i in c, j in t} x[j,i] * profitto[i]; 
	
data;
param acriReq : 1	2	3	4	5	6 :=
1				0.02 0.03 0.02 0.016 0.05 0.04
2				0.02 0.034 0.024 0.02 0.06 0.034
;

param profitto := 
1	48
2	62
3	28
4	36
5	122
6	94
;

param limAcri :=	1 200 2 400;
param acqReq := 
1 120 2 160 3 100 4 140 5 215 6 180
;

end;




	