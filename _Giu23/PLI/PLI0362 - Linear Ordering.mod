param N := 7;
set n := 1..N;
param grafo{n, n};


#Variabili
var x{n, n} binary; #var assegnamento che indica che n è connesso a j
#Vincoli
#Grafo completo (ogni coppia di vertici deve essere collegata)
subj to completo {i in n, j in n: (i<j)}:
	x[i,j] + x[j,i] >= 1;
	
#un grafo completo non può avere cicli
subj to ciclo {i in n, j in n, k in n: (i<>j) and (j<>k) and (k<>i)}:
	x[i,j] + x[j,k] + x[k, i] <= 2;
#Ob
#Minimizzare la somma dei pesi degli archi
minimize z:
	sum {i in n, j in n} x[i,j] * grafo[i, j];

data;
param grafo : 1	 2	3	4	5	6	7 :=
1			  0  68  81  23  45  20  37
2			 12   0  25  51  57  89  78
3			 34  27   0  12   9  71  20
4			 95  55  42   0   8  23  44
5			 60  60  51  34   0   2  40
6			 93  22  48  45  24   0  77
7			 75  64  36  25  16  21   0
;
end;
