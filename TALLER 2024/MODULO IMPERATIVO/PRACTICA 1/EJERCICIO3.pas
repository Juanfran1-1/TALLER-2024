{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}
program eje3;
type  
    rangogenero=1..8;
    pelicula=record 
        codg:rangogenero;
        codp:integer;
        pp:real;
    end;
    
    lista=^nodo;
    nodo = record 
        dato:pelicula;
        sig:lista;
    end;
    vector=array [rangogenero] of lista;
    vectormax= array [rangogenero] of integer;
procedure leerpelicula(var p:pelicula);
begin
writeln('INGRESE GENERO DE LA PELICULA');readln(p.codg);
writeln('INGRESE CODIGO DE LA PELICULA');readln(p.codp);
writeln('INGRESE PROMEDIO DE CRITICAS DE LA PELICULA');readln(p.pp);
end;
procedure inicilaizarv(var v,vult:vector);
var 
i:integer;
begin 
for i:= 1 to 8 do begin 
    v[i]:=nil;
    vult[i]:=nil;
    end;
end;    
procedure armarnodo(var l:lista;p:pelicula;var ult:lista);
var 
nue:lista;
begin 
new(nue);
nue^.dato:=p;
nue^.sig:=nil;
if (l=nil) then begin
    l:=nue;
    end
else begin
    ult:=l;
    while (ult^.sig<>nil) do begin 
        ult:=ult^.sig;
    end;
    ult^.sig:=nue;
end;
end;    
procedure CARGARPELICULAS(var v,vult:vector);
var 
p:pelicula;
begin 
    inicilaizarv(v,vult);
    leerpelicula(p);
    while (p.codp <> -1) do begin 
        armarnodo(v[p.codg],p,vult[p.codg]);
        writeln('AGREGADA');
        leerpelicula(p);
    end;
end;
function maximocod(l:lista):integer;
var 
max:real;
codm:integer;
begin 
max:= -999 ;
codm:= 0;
    while (l <> nil) do begin 
        if (max < l^.dato.pp) then begin 
            max := l^.dato.pp;
            codm := l^.dato.codp;
        end;
        l:=l^.sig
    end;   
maximocod:=codm;    
end;    
procedure obtenercodmax (v:vector;vm:vectormax);
var 
i:integer;
begin 
for i := 1 to 8 do begin
	if (v[i] <> nil ) then begin
		vm[i]:=maximocod(v[i]);
		writeln(vm[i]);
	end;	
end;    
end;
procedure INSERCION(var v:vectormax);
var
i,j:integer;
act:integer;
begin
    for i:= 2 to 8 do begin 
        act:=v[i];
        j:=i-1;
        while (j>0) and (v[j]<act) do begin 
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=act;

    end;
for i:= 1 to 8 do begin 
writeln('MINIMO ',v[1]);  
writeln('MAXIMO ',v[8]);        
end;
var 
i:integer;
v,vult:vector;
vm:vectormax;
begin 
CARGARPELICULAS(v,vult);
for i:= 1 to 8 do begin
	vm[i]:= 0;
end;	
obtenercodmax(v,vm);
INSERCION(vm);
end.
