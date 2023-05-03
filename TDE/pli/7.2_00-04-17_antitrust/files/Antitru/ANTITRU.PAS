program Antitrust (input, output);

  var i, j, num: integer;
      f: array [1..10,1..5] of longint;
      tn: longint;

begin
Assign (input,'antitru.txt');
Reset (input);
Assign (output,'antitru.ltx');
Rewrite (output);

for i:=1 to 5 do Readln;
for i:=1 to 10 do
  begin
  Read (num);
  for j:=1 to 5 do
    Read (f[i,j]);
  Readln;
  end;

Writeln ('min z');
Writeln ('s.t.');
for j:=1 to 5 do
  begin
  tn := 0;
  for i:=1 to 10 do
    begin
    Write (' + ',2*f[i,j],' x',i);
    tn := tn + f[i,j];
    end;
  Writeln (' - z <= ',tn);
  for i:=1 to 10 do
    Write (' + ',2*f[i,j],' x',i);
  Writeln (' + z >= ',tn);
  end;
Writeln ('end');
for i:=1 to 10 do
  Writeln ('int x',i);
Close (input);
Close (output);
end.