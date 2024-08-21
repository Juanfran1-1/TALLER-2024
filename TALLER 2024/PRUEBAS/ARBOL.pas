program PruebaArbol;
type
    arbol = ^nodo;
    nodo = record
        dato:integer;
        HI:arbol;
        HD:arbol;
        end;
procedure agregar(var a:arbol;num:integer);

    begin 
        if ( a = nil ) then begin 
            new(a);
            a^.dato:=num ; 
            a^.HI:=nil ; 
            a^.HD:=nil;
        end
        else 
            if ( num <= a^.dato) then begin
                agregar(a^.HI,num);
            end    
            else 
                agregar(a^.HD,num);
    end;
procedure recorridoenorden(a:arbol);
begin 
    if (a <> nil) then begin
        recorridoenorden(a^.HI);
        Writeln(a^.dato);
        recorridoenorden(a^.hD);
    end;
end;    

{procedure preorden(a:arbol);
begin 
    if (a <> nil) then begin
        Writeln(a^.dato);
        preorden(a^.HI);
        preorden(a^.hD);
    end;
end;}   
{procedure postorden(a:arbol);
begin 
    if (a <> nil) then begin
        postorden(a^.HI);
        postorden(a^.hD);
        Writeln(a^.dato);
    end;
end;}
var 
    a:arbol;
    num:integer;
begin 
a:=nil;
Write('Ingrese numero: ');
readln(num);
    while (num <> 50 ) do begin 
        agregar(a,num);
        Writeln('------ AGREGADO ------');
        Write('Ingrese numero: ');
        readln(num); 
    end;
    Writeln('----------CORTE DEL AGREGADO-------------');
    recorridoenorden(a);
    // preorden(a);
    // postorden(a);
end.                