{ Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}
program eje2;
type 
    lista=^nodo;
    nodo=record 
        dato:integer;
        sig:lista;
    end;
procedure armarnodo(var l:lista;x:integer);
var 
nue:lista;
begin 
new(nue);
nue^.dato:=x;
nue^.sig:=l;
l:=nue;
end;
procedure armarlista(var l:lista);
var
ale:integer;
begin 
ale:=random (200-100+1)+100;
if (ale<>100) then begin
    armarnodo(l,ale);
    ale:=random (200-100+1)+100;
    armarlista(l^.sig);
end;   
end;
procedure INCISOB(l:lista);
begin 
if (l <> nil) then begin
    writeln(l^.dato);
    INCISOB(l^.sig);
end;
end; 
procedure INCISOC(l:lista);
begin 
if (l <> nil) then begin
    INCISOC(l^.sig);
    writeln(l^.dato);
end;
end;
procedure INCISOD(l:lista;var min:integer);
begin 
    if (l<>nil) then begin
        if (min>l^.dato) then 
            min:=l^.dato;
        INCISOD(l^.sig,min);
    end;
end;
function INCISOE(l:lista;x:integer):boolean;
begin 
    if (l<>nil) and (l^.dato <> x) then begin 
        INCISOE:=INCISOE(l^.sig,x);
    end    
    else begin 
        INCISOE:= (l^.dato = x);
    end;    
end;          

var
l:lista;
min:integer;
x:integer;
begin 
l:=nil;
min:=999;
randomize;
writeln('CARGANDO LA LISTA');
writeln('---------------------------------');
armarlista(l);
writeln('TERMINADA LA LISTA');
writeln('---------------------------------');
writeln('LEYENDO NUMEROS EN ORDEN DE LLEGADA(INCISO B)');
INCISOB(l);
writeln('TERMINADO EL INCISO B');
writeln('---------------------------------');
writeln('LEYENDO NUMEROS EN ORDEN INVERSO (INCISO C)');
INCISOC(l);
writeln('TERMINADO EL INCISO C');
writeln('--------------------------------');
writeln('BUSCANDO MINIMO (INCISO D)');
INCISOD(l,min);
writeln('EL NUMERO MINIMO ES -----> ',min);
writeln('TERMINADO EL INCISO D');
writeln('--------------------------------');
writeln('INGRESE NUMERO A BUSCAR EN LISTA: ');readln(x);
writeln('BUSCANDO NUMERO (INCISO E)');
writeln('EL NUMERO HA SIDO ENCONTRADO? -----> ',INCISOE(l,x));
writeln('TERMINADO EL INCISO E');
end.



