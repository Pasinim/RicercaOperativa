param l := 16;
set Q := 1..3;
param xa{Q}; #Ascisse degli estremi del quadro
param ya{Q}; #Ordinate degli estremi del quadro
param xb{Q};
param yb{Q};
param dmin := 1;

#Posizione della telecamera
var x >= dmin, <= l-dmin;
var y >= dmin, <= l-dmin;
var angolo{Q};

#Vincoli
s.t. def_angolo{q in Q}:
	lung[q]^2 = dista[q]^2 + disb[q]^2 - 2*dista[q]*distb[q]*cos(angolo[q]);

#Ob: Devo calcolare gli angoli.
maximize zTizio: sum {q in Q} angolo[q];
#maximize zCaio: minangolo:
#s.t. Maxmin{q in Q}: minangolo <= angolo[q]; 

data;
# A è a sx, b a dx rispetto al sensore, modifico le coordinate di consegnueza.
param: xa ya xb yb :=
1 0 0 0 4
2 0 10 6 16
3 15 0 10 0
;
end;


