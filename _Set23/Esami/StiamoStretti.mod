set M;
set P;
param nS := 4; #numero di settimane
set S := 1..nS;
param rifornimenti{M, S};
param v{P};
param perc{P, M};
param vol_mp{M};
param vol_p{P};
param c := 60000; #capacita magazzino [volume]

data;
set M  := A B C D;
set P  := X Y Z W K Q;
end;


