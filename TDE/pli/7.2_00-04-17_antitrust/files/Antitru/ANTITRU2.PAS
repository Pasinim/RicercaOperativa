program Antitrust (input, output);

  var i, j: integer;
      f: array [1..10] of longint;
      tn, num: longint;

begin
Assign (input,'antitru.txt');
Reset (input);
Assign (output,'antitru2.ltx');
Rewrite (output);

for i:=1 to 5 do Readln;
for i:=1 to 10 do
  begin
  f[i] := 0;
  Read (num);
  for j:=1 to 5 do
    begin
    Read (num);
    f[i] := f[i] + num;
    end;
  Readln;
  end;

Writeln ('min z');
Writeln ('s.t.');
tn := 0;
for i:=1 to 10 do
  begin
  Write (' + ',2*f[i],' x',i);
  tn := tn + f[i];
  end;
Writeln (' - z <= ',tn);
for i:=1 to 10 do
  Write (' + ',2*f[i],' x',i);
Writeln (' + z >= ',tn);
Writeln ('end');
for i:=1 to 10 do
  Writeln ('int x',i);
Close (input);
Close (output);
end.