#DATI
param nMercati;
param nFondi;
param nAzioni;
param nCapitali;
set mercati := 0..nMercati; # USA , EU , JP
set fondi := 0..nFondi;
set azioni := 0..nAzioni;
set capitali := 0..nCapitali; # svizzera, colombia, principato
param composizioneCapitali {capitali}; #[mln€]
param rendimentoFondo {mercati,fondi}; #[%] NB: i fondi sonoentità diverse per ogni mercato
param maxAcquistabile {mercati,azioni}; #[mln€] NB: i fondi sonoentità diverse per ogni mercato
param composizioneFondi {mercati,fondi,azioni}; #[%] azioni presenti inogni fondo di ogni mercato
#param a {COLONNE,RIGHE}
#VARIABILI
# in che fondi investire?
var investimenti {mercati,fondi} >=0; #[€]
#VINCOLI
subject to massimo_capitali:
sum {m in mercati,f in fondi} investimenti[m,f] <= sum {c in capitali}
composizioneCapitali[c];

subject to max_azioni_acquistabili_antitrust {m in mercati, a in azioni}:
sum {f in fondi} investimenti[m,f]*composizioneFondi[m,f,a] <= maxAcquistabile[m,a];
#OBIETTIVO
maximize profit: # [mln€]
sum {m in mercati, f in fondi} investimenti[m,f] * rendimentoFondo[m,f];
########
data;
param nMercati := 2; # 3-1
param nFondi := 3; # 4-1
param nAzioni := 3; # 4-1
param nCapitali := 2; # 3-1
param rendimentoFondo(tr): 0 1 2 :=#COLONNE
 0 .35 .1 .4
 1 .1 .3 .3
 2 .6 .8 .2
 3 .4 .3 .1;
 #RIGHE
param maxAcquistabile(tr): 0 1 2 :=
 0 100 150 110
 1 100 120 90
 2 79 80 200
 3 98 90 130;
param composizioneCapitali:=
 0 433
 1 320
 2 377;
param composizioneFondi:=
[0,*,*](tr): 0 1 2 3 :=
 0 .5 .1 .2 2
 1 .3 .8 .2 0
 2 .2 0 .35 3
 3 0 .1 .2 5
[1,*,*](tr): 0 1 2 3 :=
 0 .9 .2 .0 .1
 1 .1 .3 .2 .7
 2 0 .4 0 1
 3 0 .1 .8 .1
[2,*,*](tr): 0 1 2 3 :=
 0 .7 0 .1 .2
 1 .2 .1 .5 .2
 2 .1 .1 .3 .6
 3 0 .8 .1 .6;
end;
