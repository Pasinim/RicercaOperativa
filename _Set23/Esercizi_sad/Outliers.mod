# Esercizio Outliers

# DATI

param n;
set N := 1..n;
param x{N};
param y{N};
param K;

# VARIABILI
var m;
var q;
var w{N} binary;

# VINCOLI

s.t. MaxNOutliers:
	sum{i in N} w[i] <= K;

# OBIETTIVO

#minimi quadratii
minimize z : sum{i in N} (m*x[i]+ q -y[i])^2;