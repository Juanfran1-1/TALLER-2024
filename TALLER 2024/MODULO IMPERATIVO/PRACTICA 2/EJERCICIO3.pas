{Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.}
program eje3;
const 
    df=20;
type 
    indice=-1..df;
    vector= array [1..df] of integer;
procedure cargarvector(var v:vector);
var
ale,i:integer; 
begin 
for i:= 1 to 20 do begin 
    ale:=random(1500-300)+300;
    v[i]:= ale;
end;
end;
procedure INCISOA(v:vector;dl:integer); //PREGUNTAR!!!!
begin 
if (dl > 0) then begin
    INCISOA(v,dl-1);
    writeln(dl,' -> ',v[dl]);
end;
end; 
procedure INCISOB(var v:vector);
var 
i,j,pos,act:integer;
begin 
    for i:= 1 to (df-1) do begin 
        pos:=i;
        for j:= i+1 to df do begin 
            if v[j] < v[pos] then pos:=j;
        end;
        act:= v[pos];
        v[pos]:=v[i];
        v[i]:=act;
    end;             
for i:= 1 to df do begin 
    writeln(i,' -> ',v[i]);
end;
end;
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var 
medio:indice;
begin
    medio:= (ini + fin) div 2;
    while (ini <= fin) and (dato <> v[medio]) do begin 
        if (dato < v[medio]) then 
            fin:=medio-1
        else ini:= medio+1;
        medio:= (ini + fin) div 2;
    end;
    if (ini<=fin) and (dato = v[medio]) then pos:=medio
    else pos:=-1;
end;            
var 
v:vector;
dl:integer;
ini,fin,pos:indice;
x:integer;
begin 
dl:=20;
ini:=1;fin:=df;pos:=0;
randomize;
cargarvector(v);
INCISOA(v,dl);
writeln('------------');
INCISOB(v);{seleccion}
writeln('------------');
writeln('INGRESE NUMERO A BUSCAR EN EL VECTOR: ');readln(x);
writeln('BUSCANDO...');
busquedaDicotomica (v,ini,fin,x,pos);
if pos = -1 then writeln('NO ESTA EN EL VECTOR.')
else writeln('ENCONTRADO EN LA POSICION: ',pos);
end.
