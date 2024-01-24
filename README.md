# RicercaOperativa

Repository contenente gli esercizi di [Ricerca Operativa](https://homes.di.unimi.it/righini/Didattica/RicercaOperativa/Materiale/). <br/>
Gli appunti teorici delle videolezioni sono in [`Teoria/Note.md`](https://github.com/Pasinim/RicercaOperativa/blob/main/Teoria/Note.md). <br/>
Le domande dell'orale sono in [`Esercizi di altri/Modelli Esami`](https://github.com/Pasinim/RicercaOperativa/tree/main/Esercizi%20di%20altri/Modelli%20%2B%20Esami%20%5BRicop%5D). <br/>

Un esercizio in cui si può vedere bene la sintassi del linguaggio è [Caramelle.](https://github.com/Pasinim/RicercaOperativa/blob/main/ES_Sett/E%20-%20Caramelle)
Come risolutore è stato utilizzato [gusek](https://mega.nz/file/90MnlLyK#XCro_TxT1AEAf_K6S6UT1z9pAVCkxnUBqeESmbUmToA).

In `Tools` è possibile flaggare l'opzione `Generate PL analysis` per visualizzare anche l'analisi di sensività, che serve ad esempio per vedere quanto deve essere il prezzo di un prodotto che non è conveniente produrre. 

In [Investimenti]() è possibile vedere una matrice a 3.

Esercizi PLI: `.\Esercizi di altri\Modelli + Esami [Ricop]\Esercizi Modelli\PLI Esercizi`

- Domande orale + Testi Esercizi: `C:\Users\Marco\Desktop\RO-git\RicercaOperativa\Esercizi di altri\Modelli + Esami [Ricop]`

### AMPLIDE

Prima di compilare è necessario selezionare un solver, quello di default è minos `option solver minos`, altrimenti si può utilizzare `snopt` o altri. Per compilare eseguire il comando `solve;` 

___

### Esercizi esplicativi

Qui si trova una lista di esercizi che ho trovato difficili e particolari, che vengono risolti in un modo caratteristico.

1. [PacchiPostali.mod](https://github.com/Pasinim/RicercaOperativa/blob/main/_Gen24/PLI/PacchiPostali.mod) : È necessario utilizzare un `set` all'interno di un `set`. In particolare ci sono 2 tipi di *Packagin*g e per ogni tipo sono disponibili solamente due imballi:
   
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

2. [Chitarre](https://github.com/Pasinim/RicercaOperativa/blob/main/TDE/pl/34.2_05-01-20_chitarre/soluzione.pdf): Fornisce un esempio sull'analisi post ottimale in GUSEK

3. Potatura: identificazione della regione paretiana e altro esempio sull'analisi post-ottimale

4. [Sentinelle](https://github.com/Pasinim/RicercaOperativa/blob/main/_Gen24/PLI/Sentinelle.mod): Esempio di un grafo.
   
   > Si tratta di un problema di Minimum Dominating Set sul grafo della città. La soluzione è il sottinsieme S di minima cardinalità di vertici del grafo tale che ogni vertice del grafo o appartiene ad S o è adiacente ad almeno un vertice appartenente ad S. Tali sottinsiemi si dicono "dominating sets"

5. ProntoIntervento.mod tratta il *P-center location problem*.

____

Gli esercizi qui: `C:\Users\Marco\Desktop\RO-git\RicercaOperativa\Esercizi\Esercizi di altri\Modelli + Esami [Ricop]` hanno anche della documentazione. È inclusa la seguente lista di esercizi presenti nelle videolezioni raggruppati per tipologia:

> [Lista dei modelli svolti a lezione 21/22 in ordine cronologico]
> 
> ############## PL ##############
> 
> Mix Produttivo
> Patate
> Scommesse sui cavalli
> Cereali
> Miscelazione di idrocarburi 
> Pianificazione multi-periodo
> Caramelle
> PMO
> Il tempo e' denaro
> Cloud computing
> Elettrodomestici (PL, interpolazione)
> Sentinella (PL, catene di markov)
> 
> ############## PLI ##############
> 
> Zaino
> Assegnamento Lineare
> Set Covering
> Localizzazione dei depositi
> Antitrust
> Linear ordering
> Cifre vaganti
> Ring loading problem
> Immagini
> Gioco coi numeri
> Sudoku
> Editoria
> Prestito libri
> Penalized knapsack
> Ordini
> Frequenze
> Immagini
> Magazzino automatico
> 
> ############## PNL ##############
> 
> La farina di baobab
> Ragno
> Robot
> Telecamera
> Tripartizione
> Rettangolo
> Classificatore
> Elettrodotto
> Resistenze/Resistori
> Passerella
> Tiro al piattello
> Spin Glass
> Nutrie
> Cariche elettriche
> =======
