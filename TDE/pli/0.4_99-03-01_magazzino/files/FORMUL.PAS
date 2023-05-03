program Form (input, output);

var g: integer;

begin
assign (output,'magazz.ltx');
rewrite (output);

Write ('min ');
for g:=1 to 28 do
  if (g mod 7 <> 0)
    then Write (' + 400 v',g);
for g:=1 to 28 do
  if (g mod 7 <> 0)
    then if ((g-1) mod 7 <> 0)
           then Write (' + 20 z',g)
           else Write (' + 40 z',g);
Writeln;

Writeln ('s.t.');

Writeln ('z1 - z27 - q27 = -1');
for g:=2 to 28 do
  if (g mod 7 <> 0)
    then if ((g-1) mod 7 = 0)
           then Writeln ('z',g,' - z',g-2,' - q',g-2,' = -1')
           else Writeln ('z',g,' - z',g-1,' - q',g-1,' = -1');
Writeln;

{
for g:=1 to 28 do
  if (g mod 7 <> 0)
    then Writeln ('q',g,' - 5 v',g,' >= 0');
}
for g:=1 to 28 do
  if (g mod 7 <> 0)
    then Writeln ('q',g,' - 10 v',g,' <= 0');
Writeln;

Writeln ('end');

for g:=1 to 28 do
  if (g mod 7 <> 0)
    then Writeln ('int v',g);
{
for g:=1 to 28 do
  if (g mod 7 <> 0)
    then Writeln ('gin q',g);
}
Close (output);
end.