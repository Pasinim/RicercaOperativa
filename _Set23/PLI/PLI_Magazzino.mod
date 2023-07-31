param nV := 15;
param nS := 5; #segherie
set S := 1..nS; 
set V := 1..nV;
param l := 100; #lato del quadrato[km]
set E within V cross V;
param pti_raccolta{V, V}; #coordinate[x,y]  dei punti di raccolta
param segherie{V, V}; #coordinate[x,y]   delle segherie
param q{V};
param costiManutenzione{S}; #[l/gg]
param capacita{S}; #[quintali/gg]
param costiTrasporto := 10000; #prezzo al km [l/km]

#Ob: In che localita aprire le segherie. MINIMUM VERTEX COVER??
#Defo definire un grafo che copre tutti i 15 vertici con il minor costo possibile
var x{E, E} binary;
data;
param segherie :=
0.25 0.20          
 0.55 0.25         
 0.90 0.15         
 0.15 0.45         
 0.85 0.55    
;
param costiManutenzione :=
1 3000               
2  4500              
3  3000              
4  4400              
5  4600              
 ;
 
 param capacita :=
1 190 
2 240
3 200
4 220
5 190
;
 
 param q :=
 1    58
 2    35
 3    27
 4    42
 5    60
 6    31
 7    18
 8    24
 9    36
 10   37
 11   48
 12   39
 13   53
 14   61
 15   29
 ;
 