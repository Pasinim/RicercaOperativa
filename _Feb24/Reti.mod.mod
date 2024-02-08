reset; 
param nV;
param nE;
set E within nV cross nV;
param l {E};
param v := 120; #[gbit/s]
set T;
param cap{T};  #[gbit/s]
param costo{T};  #[e/km]

data;
param nV := 7;
param nE := 11;
set T := A B C D;
set E := 
1 2,
1 3,
1 4,
2 5,
2 6,
3 5,
3 6,
4 5,
4 6,
5 7,
6 7;

param l := 
1 10
2 15
3 20
4 15
5 20
6 10
7 15
8 15
9 10
10 20
11 10;

param : cap costo :=
A 8 250
B 16 400
C 32 700
D 64 1000; 

solve;
end;

