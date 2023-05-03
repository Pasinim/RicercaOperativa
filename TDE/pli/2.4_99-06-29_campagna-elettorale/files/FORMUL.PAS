program Formul (input, output);

const MAX = 50;
      MAX_P = 100;

var path: array [1..MAX,1..MAX] of integer;
    N, i, j, k, t, P: integer;
    peso: array [1..MAX_P] of integer;
    tappe: array [1..MAX_P,1..6] of integer;
    trovato: boolean;

begin
Assign (input,'cammini.txt');
Reset (input);
Readln (N);
for i:=1 to N do
  begin
  for j:=1 to N do
    Read (path[i,j]);
  Readln;
  end;
Close (input);

Assign (input,'pulmini.txt');
Reset (input);
Readln (P);
for k:=1 to P do
  begin
  for t:=1 to 6 do
    Read (tappe[k,t]);
  Readln;
  end;
Close (input);

for k:=1 to P do
  begin
  peso[k] := 0;
  for t:=2 to 6 do
    peso[k] := peso[k] + path[tappe[k,t-1],tappe[k,t]];
  end;

Assign (output,'elezioni.ltx');
Rewrite (output);
Write ('min ');
for k:=1 to P do
  Write (' + ',peso[k],' x',k);
Writeln;
Writeln ('s.t.');
for i:=1 to N do
  begin
  for k:=1 to P do
    begin
    trovato := false; t:=1;
    while (t<=6) and (not trovato) do
      if (tappe[k,t] = i)
        then trovato:=true
        else t:=t+1;
    if trovato
      then Write (' + x',k);
    end;
  Writeln (' >= 1');
  end;

Writeln ('end');
for k:=1 to P do
  Writeln ('int x',k);

Close (output);
end.
