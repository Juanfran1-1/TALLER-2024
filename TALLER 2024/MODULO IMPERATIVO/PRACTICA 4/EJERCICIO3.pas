{Implementar un programa modularizado para una librería. Implementar módulos para:
a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.
}
program eje3;
type
    venta=record 
        codventa,codprod,cantuni:integer;
        preciouni:real;
    end;

    producto=record 
        codprodtot,cantunitot:integer;
        monto:real;
    end;

    arbol=^nodoarbol;
    nodoarbol=record    
        dato:producto;
        HI:arbol;
        HD:arbol;
    end;
    
procedure leerventamanual(var v:venta);
begin 
    writeln('Ingrese codigo de venta: ');readln(v.codventa);
    if (v.codventa <> -1 ) then begin
    writeln('Ingrese codigo del producto: ');readln(v.codprod);
    writeln('Ingrese cantidad de unidades vendidas: ');readln(v.cantuni);
    writeln('Ingrese precio unitario: ');readln(v.preciouni);  
    end; 
end;
procedure leerventaauto(var v:venta;var leidosauto:integer);
begin 
    v.codventa:=random(30)-1;
    if (v.codventa <> -1 ) then begin 
        write(' CODIGO DE VENTA INGRESADO :');
        v.codprod:=random(50)+1;
        v.cantuni:=random(50)+1;
        v.preciouni:=random(100)*1.5; 
        leidosauto:=leidosauto + 1;
        writeln(leidosauto);
    end;
end;
procedure insertararbol(var a:arbol;p:producto);
begin
    if(a = nil) then begin
        new(a);
        a^.dato := p;
        a^.HI := nil;
        a^.HD := nil;
    end
    else
        if(a^.dato.codprodtot = p.codprodtot) then begin
            a^.dato.cantunitot:=a^.dato.cantunitot + p.cantunitot;
            a^.dato.monto := a^.dato.monto + p.monto;
        end
        else
            if(p.codprodtot < a^.dato.codprodtot) then
                insertararbol(a^.HI, p)
            else
                insertararbol(a^.HD, p);
end;
procedure armararbol(var a:arbol);
var 
v:venta;
p:producto;
leidosauto:integer;
begin 
leidosauto:=0;
leerventamanual(v);
while (v.codventa <> -1) do begin 
    p.codprodtot:=v.codprod;
    p.cantunitot:=v.cantuni;
    p.monto:=v.cantuni*v.preciouni;
    insertararbol(a,p); 
    leerventaauto(v,leidosauto);
end;
leerventamanual(v);
p.codprodtot:=v.codprod;
p.cantunitot:=v.cantuni;
p.monto:=v.cantuni*v.preciouni;
insertararbol(a,p);
end;
procedure imprimirarbol(a: arbol);
begin
    if(a <> nil) then begin
        imprimirarbol(a^.HI);
        writeln('Codigo: ', a^.dato.codprodtot, ' Cantidad: ', a^.dato.cantunitot, ' Monto: ', a^.dato.monto:0:2);
        imprimirarbol(a^.HD);
    end;
end;
procedure actualizarmaximos(var codmax,cantmax:integer;a:arbol);
begin 
    if (a^.dato.cantunitot > cantmax) then begin 
        cantmax:=a^.dato.cantunitot;
        codmax:=a^.dato.codprodtot;
    end;
end;        
procedure INCISOC(var codmax,cantmax:integer;a:arbol);
begin 
    if (a<>nil) then begin 
        actualizarmaximos(codmax,cantmax,a);
        INCISOC(codmax,cantmax,a^.HI);
        INCISOC(codmax,cantmax,a^.HD);
    end;
end;
function menores(valor:integer;a:arbol):integer;
begin 
    if (a<>nil) then begin 
        if (a^.dato.codprodtot < valor ) then 
            menores:= 1 + menores(valor,a^.HI) + menores(valor,a^.HD)
        else     
            menores:=menores(valor,a^.HI);
    end
    else 
        menores:=0; 
end;
function montototal(min,max:integer;a:arbol):real;
begin   
    if ( a <> nil ) then begin 
        if (a^.dato.monto > min) and (max < a^.dato.monto) then 
            montototal:= a^.dato.monto + montototal(min,max,a^.HI) + montototal(min,max,a^.HD)
        else 
            montototal:= montototal(min,max,a^.HI);
    end
    else 
        montototal:=0;
end;                
            
var 
a:arbol;
codmax,valor,cantmax:integer;
min,max:integer;
begin 
codmax:=0;
cantmax:=-999;
randomize;
a:=nil;
armararbol(a);
imprimirarbol(a);
writeln('');
INCISOC(codmax,cantmax,a);
writeln('EL CODIGO CON MAYOR NUMERO DE UNIDADES VENDIDAS FUE ',codmax,' CON UN TOTAL DE ',cantmax);{INCISO C}
writeln('');
write('INGRESE VALOR A COMPARAR: ');readln(valor);{INCISO D}
writeln('LA CANTIDAD DE CODIGOS MENORES AL VALOR INGRESADO SON: ',menores(valor,a));
writeln('');
write('INGRESE VALOR MIN A COMPARAR: ');readln(min);{INCISO E}
write('INGRESE VALOR MAX A COMPARAR: ');readln(max);
writeln('EL MONTO TOTAL ENTRE LOS VALORES INGRESADOS SON: ',montototal(min,max,a):2:2);
end.