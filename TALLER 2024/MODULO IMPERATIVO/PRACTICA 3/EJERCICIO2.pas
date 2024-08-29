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
{INCISO 1}
    venta=record
        codigo,fecha,cantidad:integer;
    end;    
    arbol=^nodo;
    nodo=record 
        dato:venta;
        HI:arbol;
        HD:arbol;
    end;

{INCISO 2}
    productovendido=record 
        codigo:integer;
        cantidad:integer;
    end;

    arbolprod=^nodop;
    nodop=record
        dato:productovendido;
        HijoI:arbolprod;
        HijoD:arbolprod;
    end;

{INCISO 3}
    listav = record
        fecha: integer;
        cantidad: integer;
    end;
    lista = ^nodol;
    nodol = record
        dato: listav;
        sig: lista;
    end;
    VentasLista = record
        codigo: integer;
        l: lista;
    end;
    arbolv = ^nodov;
    nodov = record
        dato: VentasLista;
        HI: arbolv;
        HD: arbolv;
    end;


procedure leerventa(var v:venta);
var 
ale:integer;
begin 
{writeln('INGRESANDO CODIGO DEL PRODUCTO: ');}ale:=random(100);v.codigo:=ale;{writeln('codigo ingresado: ',v.codigo);}
{writeln('INGRESANDO FECHA DE LA VENTA DEL PRODUCTO: ');}ale:=random(31)+1;v.fecha:=ale;{writeln('fecha ingresada: ',v.fecha);}
{writeln('INGRESANDO CANTIDAD DE UNIDADES VENDIDAS: ');}ale:=random(100)+1;v.cantidad:=ale;{writeln('cantidad ingresada: ',v.cantidad);}  
end;
procedure insertararbol1(var a:arbol;v:venta);
begin 
    if (a=nil) then begin
        new(a);
        a^.dato:=v;
        a^.HI:=nil;
        a^.HD:=nil;
    end
    else begin
        if (v.codigo <  a^.dato.codigo) then 
            insertararbol1(a^.HI,v)
        else 
            insertararbol1(a^.HD,v);        
    end;
end;
procedure insertararbol2(var a: arbolprod; codigo: integer; cantidad: integer);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.codigo:= codigo;
        a^.dato.cantidad:= cantidad;
        a^.HijoI:= nil;
        a^.HijoD:= nil;
    end
    else
    begin
        if (codigo = a^.dato.codigo) then
            a^.dato.cantidad:= a^.dato.cantidad + cantidad
        else
        if (codigo < a^.dato.codigo) then
            insertararbol2(a^.HijoI, codigo, cantidad)
        else
            insertararbol2(a^.HijoD, codigo, cantidad);
    end;
end;
procedure agregarVenta(var l: lista; fecha: integer; cantidad: integer);
var
    nue: lista;
begin
    new(nue);
    nue^.dato.fecha:= fecha;
    nue^.dato.cantidad:= cantidad;
    nue^.sig:= l;
    l:= nue;
end;
procedure insertararbol3(var a: arbolv; v: venta);
begin
    if (a = nil) then
    begin
        new(a);
        a^.dato.codigo:= v.codigo;
        a^.dato.l:= nil;
        agregarVenta(a^.dato.l, v.fecha, v.cantidad);
        a^.HI:= nil;
        a^.HD:= nil;
    end
    else
    begin
        if (v.codigo = a^.dato.codigo) then
        begin
            agregarVenta(a^.dato.l, v.fecha, v.cantidad);
        end
        else
        if (v.codigo < a^.dato.codigo) then
            insertararbol3(a^.HI, v)
        else
            insertararbol3(a^.HD, v);
    end;
end;
procedure armarARBOLES(var a:arbol;var ap:arbolprod;var av:arbolv);
var
v:venta;
begin 
leerventa(v);
while (v.codigo <> 0) do begin
    insertararbol1(a,v);
    insertararbol2(ap,v.codigo,v.cantidad);
    insertararbol3(av,v);
    leerventa(v);
end;
end;
procedure leerarbol1(a:arbol);
begin 
    if (a<>nil) then begin 
        leerarbol1(a^.HI);
        writeln('CODIGO= ',a^.dato.codigo,' | FECHA= ',a^.dato.fecha,' | CANTIDAD= ',a^.dato.cantidad);
        leerarbol1(a^.HD);
    end;
end; 
procedure leerarbol2(ap:arbolprod);
begin 
    if (ap<>nil) then begin 
        leerarbol2(ap^.HijoI);
        writeln('CODIGO= ',ap^.dato.codigo,' | CANTIDAD= ',ap^.dato.cantidad);
        leerarbol2(ap^.HijoD);
    end;
end;
procedure leerlista(l: lista);
var 
i:integer;
begin
i:=0;
    while(l<>nil) do
        begin
            i:=i+1;
            write(i,'| Dia= ', l^.dato.fecha , ' Cantidad= ',l^.dato.cantidad, ' - ');
            l:= l^.sig;
        end;
end;
procedure leernodo(v:VentasLista);
begin
    write('CODIGO=', v.codigo, ' | Lista--->  ');
    leerlista(v.l);
    writeln();
end;
procedure leerarbol3(a:arbolv);
begin 
    if (a<>nil) then 
        begin 
            leerarbol3(a^.HI);
            leernodo(a^.dato);
            leerarbol3(a^.HD);
        end;
end;
procedure BUSCARFECHA(a:arbol;x:integer;var cant:integer);
begin 
	if ( a<> nil ) then begin 
		if ( x = a^.dato.fecha) then 
			cant:=cant+1;
		BUSCARFECHA(a^.HI,x,cant);
		BUSCARFECHA(a^.HD,x,cant);
end;
end;
procedure actualizarporlista(l:lista;cod:integer;var cantmax,cmax:integer);
var 
cant:integer;
begin 
    cant:=0;
    while (l<> nil) do begin
        cant:=cant + 1;
        l:=l^.sig;
    end;
    if (cantmax < cant) then begin 
        cantmax:=cant;
        cmax:=cod;
    end;
end;  
procedure maximosarbol2(a:arbolprod;var cantmax,codmax:integer);
begin 
    if (a<>nil) then begin
        if (a^.dato.cantidad > cantmax) then begin 
            cantmax:=a^.dato.cantidad;
            codmax:= a^.dato.codigo;
        end;
        maximosarbol2(a^.HijoI,cantmax,codmax);
        maximosarbol2(a^.HijoD,cantmax,codmax);
    end;
end;          
procedure maximosarbol3(a:arbolv;var cantmax,codmax:integer);
begin 
    if (a<>nil) then begin
        actualizarporlista(a^.dato.l,a^.dato.codigo,cantmax,codmax);
        maximosarbol3(a^.HI,cantmax,codmax);
        maximosarbol3(a^.HD,cantmax,codmax);
end;  
end;      
var 
a:arbol;
at:arbolprod;
av:arbolv;
codmax,cantmax,cantf,fecha:integer;
begin 
cantf:=0;
cantmax:=-1;
codmax:=0;
a:=nil;
at:=nil;
av:=nil;
randomize;
armarARBOLES(a,at,av);
writeln('LEYENDO ARBOL 1 ');
leerarbol1(a);
writeln(' ');
writeln('LEYENDO ARBOL 2 ');
leerarbol2(at);
writeln(' ');
writeln('LEYENDO ARBOL 3 ');
leerarbol3(av);
writeln(' ');
writeln(' ');
writeln('---OBJETIVO DEL ARBOL 1 ---');
writeln('INGRESE FECHA A BUSCAR EN ARBOL 1= ');readln(fecha);
BUSCARFECHA(a,fecha,cantf);
writeln('LA FECHA INGRESADA SE HA ENCONTRADO -> ',cantf,' veces');
writeln(' ');
writeln(' ');
writeln('---OBJETIVO DEL ARBOL 2 ---');
maximosarbol2(at,cantmax,codmax);
writeln('EL PRODUCTO CON MAYOR CANTIDAD DE VENTAS ES EL CODIGO -> ',codmax,' CON UNA CANTIDAD DE ',cantmax,' veces');
writeln(' ');
writeln(' ');
cantmax:=-1;
codmax:=0;
writeln('---OBJETIVO DEL ARBOL 3 ---');
maximosarbol3(av,cantmax,codmax);
writeln('EL PRODUCTO CON MAYOR CANTIDAD DE VENTAS ES EL CODIGO -> ',codmax,' CON UNA CANTIDAD DE ',cantmax,' veces');
end.





