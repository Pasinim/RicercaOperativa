	# TDE Stiamo stretti

	# DATI
	param NS;															# Numero di settimane
	set Settimane := 1 .. NS;											# Settimane
	set MateriePrime;													# Materie prime
	param CostiMateriePrime {MateriePrime, Settimane};					# Costi delle materie prime [k*lire/unita]
	set Prodotti;														# Prodotti
	param RichiesteSettimanali {Prodotti};								# Richieste settimanali [unita]
	param Composizione {Prodotti, MateriePrime};						# Composizione [%]
	param VolumeMateriePrime {MateriePrime};							# Volume delle materie prime [punti culo]
	param VolumeProdotti {Prodotti};									# Volume dei prodotti [punti culo]
	param CapacitaMagazzino;											# Capacit� del magazzino [volume]

	# VARIABILI
	var MagazzinoProdotti {Settimane, Prodotti} >= 0;					# Unit� di prodotti in magazzino [unit�]
	var Produzione {Settimane, Prodotti} >= 0;							# Produzione [unit�]
	var MagazzinoMateriePrime {Settimane, MateriePrime} >= 0;			# Unit� di materie in magazzino [unit�]
	var Acquisti {Settimane, MateriePrime} >= 0;						# Materie prime comprate [unit�]
	var Utilizzo {Settimane, MateriePrime} >= 0;						# Utilizzo di materie prime [unit�]

	# VINCOLI
	# Definizione utilizzo [unit�]
	subject to DefinizioneUtilizzo1 {s in Settimane, mp in MateriePrime}:
		Utilizzo[s,mp] = sum {p in Prodotti} ( Produzione[s,p] * Composizione[p,mp] / 100 );
	# Conservazione del flusso dei prodotti [unit�]
	subject to ConservazioneFlussoProdotti1 {s in Settimane, p in Prodotti : s > 1}:
		MagazzinoProdotti[s-1,p] + Produzione[s,p] = MagazzinoProdotti[s,p] + RichiesteSettimanali[p];
	subject to ConservazioneFlussoProdotti2 {p in Prodotti}:
		Produzione[1,p] = MagazzinoProdotti[1,p] + RichiesteSettimanali[p];
	# Conservazione del flusso delle materie prime [unit�]
	subject to ConservazioneFlussoMateriePrime1 {s in Settimane, mp in MateriePrime : s > 1}:
		MagazzinoMateriePrime[s-1,mp] + Acquisti[s,mp] = MagazzinoMateriePrime[s,mp] + Utilizzo[s,mp];
	subject to ConservazioneFlussoMateriePrime2 {mp in MateriePrime}:
		Acquisti[1,mp] = MagazzinoMateriePrime[1,mp] + Utilizzo[1,mp];
	# Utilizzo quanto posso permettermi [unit�]
	subject to UtilizzoDelleMaterie1 {s in Settimane, mp in MateriePrime : s > 1}:
		Utilizzo[s,mp] <= MagazzinoMateriePrime[s-1,mp] + Acquisti[s,mp] - MagazzinoMateriePrime[s,mp];
	subject to UtilizzoDelleMaterie2 {mp in MateriePrime}:
		Utilizzo[1,mp] <= Acquisti[1,mp] - MagazzinoMateriePrime[1,mp];
	# Capacit� totale del magazzino
	subject to CapacitaTotaleMagazzino {s in Settimane}:
		sum {p in Prodotti} ( MagazzinoProdotti[s,p] * VolumeProdotti[p] ) +
		sum {mp in MateriePrime} ( MagazzinoMateriePrime[s,mp] * VolumeMateriePrime[mp] )
		<= CapacitaMagazzino;

	# OBIETTIVO
	# Minimizzare i costi di acquisto delle materie prime
	minimize z : sum {s in Settimane, mp in MateriePrime} Acquisti[s,mp] * CostiMateriePrime[mp,s];

	##################################################

	data;

	param NS := 4;

	set MateriePrime := A B C D;

	param CostiMateriePrime:	1	2	3	4	:=
	A							18	24	30	41
	B							40	50	65	80
	C							23	27	34	44
	D							12	19	28	39;

	set Prodotti := X Y Z W K Q;

	param RichiesteSettimanali :=
	X	77
	Y	28
	Z	126
	W	49
	K	21
	Q	84;

	param Composizione:		A	B	C	D	:=
	X                15  25  40  20
	Y                25  40  15  20
	Z                40  20  20  20
	W                25  25  25  25
	K                 5  50  40   5
	Q                50   5   5  40;

	param VolumeMateriePrime :=
	A             120
	B             130
	C             200
	D             180;

	param VolumeProdotti :=
	X          80
	Y          90
	Z         105
	W         120
	K         125
	Q         100;

	param CapacitaMagazzino := 60000;

	end;
