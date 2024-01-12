Qui si trova una lista di esercizi che ho trovato difficili e particolari, che vengono risolti in un modo caratteristico.

1. `PacchiPostali.mod` : È necessario utilizzare un `set` all'interno di un `set`. In particolare ci sono 2 tipi di *Packagin*g e per ogni tipo sono disponibili solamente due imballi:
   
   ```mathml
   set T := 1..nT; # Insieme dei pacchi
   param nP{T};    # Numero di pacchi per tipo
   set P{k in T} := 1..nP[k];
   ```

        Per eseguire i costraints su queste variabili si fa così:

```mathml
s.t. disponibilita {o in O, k in T}:
	sum {j in P[k]} x[o,k,j] <= 2;
s.t. volumeMinimo {t in T,  k in P[t]}:
	sum {o in O} x[o,t,k] *v[o] >= vMin[t] * y[t,k]; #solo se il paccho è utilizzato
```



 
