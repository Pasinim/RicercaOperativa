param  nF := 2;
set F := 1..nF; # Insieme dei farmaci
param nH := 24;
set H := 1..nH; # Insieme delle fasce orarie

param p_min{H}; # Livello minimo di proteina Y richiesto in ogni fascia oraria
param p_max;    # Livello massimo di proteina Y consentito (45 mg/cc)
param c_farmaco{F}; # Costo del farmaco per grammo

param effetto{F, H}; # Tasso di proteina Y prodotta per ogni grammo di farmaco assunto dopo H ore

var x{F, H} >= 0; # Quantità del farmaco da assumere in ogni fascia oraria

minimize costo_totale: sum{f in F, h in H} c_farmaco[f] * x[f, h];

subject to proteina_minima{h in H}:
    sum{f in F, h_eff in H: h_eff <= h} effetto[f, h - h_eff] * x[f, h_eff] >= p_min[h];

subject to proteina_massima:
    sum{f in F, h in H} effetto[f, h] * x[f, h] <= p_max;

subject to non_negativita{f in F, h in H}:
    x[f, h] >= 0;

data;


param p_min :=
0 5.0
1 1.0
2 0.0
3 0.0
4 0.0
5 0.0
6 4.0
7 15.0
8 12.0
9 5.0
10 4.0
11 3.0
12 0.0
13 25.0
14 30.0
15 25.0
16 15.0
17 5.0
18 4.0
19 3.0
20 25.0
21 30.0
22 25.0
23 20.0;

param p_max := 45;

param c_farmaco :=
1 0.70
2 0.9
;

param effetto: 1 2 :=
0 1.5 2.5
1 3.0 4.0
2 4.0 5.5
3 2.5 4.0
4 1.9 3.0
5 1.4 1.5
6 1.0 0.7
7 0.7 0.4
8 0.5 0.2
9 0.3 0.0
10 0.2 0.0
11 0.1 0.0
12 0.0 0.0;

end;

