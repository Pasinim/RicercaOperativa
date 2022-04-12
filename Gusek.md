`glpsol` è un solutore di PL e PLI (Programmazione Lineare Intera)

`gusek` è l'interfaccia. Il linguaggio che si usa per descrivere i modelli che il solutore poi prende in input si chiama `mathProg` che è un sottoinsieme del linguaggio di `AMPL`.

 Questo linguaggio permette di dividere il modello e i dati (mettendoli in due file diversi) in modo tale da cambiare solamente i dati o solamente i modelli.
 Il file che contiene il modello è `.mod`, quello per i dati è `.dat`. Devo salvare il modello e poi nella tab Options selezionare l'opzione che permette di utilizzare un file esterno per i dati (o CTRL + 4).

Nel file generato in output il numero delle colonna è: *numero di vincoli + obiettivo*  

___

`Set` rappresenta degli insiemi

```

```
