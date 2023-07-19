#La località di origine è indicata con "s"; quella di destinazione con "t".
#Le tratte ferroviarie interessate sono le seguenti. Di ciascuna è dato il numero di treni
#che la percorrono ogni giorno, il numero di vagoni disponibili su ogni treno 
#e la capacità di ogni vagone.

#dati
set stazioni:= 0..9;	#insieme delle stazioni rappresentate come nodi di un grafo
set tratte within stazioni cross stazioni;	#insieme delle tratte che collegano due stazioni, reappresentete come archi del grafo (sottoinseme dell'insieme stazioniXstazioni [prodotto cartesiano])
param numeroTreni {tratte};	#vettori dei treni che percorrono le tratte ogni giorno [scalare/gg]
param numeroVagoni {tratte};	#vettore del numero di vagoni di cui sono composti i treni nelle varie tratte [scalare]
param capacitaVagoni {tratte};	#vettore delle tonnellate trasportabili da ogni vagone della tratta [ton]
set merci;	#insieme delle tipologie di merci
param valore {merci};	#vettore del valore delle tipologie di merci [euro/ton]
param limitiCaricoScarico {stazioni,merci};	#matrice dei limti sulle quantitá di tipi di merci caricabili e scaricabili in ogni stazione [ton]

#variabili
var x {i in stazioni,j in stazioni, merci: (i,j) in tratte} >=0;	#variabile di flusso rappresentante la quantita di merce dei vari tipi transitante per ogni tratta (ho selezionato solo gli archi esistenti con la condizione di esistenza ": (i,j) in tratte" ) [ton]

#vincoli
#vincolo sulla conservazione del flusso  entrante e uscente => tutto quello che entra dev'essere uguale a tutto quello che esce per ogni tipo di merce (quindi sul flusso transitante in un nodo => devo scludere il primo e l'ultimo poiché questi avranno solo un arco entrante o solo uscente) [ton]
subject to controlloFlusso {s in stazioni, m in merci: s not in {0,9}}:
	sum {i in stazioni: (i,s) in tratte} x[i,s,m] = sum {j in stazioni: (s,j) in tratte} x[s,j,m];  

#vincolo sul carico e scarico => quindi sulla massima quantitá transitante per una stazione [ton]
subject to limiteStazioneCaricoScarico {s in stazioni, m in merci}:
	sum {i in stazioni: (i,s) in tratte} x[i,s,m]<= limitiCaricoScarico[s,m];

#vincolo sulla quantitá trasportabile dall stazione di partenza [ton]
subject to limiteStazionePartenza {m in merci}:
	sum {j in stazioni: (0,j) in tratte} x[0,j,m]<= limitiCaricoScarico[0,m];

#vincolo sulla massima quantitá trasportabile su una tratta [ton]
subject to maxQuantitaTratta {(i,j) in tratte}:
	sum {m in merci} x[i,j,m] <= numeroTreni[i,j] * numeroVagoni[i,j] * capacitaVagoni[i,j];

#obiettivo
#massimizzare il valore della merce giunta a destinazione [euro]
maximize z: sum {i in stazioni,m in merci: (i,9) in tratte} valore[m] * x[i,9,m];
#########
data;
set tratte:=0 1, 0 2, 1 3, 1 4, 2 4, 2 5, 3 6, 3 7, 4 6, 4 7, 4 8, 5 7, 5 8, 6 9, 7 9, 8 9;

param:	numeroTreni	numeroVagoni	capacitaVagoni:=
0,1		4			10				20
0,2		4			8				15
1,3		2			10				20
1,4		3			6				20
2,4		8			2				16
2,5		1			8				16
3,6		5			4				16
3,7		4			6				16
4,6		3			5				16
4,7		3			4				16
4,8		3			5				16
5,7		4			18				10
5,8		4			10				10
6,9		3			9				18
7,9		5			3				20
8,9		2			11				18;

#Ci sono tre tipi di merce: A, B e C.
set merci:= A B C;

#Di ogni merce è indicato il valore [Euro/tonnellata].
param valore:=
A	80 
B	50 
C	65;

#I limiti massimi sulla quantità di merce caricabile e scaricabile ogni giorno in ogni 
#stazione sono i seguenti.

param limitiCaricoScarico:	A		B		C:=
0							1000	1000	1000
1							300		1800	1400
2							250		900		100
3							900		650		1400
4							2000	1500	2000
5							1000	1000	1000
6							1200	1200	1400
7							600		700		950
8							300		1700	1900
9							1000	1000	1000;

end;

#I sindacati vogliono far diminuire il carico di lavoro degli scaricatori nelle stazioni intermedie. Ciò implica un lieve abbassamento dei limiti massimi sulla quantità di merci caricabili e scaricabili nelle stazioni. 
#1) In quali stazioni questi nuovi accordi sindacali causerebbero una perdita allo spedizioniere? 
# Dipende quanto lieve é l'abbassamento. In ogni caso le stazioni che soffrirebbere di un qualsiasi abbassamento sono quelle che hanno nell'analisi di sensitivitá la variabile slack del vincolo sul limite di carico e scarico a 0 su almeno una tipologia di materia => stazioni 1 e 2.

#2) Quanto dovrebbe essere disposto a pagare lo spedizioniere per assumere scaricatori a proprie spese in modo da mantenere i limiti suddetti al livello attuale?
# Un valore corrispondente al relativo prezzo ombra dei suddetti vincoli => 15 euro/gg per il limite della merce A nella stazione 1, 30 euro/gg per quello della merce A nella stazione 2 e 15 euro/gg per la merce C sempre della stazione 2.

#3) Quali sono le tratte ferroviarie critiche, cioè quelle per cui una diminuzione nel numero dei vagoni disponibili causerebbe una perdita allo spedizioniere?
# Quelle il cui vincolo qulla quantitá trasportabile abbia la variabile slack inferiore alla capacitá di 1 vagone per tutti i treni (es. in (0,1) 1 vagone puó contenere 20 ton e per 4 treni al giorno risulterebbe una capacitá di  80 ton. Se la variabile di slack fosse superiore significerebb che anche togliendo un vagone la quantitá effettivamente trasportata non subirebbe alcuna variazione) => (0,1), (3,6),

#L’ente gestore della ferrovia sta progettando di diminuire la lunghezza dei treni sulla tratta (6,t). 
#4) Qual è la riduzione del numero di vagoni per ogni treno su quella tratta che lo spedizioniere può sopportare senza perdere più del 10% del suo ricavo attuale?
# Decremento il numero di vagoni della tratta (6,9) di uno finché non ottengo un ottimo inferiore a piú del 10%, quindi una diminuzione fino a quest'ultimo non é ammissibile => Fino a 7 vagoni va bene.