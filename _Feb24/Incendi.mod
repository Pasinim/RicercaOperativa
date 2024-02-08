param nI;
set I := 1..nI;
param a{I};
param b{I};
param time{I};

var x{I, I} binary; #Indica se lo spegnimento di i precede j
var y{I} >= 0; #Tempo in cui inizia lo spegnimento di i
var startTime{I} >= 0;
var endTime{I} >= 0; 
var timeMax >= 0;
s.t. def_startTime {i in I, j in I: i<>j}:
	endTime[i] >= startTime[i] -  10000 * x[i,j];
s.t. def_timeMax {i in I}:
	timeMax >= endTime[i];
s.t. def_d {i in I}:
	endTime[i] = a[i] + b[i]*(startTime[i]+time[i]);

#OB: Minimizzare il tempo massimo di spegimento
minimize z:	timeMax;

data;
param nI := 5;
param: 
	a	b	time := 
1	5	0.1	0
2	8	.3	0
3	10	.2	2
4	9	.5	0
5	3	.4	4;

end;

