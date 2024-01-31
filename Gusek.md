`glpsol` è un solutore di PL e PLI (Programmazione Lineare Intera)

`gusek` è l'interfaccia. Il linguaggio che si usa per descrivere i modelli che il solutore poi prende in input si chiama `mathProg` che è un sottoinsieme del linguaggio di `AMPL`.

Questo linguaggio permette di dividere il modello e i dati (mettendoli in due file diversi) in modo tale da cambiare solamente i dati o solamente i modelli.
 Il file che contiene il modello è `.mod`, quello per i dati è `.dat`. Devo salvare il modello e poi nella tab Options selezionare l'opzione che permette di utilizzare un file esterno per i dati (o CTRL + 4).

Nel file generato in output il numero delle colonna è: *numero di vincoli + obiettivo*  

---

1. In questo codice compare l'errore `s not defined` perchè la sommatoria finisce dove c'è l'uguale, quindi non sta prendendo in considerazione la `s` contenuta in `tot[s]`.   
   
   ```go
    subject to totale:
       sum {s in Sostanze} y[s] = tot[s];
   ```
   
   Una soluzione è quella di spostare la gli indici della sommatoria sopra:
   
   ```go
   subject to totale {s in sostanze}:
       sum {a in alimenti} y[s] = tot[s];
   ```

2. Linearizzare il valore assoluto:
   
   ```go
   minimize z1: z;
       subj to Vincolo1 {g in nG}: z >= err[g];
       subj to Vincolo2 {g in nG}: z >= -err[g];
   ```

3. Definisco il valore assoluto (preso da git PL0082):
   
   ```go
   param g { u in U, d in D} = min(gud[u,d], gdu[u,d]);
   ```

4. Quando ho una variabile di assegnamento per solamente due elementi utilizzo 0 se viene assegnato all'elemento 1, 1 altrimenti

5. Distanza tra due punti:
   
   `param d {i in N, j in M} := sqrt( (x1[i]-x2[j])^2+(y1[i]-y2[j])^2 );`

6. Quando devo ottimizzare una funzione minmax (esercizio TurnazionePersonale):
   
   1. Prima definisco una variabile ausiliaria `z`, corrispondente al massimo di una serie di variabili: $z \geq \sum_t \sum_gx[g,t,o] \cdot d[g,t] \ \ \  \forall o \in O$
   
   2. Minimizzo il massimo (cioè z): `minimize z1: z;`

7. Quando definisco una variabile ausiliaria devo sempre imporre un vincolo $\geq$, se metto solo = si rompe:
   
   ```go-mod
   s.t. def_ingTot {i in I}:
       ingTot[i] >= sum{b in B} x[b] * perc[i,b];
   ```

8. Se ho una tabella con delle percentuali faccio prima a dividere per 100 direttamente nella tabella anzichè dividere nei vincoli
