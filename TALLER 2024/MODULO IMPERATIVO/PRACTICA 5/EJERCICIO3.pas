{Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. El ingreso finaliza con el código de producto igual a 0.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.}
program eje3;
type 
rangorubro=1..10;

producto= record 
  cod:integer;
  stock:integer;
  rubro:rangorubro;
  precuni:real;
end;

prod2=record 
  stock:integer;
  cod:integer;
  precuni:real;
end;


arbol=^nodo;
  nodo=record 
    dato:prod2;
    HI:arbol;
    HD:arbol;
  end;

vector= array [rangorubro] of arbol;  

prodmax=record 
  stock:integer;
  cod:integer;
end;  

vectormax= array [rangorubro] of prodmax;

vectorcant= array [rangorubro] of integer;

procedure inicializararboles(var v:vector);
var 
i:rangorubro;
begin 
  for i := 1 to 10 do v[i]:=nil;
end;


procedure leerproducto(var p:producto);
begin 
  write('INGRESE CODIGO DEL PRODUCTO: ');readln(p.cod);
  if (p.cod <> 0 ) then begin
    write('INGRESE STOCK DEL PRODUCTO: ');readln(p.stock);
    write('INGRESE RUBRO DEL PRODUCTO: ');readln(p.rubro);
    write('INGRESE PRECIO UNITARIO DEL PRODUCTO: ');readln(p.precuni);
  end;
end;

procedure imprimirproducto(p:producto);
begin 
  writeln('CODIGO: ',p.cod,' | STOCK: ',p.stock,' | RUBRO: ',p.rubro,' | PRECIO ',p.precuni:2:2);
end;  

procedure leerproductoauto(var p:producto);
begin 
  p.cod:=random(100);
  if (p.cod <> 0 ) then begin
    p.stock:=random(45);
    p.rubro:=random(10)+1;
    p.precuni:=random(300)*1.5;
  end;
end;

procedure agregaralarbol(var a:arbol;p:prod2);
begin 
  if (a=nil) then begin
    new(a);
    a^.dato:=p;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else begin 
    if (p.cod < a^.dato.cod) then 
      agregaralarbol(a^.HI,p)
    else  
      agregaralarbol(a^.HD,p);
  end;
end;      



procedure cargarvector(var v:vector);
var 
p:producto;
p2:prod2;
begin 
leerproducto(p);
while (p.cod <> 0) do begin 
  imprimirproducto(p);
  p2.cod:=p.cod;
  p2.stock:=p.stock;
  p2.precuni:=p.precuni;
  agregaralarbol(v[p.rubro],p2);
  leerproductoauto(p);
end;
leerproducto(p);
p2.cod:=p.cod;
p2.stock:=p.stock;
p2.precuni:=p.precuni;
agregaralarbol(v[p.rubro],p2);
end;

procedure buscarproducto(a:arbol;codigo:integer;var ok:boolean);
begin 
  if (a<>nil) and (ok <> true) then begin
    if (a^.dato.cod = codigo) then 
        ok:=true
    else if (a^.dato.cod > codigo) then 
      buscarproducto(a^.HI,codigo,ok)
    else 
      buscarproducto(a^.HD,codigo,ok);
  end;
end;

procedure maximodelarbol(a:arbol;var p:prodmax);
begin
    if (a<>nil) then begin 
      if (a^.HD=nil) then begin
        p.cod:=a^.dato.cod;
        p.stock:=a^.dato.stock;
      end
      else begin 
        maximodelarbol(a^.HD,p);
      end;
    end;
end;      
        
      




procedure vectormaximos(var vm:vectormax;v:vector);
var 
i:rangorubro;
p:prodmax;
begin 
  for i:= 1 to 10 do begin 
    maximodelarbol(v[i],p);
    vm[i]:=p;
  end;
end;      

procedure informarvectormaximos(var vm:vectormax);
var 
i:rangorubro;
begin 
  for i:= 1 to 10 do writeln('EL MAXIMO DEL ARBOL DE RUBRO ',i,' ES EL CODIGO ',vm[i].cod,' CON UN STOCK DE ',vm[i].stock);
end;      



function buscar(v:vector;rubro:rangorubro;codigo:integer):boolean;
var
ok:boolean;
begin 
ok:=false;
buscarproducto(v[rubro],codigo,ok);
buscar:=ok;
end;


procedure buscarcantidad(a:arbol;min,max:integer;var cant:integer);
begin 
  if (a<>nil) then begin
    if (min <= a^.dato.cod) and (max >= a^.dato.cod) then begin
        cant:= cant + 1;
        buscarcantidad(a^.HI,min,max,cant);
        buscarcantidad(a^.HD,min,max,cant);
    end    
    else begin
      if (a^.dato.cod > min ) then 
        buscarcantidad(a^.HI,min,max,cant)
      else 
        buscarcantidad(a^.HD,min,max,cant);
    end;
end;
end;

procedure vectorcantidad(var vc:vectorcant;v:vector;var cod1,cod2:integer);
var 
i:rangorubro;
cant:integer;
begin 
if (cod1=cod2) then 
  write('INGRESE OTRO CODIGO 2 DIFERENTE PARA GENERAR INTERVALO: ');readln(cod2);
for i := 1 to 10 do begin 
  cant:=0;
  if (cod1 > cod2) then begin
    buscarcantidad(v[i],cod2,cod1,cant);
    writeln('LA CANTIDAD DE PRODUCTOS DEL RUBRO ',i,' ENTRE EL INTERVALO ES DE ',cant);
    end
  else begin
    buscarcantidad(v[i],cod1,cod2,cant);
    writeln('LA CANTIDAD DE PRODUCTOS DEL RUBRO ',i,' ENTRE EL INTERVALO ES DE ',cant);
  end;  
end;
end;    
var 
v:vector;
rubro:rangorubro;
codigo:integer;
vm:vectormax;
vc:vectorcant;
cod1,cod2:integer;
begin 
randomize;
inicializararboles(v);
cargarvector(v);
writeln('TERMINO');
writeln('');
writeln('');
write('INGRESE CODIGO A BUSCAR ');readln(codigo);
write('INGRESE RUBRO(1 a 10) A BUSCAR: ');readln(rubro);
if (buscar(v,rubro,codigo)=true) then  
  writeln('EL CODIGO ',codigo,' PERTENECIENTE AL RUBRO ',rubro,' HA SIDO ENCONTRADO.')
else 
  writeln('EL PRODUCTO NO EXISTE.');
writeln('');
writeln('');  
vectormaximos(vm,v);
informarvectormaximos(vm);
writeln('');
writeln('');
write('INGRESE CODIGO 1 PARA GENERAR INTERVALO: ');readln(cod1);
write('INGRESE CODIGO 2 PARA GENERAR INTERVALO: ');readln(cod2);
vectorcantidad(vc,v,cod1,cod2);
end.

