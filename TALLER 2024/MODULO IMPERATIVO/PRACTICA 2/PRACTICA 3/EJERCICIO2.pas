{Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.}
program eje2; 
type 
    producto=record
        codigo,fecha,cantidad:integer;
    end;    
    arbol=^nodo;
    nodo=record 
        dato:producto;
        HI:arbol;
        HD:arbol;
    end;
    lista=^nodo2;
    nodo2=record    
        dato:producto;
        sig:lista;
    end;    
procedure leerproducto(var p:producto);
var 
ale:integer;
begin 
{writeln('INGRESANDO CODIGO DEL PRODUCTO: ');}ale:=random(100);p.codigo:=ale;{writeln('codigo ingresado: ',p.codigo);}
{writeln('INGRESANDO FECHA DE LA VENTA DEL PRODUCTO: ');}ale:=random(31)+1;p.fecha:=ale;{writeln('fecha ingresada: ',p.fecha);}
{writeln('INGRESANDO CANTIDAD DE UNIDADES VENDIDAS: ');}ale:=random(100)+1;p.cantidad:=ale;{writeln('cantidad ingresada: ',p.cantidad);}  
end;
procedure agregar1(var a:arbol;p:producto);
begin 
    if (a=nil) then begin
        new(a);
        a^.dato:=p;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else begin
        if (p.codigo <  a^.dato.codigo) then 
            agregar1(a^.HI,p)
        else 
            agregar1(a^.HD,p);        
    end;
end;    
procedure armararbol1(var a:arbol);
var
p:producto; 
begin 
leerproducto(p);
while (p.codigo <> 0) do begin
    agregar1(a,p);
    leerproducto(p);
end;
end;
procedure leerarbol1(a:arbol);
begin 
    if (a<>nil) then begin 
        leerarbol1(a^.HI);
        writeln(a^.dato.codigo);
        leerarbol1(a^.HD);
    end;
end;
procedure agregar2(var a:arbol;p:producto);
begin 
    if (a=nil) then begin
        new(a);
        a^.dato:=p;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else begin
        if (p.codigo <  a^.dato.codigo) then 
            agregar2(a^.HI,p)
        else if (p.codigo >  a^.dato.codigo) then
            agregar2(a^.HD,p) 
        else 
            a^.dato.cantidad:=p.cantidad + a^.dato.cantidad;           
    end;
end;
procedure armararbol2(var a:arbol);
var
p:producto; 
begin 
leerproducto(p);
while (p.codigo <> 0) do begin
    agregar2(a,p);
    leerproducto(p);
end;
end;
procedure leerarbol2(a:arbol);
begin 
    if (a<>nil) then begin 
        leerarbol2(a^.HI);
        write(a^.dato.codigo);write('    ');writeln(a^.dato.cantidad);
        leerarbol2(a^.HD);
    end;
end;
procedure armarnodo(var l:lista;venta:integer;)
procedure agregar3(var a:arbol;p:producto;var l:lista);
begin 
    if (a=nil) then begin
        new(a);
        a^.dato:=p;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else begin
        if (p.codigo <  a^.dato.codigo) then 
            agregar3(a^.HI,p)
        else if (p.codigo >  a^.dato.codigo) then
            agregar3(a^.HD,p) 
        else 
            a^.dato.cantidad:=p.cantidad + a^.dato.cantidad;           
    end;
end;
procedure armararbol3(var a:arbol);
var
p:producto; 
l:lista;
begin 
leerproducto(p);
while (p.codigo <> 0) do begin
    agregar3(a,p,l);
    leerproducto(p);
end;
end;
procedure leerarbol3(a:arbol);
begin 
    if (a<>nil) then begin 
        leerarbol3(a^.HI);
        write(a^.dato.codigo);write('    ');writeln(a^.dato.cantidad);
        leerarbol3(a^.HD);
    end;
end;   
var 
a,a2:arbol;
begin 
randomize;
armararbol1(a);
leerarbol1(a);
writeln('ARBOL 1 TERMINADO');
armararbol2(a2);
leerarbol2(a2);
writeln('ARBOL 2 TERMINADO');
armararbol3(a3);
leerarbol3(a3);
end.


