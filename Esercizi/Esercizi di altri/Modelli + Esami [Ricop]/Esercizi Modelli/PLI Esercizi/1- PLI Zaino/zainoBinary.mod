# ESERCIZIO PLI Zaino (con variabili binarie, il problema originale)

#DATI
param N;					# Numero degli oggetti
set Oggetti := 1..N;		# Insieme degli oggetti
param a {Oggetti};			# Volume degli oggetti
param c {Oggetti};			# Valore degli oggetti
param b;					# Capacita dello zaino 

#VARIABILI
# variabili di selezione, se =1 oggetto selezionato, se =0 oggetto non selezionato
var x {Oggetti} >= 0, binary;

#VINCOLI
# la somma dei volumi degli oggetti scelti deve essere minore della capacita dello zaino
subject to Capacity:
	sum {i in Oggetti} a[i] * x[i] <= b;

# OBIETTIVO
# massimizzare il valore complessivo degli oggetti inseriti dentro lo zaino
maximize z : sum {i in Oggetti} c[i] * x[i];

#######################
data;

param N := 10;

param:	a		c :=
1		8		4
2		9		6
3		13		40
4		24		15
5		28		20
6		36		20
7		41		21
8		57		38
9		68		46
10		70		56;

param b := 100;

end;
