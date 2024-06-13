set P;
param prob{P, P};



data;
set P := Nord Est Sud Ovest;
param prob : Nord Est Sud Ovest :=
Nord 		0 .4 0 .6
Est .2 0 .8 0
Sud 0 .5 0 .5 
Ovest 0.75 0 .25 0 ;
end;
