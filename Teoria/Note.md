## 1. Introduzione

La ricerca operativa è il settore della matematica applicata che studia modelli matematici ed algoritmi. Un tipico prodotto della ricerca operativa è un *sistema di supporto alle decisioni (DSS: Decision Support System).*

**Obiettivo**: supportare processi decisionali utilizzando al meglio i dati disponibili (in forma digitale). La ricerca operativa vuole utilizzare nel modo migliore la tecnologia disponibile anzichè crearne una nuova.

##### Modelli di programmazione matematica

Ingredienti di un modello di programmazione matematica: *dati + variabili + vincoli + funzione obiettivo*.

Algoritmo $\xrightarrow{calcola}$ Soluzione (*assegnamento di valori alle variabili*).

Problemi di esistenza $\xrightarrow{trovare}$ soluzione ammissibile *(tutti i vincoli soddisfatti)*

Problemi di ottimizzazione $\xrightarrow{trovare}$ soluzione ottima *(massimizzare/minimizzare la funzione obiettivo)*

Quando l'obiettivo e i vincoli sono rappresentati da funzioni lineari delle variabili il problema è di **programmazione lineare.**

Quando le variabili sono vincolate da alcuni valori il problema è di **ottimizzazione discreta**.

## 2. Programmazione lineare

### S.t? f.o = funzione obiettivo?? variabili libere??

In un problema di programmazione lineare:

1. le variabili hanno un dominio continuo

2. i vincoli sono equazioni e disequazioni lineari

3. la funzione obiettivo è una funzione lineare delle variabili

I problemi nella forma **"alle diseguaglianze"** permettono di interpretare geometricamente il problema. Per passare dalla forma generale alla forma alle diseguaglianze è necessario eliminare dal modello i vincoli di uguaglianza e le variabili libere.

Nella f.o. (funzione obiettivo) i termini costanti possono essere trascurati e i vincoli ridondanti eliminati. Tutte le disequazioni devono essere coerenti in segno e opposte all'obiettivo:

- massimizzazione con vincoli $\leq$

- minimizzazione con vincoli $\geq$ 

<mark>Soluzione</mark> = assegnamento di valori alle variabili, che corrisponde ad un punto in uno spazio continuo  $n$ dimensioni, dove $n$ sono le variabili nel modello.

Vincolo di uguaglianza $ax = b \rightarrow$ **iperpiano**
Vincolo di disuguaglianza $ax \leq b \rightarrow$ **iperpiano**

Il sistema dei vincoli (nel modello delle diseguaglianze) corrisponde all'intersezione dei corrispondenti semispazi, questa intersezione corrisponde ad un [poliedro](https://imgur.com/a/Yu6hfl7). Se:

- il poliedro è vuoto non esistono soluzioni *ammissibili*

- il poliedro è illimitato nella direzione di ottimizzazione non esiste un valore ottimo finito

- esiste almeno un vertice del poliedro, quello corrisponde al valore ottimo

**Quando la funzione è lineare tutte le soluzioni equivalenti giacciono sullo stesso iperpiano**.

La direzione di ottimizzazione (cioè se massimizzazione o minimizzazione) definisce l'ordinamento degli iperpiani.

### Forma standard

Nella forma standard la funzione obiettivo viene messa nella forma di minimizzazione e tutti i vincoli di diseguaglianza vengono posti in forma di uguaglianza introducendo variabili non negative di scarto:
$-3x_1 + 2x_2 -2x_3 \leq 9 \xrightarrow{diventa} -3x_1 + 2x_2 -2x_3 + \textcolor{yellow}{x_4=} 9$

Mettendo in forma standard un problema alle diseguaglianze con $m$ vincoli e $n$ variabili di ottiene un modello con $m$ vincoli e $n+m$ variabili, **tutte non negative**.

*[forma standard]* variabile nulla $\xrightarrow{corrisponde}$ *[forma alle diseguaglianze]* vincolo attivo

<mark>Base </mark>= sottoinsieme di $m$ variabili scelte tra le $n+m$ della forma standard: $[\textcolor{blue}{B}|\textcolor{red}N]$. Una volta che si è scelta la base il sistema può essere riscritto come $\textcolor{blue}{Bx_B}+\textcolor{red}N]x_N  = b$ e per trovare la soluzione base è necessario invertire la matrice $\textcolor{blue}B$: $\textcolor{blue}{x_B} = \textcolor{blue}{B^{-1}}b  -\textcolor{blue}{B^{-1}}\textcolor{red}{Nx_N}$ da cui si ottiene $x_N = 0$ e $x_B = B^{-1}b$

Tutti i vertici del poliedro sono soluzioni di base ma non viceversa: possono esserci soluzioni non ammissibili, cioè quando $x_B \ngeq 0$.    

##### Forma canonica

Problema PL è in forma canonica se e solo se:

1. I coefficienti delle variabili di base $X_B$ formano una matrice identità $m\times m$

2. Le variabili di base $X_B$ non compaiono nella funzione obiettivo

La forma canonica è **standard** se e solo se:

1. I termini noti dei vincoli sono **NON** negativi

> Una forma canonica **debole** corrisponde ad una soluzione **non ammissibile**

### Teorema fondamentale della PL

Dato un problema $z=min\{c^Tx:Ax = b, x \geq 0\}$:

- Se esiste una soluzione ammissibile esiste anche una soluzione ammissibile di base

- Se esiste una soluzione ottima esiste anche una soluzione ottima di base

Per risolvere la programmazione lineare si utilizza **l'algoritmo del simplesso** che nella pratica è molto veloce e garantisce di terminare in un numero finito di passi garantendo una di queste situazioni:

1. la soluzione corrente è ottima

2. non esiste soluzione ammissibile (problema inammissibile)

3. non esiste soluzione ottima finita (problema illimitato)

## 3 - Algoritmo del simplesso

La struttura dati su cui opera l'algoritmo del simplesso è il **tableau**, una rappresentazione matriciale della forma canonica. L'algoritmo del simplesso mantiene l'ammissibilità e cerca l'ottimalità quando è inizializzato con una soluzione di base ammissibile. <u>Quando la soluzione di base iniziale è inammissibile si procede in vari modi per inizializzare l'algoritmo.</u>

```javadoclike
while (¬Infeasible(b, c)) ∧ (¬FeasibleBase(b)) do
    pivot(A, b, c)
if Infeasible(b, c) then
    Stop: problema inammissibile
else
    while (¬Optimal(c)) ∧ (¬Unbounded(A, c)) do
    pivot(A, b, c)
    if Optimal(c) then
        Stop: soluzione ottima
    else
        Stop: problema illimitato
```

### Iterazione/pivoting

Ad ogni iterazione si esegue un cambio di base in cui una variabile in base esce dalla base e una variabile fuori base entra in base

Regole di scelte colonna: questa regola garantisce che l'algoritmo del simplesso raggiunga l'ottimalità. Ad ogni iterazione dell'algoritmo del simplesso si sceglie sempre una colonna (variabile che entra in base) che abbia costo ridotto negativo

Come funziona l' algoritmo del simplesso?

1. Si sceglie la colonna da fare entrare in base prendendo la prima colonna con costo ridotto negativo (cioè il coefficiente della riga 0 deve essere negativo)

2. Si procede poi a scegliere la riga, andando a considerare solo elementi positivi e si sceglie la riga con costo ridotto minore $\frac{\text{termine noto}}{\text{elemento nella riga }}$

3. Per ogni altra riga del tableau è necessario calcolare la nuova riga mediante na differenza: $\text{vecchia riga} - (\text{coefficiente nella colonna pivot})\cdot\text{riga \textcolor{red}{(nuova)} pivot}$

4. Si itera finchè non si raggiunge la condizione ottimale, ovvero quando sulla riga 0 non ci sono costi ridotti negativi.

> Se non esistono candidati pivot positivi su una colonna con costo ridotto negativo il problema è illimitato

#### Inizializzazione delle soluzioni basi iniziali inammissibili

Se non esistono candidati pivot positivi su una colonna con costo ridotto negativo il problema è illimitato.

> Se non esistono candidati pivot positivi su una colonna con costo ridotto negativo il problema è illimitato

Se le variabili sono limitate (valori massimi o minimi sulle x) che introducono le soluzioni di base estesa.  **Soluzione base estesa:** soluzione nella quale n variabili hanno un valore pari al loro limite inferiore o superiore e le altre m formano un sistema lineare indipendente, cioè una base. In questo caso una variabile è fuori base perchè è pari al suo valore massimo (a contrario dei casi precedenti in cui una variabile era fuori base perchè era uguale a 0).

Se all'inizio non ho una forma canonica non ammissibile è necessario procedere in vari modi:

##### 1. Metodo delle variabili artificiali

Vengono introdotte delle variabili artificiali $u_i \geq 0$.

- Vantaggio: può sempre essere applicata

- Svantaggio: può richiedere nella prima fase molti passi di pivot e lavora su un tableau più grande di quello originario.

##### 2. Metodo "big M"

##### 3.  Metodo di Balinski-Gomory

## 4 - Teoria della dualità

| Problema Primale                 | Problema Duale                   |
| -------------------------------- | -------------------------------- |
| Minimizzazione                   | Massimizzazione                  |
| $m$ vincoli                      | $m$ variabili                    |
| $n$ variabili                    | $n$ vincoli                      |
| coefficienti della f.o.          | termini noti dei vincoli         |
| termini noti dei vincoli         | coefficienti della f.o.          |
| matrice dei coefficienti $A$     | matrice dei coefficienti $A^T$   |
| vincoli di uguaglianza           | variabili libere                 |
| variabili libere                 | vincoli di uguaglianza           |
| vincoli di disuguaglianza $\geq$ | variabili non-negative           |
| variabili non-negative           | vincoli di disuguaglianza $\leq$ |

### Teorema della dualità in forma debole

$z(\bar{x}) \leq w(\bar{y})$ significa che tutti i valori della f.o. che sto massimizzando stanno sotto tutti i valori della f.o. che sto minimizzando

### Teorema della dualità in forma forte

Per introdurlo è necessario conoscere il **teorema fondamentale dell'algebra** che dice che *o esiste un certificato di ammissibilità x, la cui esistenza dimostra che il sistema ha soluzione, oppure esiste un certificato di inammissibilità y, la cui esistenza dimostra che il problema non ha soluzione*.

Il **teorema di Farkas** essenzialmente è il teorema fondamentale dell'algebra (che è valido per le equazioni) rivisto per le disequazioni.

**Teorema della dualità forte:** se uno dei due problemi ammette soluzione ottima finita, allora anche l'altro ammette soluzione ottima finita e i due valori ottimi coincidono.

### Teorema fondamentale della dualità lineare

Data una coppia primale-duale $\begin{cases}P: maximize \ z(x), \ s.t.\ x\in X \\ D:minimize\ w(x),\ s.t.\ y\in Y\end{cases}$

esiste una sequenza finita di passi di pivot che porta l'algoritmo del simplesso a terminare riconoscendo uno di questi quattro casi:

1. soluzione ottima di P e D

2. P è illimitato e D è inammissibile

3. D è illimitato e P è inammissibile

4. sia P che D sono inammissibili

### Teorema dello scarto complementare

Data una coppia primale duale $\\ \begin{cases}\textcolor{red}{P}: maximize\ z = c^Tx\ s.t.\ Ax \leq b,\ x \geq 0 \\ \textcolor{green}D: minimize\ w = b^Ty\ s.t.\ A^Ty\geq c,\ y\geq 0\end{cases}$

condizione necessaria e sufficiente per l'ottimalità di due soluzioni ammissibili $\overline{x}$ e $\overline{y}$ è che valgano le equazioni nel sistema sottostante.

Le condizioni di scarto primale e duale sono: $\begin{cases}\textcolor{red}{\overline{y}}^T\textcolor{green}{(b-A\overline{x})} = 0 \\ \textcolor{green}{(A^T\overline{y} - c)} \textcolor{red}{\overline{x}} = 0\end{cases}$

cioè il prodotto tra un vettore di variabili (in rosso) e un altro vettore (quello tra parentesi, in verde ) di corrispondenti variabili di surplus.

Ciò significa che le variabili del duale per le variabili di slack del corrispondenti vincoli del primale devono dare come prodotto zero,  e viceversa.    

### Algoritmo del simplesso duale

Se ho un tableau di un  problema primale posso ottenere il tableau di quello duale.

Lavora sul tableau del primale come se si stesse lavorando sul tableau del duale. 

Con questo algoritmo è possibile operare direttamente sul tableau del primale evitando di scrivere il tableau del duale e ritrasformarlo nel primale. Nell'**algoritmo del simplesso duale** le regola di scelta del pivot sono duali:

1. la riga del pivot viene scelta *prima* della colonna: il suo termine noto dev'essere negativo (vincolo violato)

2. il pivot deve essere **negativo**

3. la colonna del pivot viene scelta minimizzando il valore assoluto del rapporto tra il coefficiente di costo ridotto e il candidato pivot

# 5. Analisi post-ottimale

Viene utilizzata per valutare la robustezza di una soluzione dato che i dati potrebbero essere affetti da errori o da approssimazioni. 

> La domanda a cui risponde l'analisi post-ottimale è: *quanto è robusta la soluzione ottima rispetto a possibili (piccoli) cambiamenti nel valore dei data che sono stati usati per calcolarla?*

> Quando si ha come base ottima $\beta = {1,2,3}$ significa che i vincoli di indice 1, 2, 3 sono NON attivi

### Analisi di sensitività

Scopo: Valutare l'intervallo nel quale può variare ogni coefficiente $c_j$ e $b_i$ senza che cambi la base ottima $\beta^*$, che rimane ottima finchè valgono le condizioni di ammissibilità e di ottimalità:

1. Ammissibilità: $x_B = B^{-1}b \geq 0$

2. Ottimalità: $\overline{c}_N = c_N - c_B^{-1}N \geq 0$

#### 1. Variazione di un coefficiente $c_j$ (coeff. f.o.)

I coefficienti $c$ sono i coefficienti che compaiono nella funzione obiettivo, quindi modificandoli si modifica la direzione di ottimizzazione. Se ad esempio il coefficiente di $x_1 $ (cioè $c_1) $ diminuisce, significa che il vincolo $x_1$ conta di meno, quindi sarà meglio andare nella direzione di $x_2$ (verso l'alto). **La base ottima cambia quando le linee di livello diventano parallele al vincolo**. AL contrario, quando $c_1$ aumenta, la f.o. ruota in senso orario e le curve di livello tendono a diventare verticali.

> **curve di livello $\neq$ linee di livello**

Quindi per avere un cambio i base è necessario che il coefficiente deve aumentare così tanto da rendere conveniente quella variabile.

> Quando calcolo $\Delta c_i$ prendo la riga in base (cioè sulla riga che ha 1) e faccio il rapporto tra il prezzo ombra e i coefficienti di quella riga.

##### 2. Variazione d di un coefficiente $b_j$ (termine noto)

Intuitivamente dal punto di vista geometrico, quando il termine noto diminuisce il vincolo trasla verso il basso, mentre quando aumenta il vincolo trasla verso l'alto. $\beta^*$ non cambia ma $x^*$ e $z^*$ invece cambiano dato che dipendono dal termine noto.

Per calcolare il minimo e il massimo devo prendere la linea del termine noto che sto considerando. Quando il vincolo non è attivo può spostarsi di tanto quanto non è attivo.

Quando il vincolo è attivo è limitato da due quantità, che si ottiene calcolando $\frac{-b_i^*}{a_{i \overline{j}}^+}$

> Quando calcolo $\Delta b_i$ considero le colonne delle variabili di slack e faccio il rapporto tra tutti i termini noti (quelli a dx) e i corrispondenti termini sulla riga.

### Analisi parametrica

> L'analisi di sensitività dice solamente l'intervallo entro il quale non cambia la base, l'analisi parametrica dice che cosa succede quando cambia una base.

L'analisi parametrica studia come $z^*$ dipende dal valore del termine noto di un vincolo prescelto. Si ottiene così una funzione lineare a tratti, dove ogni segmento corrisponde ad una base ottima ed ogni punto di discontinuità corrisponde ad un cambio di base

### Interpretazione economica della PL

I termini noti indicano quanto di ogni risorsa bisogna consumare per produrre ogni unità di $x_1, x_2, x_3$, i vincoli di non negatività indica che le risorse non possono essere negative e la i coefficienti della f.o. indicano un certo tipo di vantaggio che il sistema economico si prefigge di ottenere (come profitto, impatto sociale, ...). I coefficienti nei vincoli indicano invece quante unità della risorsa è necessario consumare.

> interpretazione economica = dei prodotti richiedono delle risorse

>  il prezzo ombra della risorsa è il c.c.r della sua variabile di slack, ciò significa che ogni unità in più di una certa risorsa fa salire z del valore pari al termine indicato dal coefficiente di costo ridotto.

I **prezzi-ombra** delle risorse (cioè i coefficienti di costo ridotto delle colonne di slack all'ottimo) indicano il massimo prezzo a cui conviene comprare la risorsa e il minimo prezzo a cui conviene venderla. Se la risorsa non viene utilizzata tutta (cioè una risorsa non scarsa) il prezzo ombra è nullo (e la colonna è in base), infatti non mi converrebbe nè comprarla (dato che non la sto nemmeno usando tutta) nè venderla (dato che non la sto utilizzando tutta potrei anche regalarla per farmi degli amici).

> Se una variabile $x_2$ è fuori base significa che non conviene produrre il prodotto 2. 

Il costo ridotto $\overline{c}_j$ si ottiene con la seguente formula: $\overline{c}_j = {c}_j - \Sigma_i\ a_{ij}\cdot\lambda_i$

- $c_j$ è il coefficiente di $x_j$ nella f.o., cioè il costo iniziale nella f.o.   

- $a_{ji}$ è il coefficiente sulla riga *i* e colonna $j$ nella matrice dei vincoli

- $\lambda_i$ è il prezzo ombra del vincolo $i$

# 6. PMO - Programmazione a molti obiettivi

La PMO è l'estensione della programmazione matematica nel caso in cui si presentino più funzioni obiettivo in conflitto tra di loro, ossia quando il miglioramento di una comporta un peggioramento di un altra. *Noi ci limiteremo alla programmazione lineare con due obiettivi*. **Con due obiettivi non si può utilizzare il concetto di soluzione ottima**, se nel problema di ottimizzazione ci sono più obiettivi in conflitto nessuna soluzione è ottima.

> Da soluzione ottima si passa al concetto di **soluzione non-dominata**.

In questo caso la risoluzione viene divisa in due parti:

1. calcolo della regione <u>pareto ottima</u>, ossia l'insieme delle soluzioni ammissibili non-dominate -> puramente algoritmica

2. Scelta di una soluzione tra quelle paretiane -> scelta del decisore

## Fase 1 - Trovare le soluzioni dominanti

### Dominanza

È un confronto tra **coppia di soluzioni**, (non di due f.o.) una domina l'altra se sono vere queste proprietà rispetto alle funzioni obiettivo.

1. $x'$ non è mai peggio di $x''$

2. Deve esistere una f.o. di $x'$ strettamente migliore di $x''$

> Devo cercare tra tutte le soluzioni se ne esiste una che la domina. Se non ne esiste nessuno significa che quella funzione non è dominata da nessun altra e la soluzione è **Pareto-ottima.**

**L'insieme delle soluzioni non dominate è la regione Pareto-ottima** del problema. Tutte le altre soluzioni che sono dominate da *almeno un altra* si scartano $\rightarrow$ questo è l'obiettivo della fase 1.

### Regione Pareto ottima

Le soluzioni pareto-ottime possono essere rappresentanti nello spazio degli obiettivi oltre che nello spazio delle variabili.

*Come si determina la regione paretiana?*

1. <u>Metodo dei pesi:</u> si definisce una combinazione convessa di tutte le f.o. (si mescolano le mele con le pere, si mescolano i tempi con i costi con le percentuali ecc...). Grandezze eterogenee (dal punto di vista dell'unità di misura) vengono messe assieme.
   Si inseriscono dei pesi $\lambda$ arbitrari e viene fatta l'analisi parametrica sui pesi.

2. <u>Metodo dei vincoli:</u> Viene mantenuta una sola f.o., tutte le altre vengono trasformate in vincoli. 

#### Regioni paretiane continue e discrete

Nel continuo il metodo dei pesi e quello dei vincoli sono equivalenti ed entrambi generano correttamente la regione paretiana. *Nel discreto, invece, il metodo dei pesi non garantisce di trovare tutte le soluzioni paretiane*.

## Fase 2 - scelta di una soluzione

Questa fase può essere supportata da metodi quantitativi ma richiede una scelta da parte de decisore. Esistono vari metodi:

1. **Metodo delle curve di indifferenza**: La soluzione che massimizza il criterio espresso dalle curve di indifferenza è quella che è tangente alla regione paretiana.
   Le curve di indifferenza più utilizzate sono quelle con questa espressione in cui tutti i pesi vengono moltiplicati per le funzioni obiettivo e elevati ad un certo esponente: $\omega( f(x)) = [\Sigma_{i=1}^k\ \ (\lambda_i f_i(x))^p]^{\frac{1}{p}}$
   *Solitamente le curve di indifferenza sono quelle con $p$ pari a 1, 2 e $+\infty$.*

2. **Punto di massimo curvatura:** Nella regione Paretiana, se la curva ha uno spigolo, se mi sposto da quel punto miglioro di poco una delle funzioni obiettivo peggiorando però di molto l'altra. È meglio rimanere nel punto di "spigolo", ossia quello con un raggio piccolo.

3. **Punto utopia** (nello spazio degli obiettivi): ha come coordinate i valori ottimi di ciascun obiettivo. Solitamente il punto utopia non è ammissibile se le due funzioni sono in conflitto tra di loro. Il punto però viene utilizzato dato che rappresenta una sorta di faro verso cui tendere.

4. **Criterio degli standard**: assomiglia al punto utopia che però è ammissibile dato che è all'interno (sotto la curva). Gli standard sono dei valori (minimi sindacali) che vogliamo raggiungere, dei valori-soglia al di sotto dei quali non si vuole che gli obiettivi scendano (anche gli obiettivi che non si stanno ottimizzando).

# 07. PLI - Programmazione Lineare Intera

Si utilizzano delle variabili **discrete**, in cui non valgono alcune proprietà dei problemi di PL. Esistono varie classi di problemi di ottimizzazione: Ip, BP, MIP, CO.

Quando si ottimizza nel discreto non si possono ovviamente utilizzare le derivate e il calcolo differenziale, non si può utilizzare un poliedro dato che il vertice potrebbe non essere di coordinate intere.

Per ottimizzare nel discreto si può:

1. Migliorare le formulazioni lineari, migliorare alcune formulazioni per risolvere un problema di PLI come problema di PL $\rightarrow$ algoritmi **cutting planes**

2. scomporre il problema in sotto-problemi più piccoli e facili $\rightarrow$ **branch and bound**

3. Enumerazione *implicita* delle soluzioni

### Ottimalità

A differenza del continuo non si può più utilizzare il simplesso con i costi ridotti (che erano sostanzialmente delle derivate), non esiste il concetto di base. Si calcolano però degli upper e il lower bound e l'ottimalità viene dimostrata con essi $\rightarrow \underline{z} \leq z^* \leq \overline{z}$, in cui:

- se P è un problema di minimizzazione, $\overline{z}$ è un bound primale e $\underline{z}$ è un bound duale

- se P è un problema di massimizzazione,$\overline{z}$ è un bound duale e $\underline{z}$ è un bound primale

L'obiettivo è quello di ottimizzare il **gap di ottimalità**, ossia $\overline{z} - \underline{z}$. Se questa differenza è pari a 0 si ha la **garanzia di ottimalità**.

### Bound primale

Valore che corrisponde ad una soluzione ammissibile. Per calcolarlo si possono utilizzare algoritmi euristici o meta-euristici oppure con algoritmi di approssimazione con garanzia.

### Bound duale

> Il teorema della dualità (solo in forma forte) non vale, quindi esiste un gap tra la soluzione ottima primale e tra quella del duale.

Valore della funzione obiettivo in corrispondenza di una soluzione super-ottima $\overline{x}$, ossia soluzioni "troppo belle per essere vere" e che non sono ammissibili. Per trovare un bound duale di un problema P:

1. risolvere all'ottimo un *rilassamento* R di P

2. trovare una soluzione ammissibile al *duale* D di 

R è un rilassamento di P quando:

- <div>
  Tutte le <mark></mark>soluzioni che sono ammissibili per P devono essere ammissibili anche nel rilassamento R
  </div>

- tutte le soluzioni ammissibili di P devono essere **non peggiori** del rilassamento R

#### 1. Trovare il bound duale con rilassamento

Se valgono queste proprietà è sicuramente che la soluzione ottima del rilassamento è meglio del problema originale $\rightarrow z^*_R \leq z^*_P$

Esistono diversi tipi di rilassamento:

1. Rilassamento lineare continuo: vengono trascurate le condizioni di integralità del problema di ottimizzazione discreta (P). La soluzione ottima del rilassamento è anche la soluzione ottima del problema del discreto.

2. Rilassamento combinatorio: il rilassamento del problema discreto (combinatorio) e si ottiene un altro problema di ottimizzazione ma più facile da risolvere. Un esempio è il problema del commesso viaggiatore

3. Rilassamento Langrangeano: si parte da un problema di ottimizzazione (lineare discreto) che ha un obiettivo, il rilassamento è dato rimuovendo i vincoli e inserento all'obbiettivo delle penalità nel caso in cui i vincoli vengono violati

4. Rilassamento surrogato: alcuni dei vincoli vengono sostituiti con un unico vincolo ottenuto da una combinazione complessa dei vincoli iniziali.

___

I rilassamenti forniscono dei bound più o meno migliori/peggiori, in generale il rilassamento lineare continuo fornisce il bound più debole: $z_{LP}^* \leq z_{LR}^*\leq z^*_S\leq z^* \leftarrow$ se è un problema di minimizzazione, se fosse di massimizzazione devo invertire il segno.

#### 2. Trovare il bound duale con la dualità

Per trovare il bound duale è necessario trovare una soluzione ammissibile per il problema duale P oppure per il duale di un suo rilassamento.

**Matching:** ogni vertice del grafo non può essere toccato da più di uno arco

___

> IN QUESTO CORSO CI SI OCCUPA SOLAMENTE DEL RILASSAMENTO CONTINUO

## Formulazioni lineari

Il rilassamento continuo è un problema di ottimizzazione, quindi è rappresentato da un poliedro. Nel discreto però ci sono più poliedri, quindi la formulazione non è unica. 

Per confrontare le formulazioni si utilizzano gli algoritmi cutting planes dato che trovandole si riescono a trovare algoritmi più efficienti $\rightarrow$ **Formulazione ideale**.

La formulazione di un problema lineare corrisponde ad un poliedro e i vincoli della formulazione ideale  corrispondono al *guscio convesso* delle soluzioni intere.

La formulazione ideale corrisponde al guscio convesso delle soluzioni intere, tuttavia in generale non si conosce la formulazione ideale dei problemi di ottimizzazione lineare intera, inoltre il numero dei vincoli del guscio convesso può crescere esponenzialmente con la dimensione dell'istanza.

*Come si confrontano formulazioni diverse?* La disciplina che studia questo campo di chiama **polyhedral combinatorics**.

Disaggregare i vincoli permette di generare una migliore formulazione (slide 20 PLI).

### Algo. Cutting Planes

Migliora iterativamente le formulazioni avvicinandosi sempre di più al guscio convesso e dopo ogni iterazione $z^{*(t)}$ è un bound duale valido.

#### Procedura Chvatal-Gomory

Qualsiasi diseguaglianza valida può essere generata con questa procedura in un numero finito di passi. Permette di trovare la formulazione ideale anche se generalmente non so quali sono i passi (ma so che esistono). *L'efficacia della procedura dipende da u*.

Gli algoritmi *cutting-planes* garantiscono di trovare dopo un certo numero di iterazione l'ottimo del discreto, se i piani di taglio sono generati in modo efficiente. Tuttavia il numero finito di passi potrebbe anche essere molto grande, per questo motivo ci si può accontentare semplicemente di una formulazione più stretta che può fornire bounds duali più efficaci di un algoritmo branch and cut. 

Lo svantaggio è che è necessario una procedura valida per generare iterativamente diseguaglianze valide e utili ossia un algoritmo di separazione.

### Tagli di Gomory

Con i tagli di Gomory si può sempre andare avanti (non devo terminare se non trovo la diseguaglianza valida - vedi slide 25 PLI) ed utilizzano la procedura di Chvatal Gomory. Vengono calcolati utilizzando il tableau della soluzione ottima corrente. Come si fa?

# 08. Branch and Bound

## Branching

Il branching consiste nel suddividere il problema principale in sottoproblemi più semplici da risolvere, e poi unire le soluzioni per risolvere il problema principale. Ci sono due modi per fare branching:

1. Fissaggio di variabili

2. Inserzione di vincoli

> Ogni sottoproblema è una restrizione del suo predecessore ed un rilassamento dei suoi successori.

Il branching può essere binario, oppure n-ario.

**La procedura ricorsiva del branching termina quando il sottoproblema corrente è inammissibile *oppure* è risolto all'ottimo *oppure* può essere trascurato**

## Bounding

Il bounding consiste nell'associare un bound duale ad ogni sotto-problema F.

## Visita dell'albero

Quando vengono generati dei sottoproblemi vengono appesi ad una lista di nodi aperti. La politica seguita per visitare gli alberi viene chiamata Search strategy e può essere *FIFO (BFS), LIFO (DFS) o Lista ordinata* (in cui vengono esplorati prima i nodi più promettenti e per visitarla si utilizza uno heap).

# 10. PNL - Programmazione Non Lineare

La PNL studia problemi di ottimizzazione in cui la f.o. o altri vincoli sono non lineari.

Le soluzioni possono essere ottimi locali oppure ottimi globali:

- Locale: $\exist \epsilon > 0 : f(\bar x) \leq f(x) \  \forall x \in X : || \bar X - x || \leq \epsilon$ $

- Globale: $f(x^*) \leq f(x) \forall x \in X$

Per trovare il minimo globale è necessario enumerare tutti gli ottimi locali, pratica in generale non fattibile per il loro grande numero e perchè non è noto un algoritmo per eseguirla in modo efficiente.

Una eccezione positiva è la **programmazione convessa**, in cui l'ottimalità locale implica quella globale e se esistono più ottimi formano un insieme convesso. Un problema di minimizzazione non-lineare è convesso quando:

- la funzione obiettivo è una funzione convessa

- la regione ammissibile è un insieme convesso. La regione ammissibile è convessa quando:
  
  - tutti i vincoli di uguaglianza $h(x)=0$ sono lineari
  
  - tutti i vincoli di disuguaglianza, riscritti in forma $g(x) \leq 0$ sono convessi

La f.o. da minimizzare deve essere convessa (oppure concava nel caso di massimizzazione). <mark></mark>
