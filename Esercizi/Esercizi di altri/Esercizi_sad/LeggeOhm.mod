# Legge di Ohm
# Dati
param nS;
set Studenti := 1..nS;
param v{Studenti};			# Valore di tensione [V]
param i{Studenti};			# Valore di intensità di corrente [mA]

# Variabili

var e {Studenti};			# Errore di misura per ogni studente [Volt]
var R;						# Valore della resistenza [KOhm]
#var z1;						# Max errore in valore assoluto [Volt]
#var z2;						# Valore assoluto del valor medio degli errori [Volt]
var z3{Studenti};			# Valore assoluto dell'errore di ogni studente [Volt]

# Sicché ho aggiunto delle variabili, devo aggiungere dei vincoli, altrimenti non ne avrei

# Vincoli

# Errore di misura = differenza tra valore misurato e valore calcolato.  [Volt]
s.t. Def_errors {s in Studenti}:
	e[s] = v[s] - R*i[s];

# Obiettivo

# Obj1: minimizzare il massimo errore in valore assoluto [Volt]

# Non posso usare funzioni come max() o abs() altrimenti perdo la linearità

#minimize obj1: z1;
#s.t. Minmax1 {s in Studenti}: z1 >= e[s];
#s.t. Minmax2 {s in Studenti}: z1 >= -e[s];

# Obj2: minimizzare il valore assoluto del valor medio degli errori [Volt]
#minimize obj2: z2;
#s.t. MinAbs1: z2 >= (sum {s in Studenti} e[s]/card(Studenti));
#s.t. MinAbs2: z2 >= -(sum {s in Studenti} e[s]/card(Studenti));

# Obj2 ha poco senso, sappiamo già in partenza che il valore ottimo è 0.

# Obj3: minimizzare il valor medio del valore assoluto degli errori [Volt].

#minimize obj3: sum{s in Studenti} z3[s]/card(Studenti);

#s.t. MinAbs1 {s in Studenti} : z3[s] >= e[s];
#s.t. MinAbs2 {s in Studenti} : z3[s] >= -e[s];

# Obj4: minimizzare l'errore quadratico medio [Volt].

#minimize obj4: sum {s in Studenti} (e[s])^2/card(Studenti);

subject to Condizione:
	sum {s in Studenti} (v[s]*i[s] - R*i[s]^2) = 0;


#######

data;

param nS := 12;

param: v i :=
1 18.3 12.2
2 20.5 14.1
3 32.2 21.9
4 12.2 8.4
5 10.1 6.7
6 22.6 15.0
7 30.1 20.3
8 28.0 18.5
9 23.4 15.8
10 15.5 10.0
11 14.7 10.4
12 15.4 10.0;

end;

