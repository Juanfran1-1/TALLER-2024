program eje4; 
procedure convertirabinario(x:integer); 
begin 
if (x <> 0) then begin 
    convertirabinario(x div 2);
    write(x mod 2);
end;
end;
var 
x:integer;
begin
writeln('INGRESE NUMERO A CONVERTIR: ');readln(x);
while (x <> 0) do begin
    write(x,' EN NUMERO BINARIO ES: ');
    convertirabinario(x);
    writeln(' ');
    writeln('------------');
    writeln('INGRESE OTRO NUMERO A CONVERTIR: ');readln(x);    
end;
writeln('SE HA TERMINADO EL PROGRAMA');
end.