param nO;
set O := 1..nO;
param val{O};
param vol{O};
param pen{O};
param volMax; #Volume massimo in zaino

var x{O} binary; #Var assegnamento, indica se l'oggetto è inserito nello zaino
var penMax >= 0; #Massima penalità 
s.t. volumeMassimo: sum {o in O} vol[o] * x[o] <= volMax;
s.t. maxPenalty{o in O}: penMax >= pen[o] * x[o];
maximize z:
	sum {o in O} val[o] * x[o] - penMax;

data;
param nO := 30;
param volMax := 1000;
param: vol val pen :=
    1        10        27       34    
    2        58        41       59    
    3        97        23       87    
    4        23        32       34    
    5        19        39       40    
    6         5         8       29    
    7        71        50       84    
    8        94         2       67    
    9        81        30       53    
   10        92        54       48    
   11        74        85       53    
   12         3         2       85    
   13        41        23       37    
   14        57        18       49    
   15        12        73       85    
   16        47        41       37    
   17        10        78       90    
   18        25        32       57    
   19        61        18       62    
   20        23        23       34    
   21        74        34       75    
   22        28        58       88    
   23        62        12       43    
   24        35        31       75    
   25        63        63       93    
   26        49        14       75    
   27        13        13       39    
   28        95        87       58    
   29        87        56       37    
   30        23        32        6
   ;


end;

