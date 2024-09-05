{Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022. 
De cada compra se conoce código del cliente, día, cantidad de productos y monto pagado. 
a) Implementar un módulo que lea compras, genere y retorne una estructura adecuada para la búsqueda por código del cliente,
donde para cada código de cliente se almacenan juntas todas sus compras (día, cantidad de productos y monto) que realizó. La lectura finaliza con cantidad de productos 0. 
b) Implementar un módulo que reciba la estructura generada en a) y un código de cliente y retorne todas las compras de dicho cliente. 
c) Realizar un módulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con mayor cantidad de productos.}
program parcailjere;
type
    cliente=record 
        cod:integer;
        dia:integer;
        cantidad:integer;
        monto:real;
    end;


    infocod=record 
        dia:integer;
        cantidad:integer;
        monto:real;
    end;


    lista=^nodol;
    nodol=record    
        dato:infocod;
        sig:lista;
    end;


    clientexcod=record 
        cod:integer;
        l:lista;
    end;


    arbol=^nodo;
    nodo=record
        dato:clientexcod;
        HI:arbol;
        HD:arbol;
    end;


procedure leerclientemanual(var c:cliente);
begin   
    write('INGRESE CODIGO DEL CLIENTE: ');readln(c.cod);
    write('INGRESE DIA DE LA COMPRA: ');readln(c.dia);
    write('INGRESE CANTIDAD DE PRODUCTOS: ');readln(c.cantidad);
    write('INGRESE MONTO DE LA COMPRA: ');readln(c.monto);
end;  

procedure leerclienteauto(var c:cliente);
begin
    c.cod:=random(50)+1;
    c.dia:=random(30)+1;
    c.cantidad:=random(6);
    c.monto:=random(10)*1.50;
end;   

procedure agregarlista(var l:lista;c:cliente);
var 
nue:lista;
begin 
new(nue);
nue^.dato.dia:=c.dia;
nue^.dato.cantidad:=c.cantidad;
nue^.dato.monto:=c.monto;
nue^.sig:=l;
l:=nue;
end;
procedure agregararbol(var a:arbol;c:cliente);
begin 
    if (a<>nil) then begin
      if (a^.dato.cod = c.cod ) then 
            agregarlista(a^.dato.l,c)
        else if (a^.dato.cod < c.cod ) then
            agregararbol(a^.HI,c)
        else 
            agregararbol(a^.HD,c);
    end
    else begin 
        new(a);
        a^.dato.cod:= c.cod;
        a^.dato.l:=nil;
        agregarlista(a^.dato.l,c);
        a^.HI:=nil;
        a^.HD:=nil;
    end;
end;            



procedure armararbol(var a:arbol);
var 
c:cliente;
begin 
    leerclientemanual(c);
    while (c.cantidad <> 0 ) do begin 
        agregararbol(a,c);
        writeln('COMPRA: dia: ',a^.dato.l^.dato.dia,' | cantidad: ',a^.dato.l^.dato.cantidad,' | monto: ',a^.dato.l^.dato.monto:2:2,' cod: ', c.cod);
        leerclienteauto(c);
    end;
    leerclientemanual(c);
    agregararbol(a,c);
    writeln('AGREGADO ');
end;


procedure recorrerlista(l:lista);
begin 
    while (l<>nil) do begin 
        writeln('COMPRA: dia: ',l^.dato.dia,' | cantidad: ',l^.dato.cantidad,' | monto: ',l^.dato.monto:2:2);
        l:=l^.sig;
    end;   
end;        


procedure informarcliente(a:arbol;codcliente:integer;var l1:lista);
begin 
    if (a<>nil) then begin
        if (a^.dato.cod = codcliente) then begin
            recorrerlista(a^.dato.l);
            l1:=a^.dato.l;
        end    
        else begin 
            if (a^.dato.cod < codcliente) then 
                informarcliente(a^.HI,codcliente,l1)
            else 
                informarcliente(a^.HD,codcliente,l1);            
        end;
    end;
end;    

function informarlistaweber(l:lista):real;
begin 
    if (l <> nil) then begin 
        informarlistaweber:= l^.dato.monto + informarlistaweber(l^.sig)  ;
    end;
end;


var 
a:arbol;
codcliente:integer;
l1:lista;
begin 
randomize;
l1:=nil;
a:=nil;
armararbol(a);
writeln(' ');
writeln('INGRESE CODIGO A BUSCAR: ');readln(codcliente);
informarcliente(a,codcliente,l1);
writeln('EL MONTO TOTAL DEL CLIENTE LEIDO ES: ',informarlistaweber(l1):2:2);
end.
