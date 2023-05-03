program P (input,output);

const N = 9;

var tn: integer;
    t: array [1..N,1..N] of integer;
    i, j, k: integer;

begin
assign (input,'t.txt');
reset (input);
for i:=1 to N do
  for j:=1 to N do
    Read (t[i,j]);
close (input);

assign (output,'rlp.ltx');
rewrite (output);
writeln ('min c');
writeln ('s.t.');
for k:=1 to N do
  begin
  tn := 0;
  for i:=1 to k do
    for j:=k+1 to N do
      write (' + ',t[i,j],' x',i,j);
  for i:=1 to k do
    for j:=i+1 to k do
      begin
      write (' - ',t[i,j],' x',i,j);
      tn := tn + t[i,j];
      end;
  for i:=1 to k do
    for j:=1 to i-1 do
      write (' + ',t[i,j],' x',i,j);
  for i:=k+1 to N do
    for j:=1 to k do
      begin
      write (' - ',t[i,j],' x',i,j);
      tn := tn + t[i,j];
      end;
  for i:=k+1 to N do
    for j:=k+1 to i-1 do
      write (' + ',t[i,j],' x',i,j);
  for i:=k+1 to N do
    for j:=i+1 to N do
      begin
      write (' - ',t[i,j],' x',i,j);
      tn := tn + t[i,j];
      end;
  writeln (' - c <= ',-tn);
  end;
writeln ('end');
writeln;
writeln ('gin c');
for i:=1 to 9 do
  for j:=1 to 9 do
    if (i<>j)
      then writeln ('int x',i,j);

close (output);
end.
