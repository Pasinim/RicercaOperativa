 # Esercizio Resistore
 
 # DATI
 
 param nT;			# Numero di tipi di resistori
 set T := 1..nT;    # Insieme di tipi di resistori
 param num{T};	    # Numero resistori disponibili per ogni tipo
 param res{T};		# Valore di resistenza per ogni tipo
 param Rtarget;	 	# Valore di resistenza desiderato
 set P := 1..4;		# Posizioni
 
 # Variabili
 
 var x{T,P} binary;	# Assegnamento dei resistori
 var R{P};
 var delta;
 # Vincoli
 
 s.t. Assign{p in P}:
 	sum{i in T} x[i,p] = 1;
 
 s.t. AssignT{t in T}:
 	sum{p in P} x[t,p] <= num[t];
 
 # Obiettivo
 minimize z : delta;
 
 s.t. val_ass:
  delta >= Rtarget - ( 1/((1/R[1])+(1/R[2])) + 1/( (1/R[3])+(1/R[4]) ) );
 
 s.t. val_ass2:
  delta >= ( 1/((1/R[1])+(1/R[2])) + 1/( (1/R[3])+(1/R[4]) ) ) - Rtarget;
 
 s.t. Reistenze {p in P}:
 	R[p] = sum{t in T} res[t]*x[t,p];
 ################
 
 
 data;

param nT := 6;

param: num res :=
 1      1         12
 2      1         15
 3      2         20
 4      2         22
 5      1         30
 6      1         40;

param Rtarget := 65;
end;
 