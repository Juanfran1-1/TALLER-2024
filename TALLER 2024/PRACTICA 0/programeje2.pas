program eje2;
const 
df=50;
type 
vector= array [1..df] of integer;
procedure cargarvector(var v:vector;min,max:integer;var dl:integer);
var
ale:integer;
begin
    ale:= random(max-min)+min;
    while (dl<df) and (ale<>0) do begin 
        dl:=dl + 1;
        v[dl]:=ale;
        writeln('NUMERO ALEATORIO AÑADIDO');
        ale:= random(max-min)+min;
    end;        
end;
procedure informarvector(v:vector;dl:integer);
var
i:integer;
begin 
for i := 1 to dl do begin {INVERSO : FOR I := DL DOWNTO 1 DO BEGIN}
    writeln('Numero ',i,' :',v[i]);
end;
writeln('FIN DEL PROCESO');
end;
var
v:vector;
dl,min,max:integer;
begin
dl:=0;
writeln('Ingrese un numero(MIN):  ');readln(min);
writeln('Ingrese un numero (MAX):  ');readln(max);
cargarvector(v,min,max,dl);
writeln('-----INFORMANDO-----');
informarvector(v,dl);
end.