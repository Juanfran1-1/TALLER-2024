program ejercicio3;
type
    lista=^nodo;
    nodo = record 
        dato:integer;
        sig:lista;
    end;
procedure armarnodo(var l:lista;num:integer);
var 
nue:lista;
begin 
    new(nue); nue^.dato:=num; nue^.sig:=l;
    l:=nue;
end;
procedure armarlista(var l:lista);
var 
ale:integer;
begin 
ale:=random(150-100)+100;
while (ale<>120) do begin 
    armarnodo(l,ale);
    ale:=random(150-100)+100;
end;
end;
procedure imprimirlista(l:lista);
begin 
    while(l<>nil) do begin 
        writeln(l^.dato);
        l:=l^.sig;
    end;
end;
procedure buscarelemento(l:lista;x:integer);
begin 
    while (l<>nil) and (l^.dato <> x) do begin 
        l:=l^.sig;
    end;
    if (l^.dato=x) then 
        writeln('ENCONTRADO')
    else 
        writeln('NUMERO NO EXISTE EN LISTA');
end;
var
l:lista;
x:integer;
begin 
l:=nil;
armarlista(l);
imprimirlista(l);
writeln('INGRESE NUMERO A BUSCAR');
readln(x);
buscarelemento(l,x);
end.                           


