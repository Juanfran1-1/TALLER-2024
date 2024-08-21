program ejercicio4;
type
    lista=^nodo;
    nodo = record 
        dato:integer;
        sig:lista;
    end;
procedure armarordenado(var l:lista;num:integer);
var 
nue,act,ant:lista;
begin 
    new(nue); nue^.dato:=num;
    act:=l;
    ant:=l;
    while (act<>nil) and (act^.dato<num) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then begin  
        l:=nue;
    end
    else 
        ant^.sig:=nue;
nue^.sig:=act;            
end;
procedure armarlista(var l:lista);
var 
ale:integer;
begin 
ale:=random(150-100)+100;
while (ale<>120) do begin 
    armarordenado(l,ale);
    ale:=random(150-100+1)+100;
end;
end;
procedure imprimirlista(l:lista);
begin 
    while(l<>nil) do begin 
        writeln(l^.dato);
        l:=l^.sig;
    end;
end;
function buscarelemento(l:lista;x:integer):boolean;
begin 
    while (l<>nil) and (l^.dato < x) do begin 
        l:=l^.sig;
    end;
    buscarelemento:=(l^.dato = x);
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
writeln(buscarelemento(l,x));
end.                           


