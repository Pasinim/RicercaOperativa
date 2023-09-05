#Data una circonferenza trovare il punto su di essa che
#ottimizza una funzione obiettivo lineare

 #Centro = (2,3). Raggio = 5. Obj: 3x + 4y
 
 param xc := 2;
 param yc := 3;
 param r := 5;
 
 var xp;
 var yp;
 var z;
 
 subj to distanza:
 	sqrt((xc - xp)^2 + (yc-yp)^2) = r;

maximize w:
	a*xp + b*yp;
 	
 	data;
 	end;
 	
 	