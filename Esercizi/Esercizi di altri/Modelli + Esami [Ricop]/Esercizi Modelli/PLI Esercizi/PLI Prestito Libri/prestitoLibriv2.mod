# ESERCIZIO 102 - PLI Prestito Libri

#DATI
param nR;						# Numero di richieste
set R:= 1..nR;					# Insieme di richieste
param s {R};					# Giorno iniziale
param e {R};					# Giorno finale
param libro {R};				# Libro richiesto

#VARIABILI
var x {R} binary;				# Selezione richieste soddisfatte (1 = richiesta accettata, 0 = richiesta rifiutata)

#Ipotesi: ogni libro puo' essere riconsegnato e dato nuovamente in prestito nello stesso giorno
#Conseguenza 1: la durata del prestito e' e[i] - s[i]
#Conseguenza 2: non si ha sovrapposizione se e[i]=s[j]

#VINCOLI
#Vincolo di incompatibilita' tra coppie di richieste (ho un vincolo per ogni  coppia)
#Non posso soddisfare 2 richieste se si sovrappongono
subject to Incompatibili {i in R, j in R: (libro[i] = libro[j]) and (i<>j) and (e[i]>s[j]) and (e[j] > s[i])}:
	x[i] + x[j] <= 1;

#OBIETTIVO
#Obiettivo 1: massimizzare numero di richieste soddisfatte/accettate
maximize z1: sum {i in R} x[i];
#Il valore ottimo e' 25
subject to Opt2: sum{i in R} (e[i]-s[i]) * x[i] =167;
#Il miglior valore corrispondente all'ottimo di z2 e' 17

#Obiettivo 2: massimizzare la durata totale dei prestiti
maximize z2: sum {i in R} (e[i] - s[i]) * x[i];
#Il valore ottimo e' 167
#subject to Opt1: sum {i in R} x[i] = 25;
#Il miglior valore corrispondente all'ottimo di z1 e' 138

####################
data;

param nR:=40;

param:		s		e		libro :=
1			1		4		2
2			1		6		1
3			1		10		2
4			1		5		3
5			1		7		3
6			2		25		6
7			2		12		1
8			2		10		1
9			3		15		3
10			3		17		4
11			3		6		4
12			4		20		5
13			6		12		3
14			6		9		2
15			7		15		1
16			7		14		4
17			8		13		1
18			10		15		2
19			11		18		1
20			13		22		2
21			15		33		1
22			17		40		2
23			18		40		5
24			22		24		5
25			23		25		1
26			23		30		7
27			24		42		6
28			25		27		2
29			25		28		5
30			25		31		7
31			26		27		1
32			28		31		1
33			28		31		2
34			30		33		5
35			32		39		7
36			32		34		1
37			35		37		2
38			35		39		5
39			35		42		1
40			36		41		5;

end;
