program eje;
type
banda=record 
    nombre:string;
    estilo:string;
    cant:integer;
end;
arbol=^nodoa;
nodoa=record
    dato:banda;
    HI:arbol;
    HD:arbol;
end;

procedure leerbanda(var b:banda);
begin
    write('INGRESE NOMBRE DE LA BANDA: ');readln(b.nombre);
    write('INGRESE ESTILO DE LA BANDA: ');readln(b.estilo);
    write('INGRESE CANTIDAD DE MIEMBROS DE LA BANDA: ');readln(b.cant);    
end;

procedure agregar(var a:arbol;b:banda);
begin
if (a=nil) then begin   
    new (a);
    a^.dato:=b;
    a^.HI:=nil;
    a^.HD:=nil;
end
else begin  
    if (a^.dato.nombre > b.nombre ) then    
        agregar(a^.HI,b)
    else    
        agregar(a^.HD,b);
end;
end;                
procedure imprimirbanda(a:arbol);
begin
if(a<>nil) then begin
    imprimirbanda(a^.HI);
    writeln('NOMBRE: ',a^.dato.nombre,' ESTILO: ',a^.dato.estilo,' CANTIDAD: ',a^.dato.cant);
    imprimirbanda(a^.HD);
END;    
end;
procedure cargararbol(var a:arbol);
var 
b:banda;
begin 
leerbanda(b);
while(b.cant<>0) do begin 
    agregar(a,b);
    
    leerbanda(b);
end;
end;

procedure maximo(a:arbol;max:integer;var nmax:string);
begin
    if(a<>nil) then begin
        if (max < a^.dato.cant) then begin
            nmax:=a^.dato.nombre;
            max:=a^.dato.cant;
        end;
        maximo(a^.HI,max,nmax);
        maximo(a^.HD,max,nmax);
    end;
end;        
            

var
a:arbol;
max:integer;
nmax:string;
begin
a:=nil;
cargararbol(a);
max:=-1;
imprimirbanda(a);
writeln('');
maximo(a,max,nmax);
writeln('LA BANDA CON MAS INTEGRANTES ES: ',nmax);
end.

