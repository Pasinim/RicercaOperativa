
# DATI

set P; # insieme dei dolci di produzione
set S; # insieme dei stabilimenti
set I; # insieme degli ingredienti

param Produzione{S,P}; # produzione attuale [kConfezioni]
param Q{I,P}; # composizione delle materie prime per i prodotti [g]
param D{I}; # disponibilità di materie prime in magazzino
param p{P}; # prezzi di vendità dei prodotti [$/dolce]
param Trasferimento{S}; # costo di trasporto delle materie prime [$/quintale 100Kg]

# VARIABILI


# VINCOLI



# OBIETTIVO



#############################
data;

set P := p1   p2   p3   p4   p4   p5   p5   p6   p7   p8;
set S := A B;
set I := a b c d e f g;


param Produzione : p1   p2   p3   p4   p4   p5   p5   p6   p7   p8:
      A            3    10   3    6    0    3    0    0    0    0
      b            0    0    0    0    10   0    5    2    1    4;


param Q :  p1   p2   p3   p4   p5   p6   p7   p8
Mat.pr.
  a        21   32   45   30   21   40   42   37
  b         5    4    8   10   12   15   13   12
  c        64   65   79   82   66   65   80   91
  d        30   25   28   29   32   34   46   28
  e        45   44   44   38   46   32   49   30
  f         6    8    8    8   11   11   12    4
  g        95   94   90   23   12   57   59   62;



param D :=
  a        1890
  b         780
  c        3720
  d        1400
  e        2200
  f         580
  g        4200;


param p := 
  p1       2.10
  p2       2.10
  p3       2.50
  p4       2.30
  p5       1.80
  p6       2.40
  p7       3.15
  p8       2.60;

param Trasferimento := 
    A           20
    B           15;






end;
