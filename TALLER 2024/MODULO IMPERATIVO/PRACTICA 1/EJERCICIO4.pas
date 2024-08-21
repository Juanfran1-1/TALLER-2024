{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}
program eje4;
const 
df=30;
type    
    rangorubro=1..8;
    producto=record
        codp:integer;
        codr:rangorubro;
        precio:real;
    end;
    lista=^nodo;
    nodo=record 
        dato:producto;
        sig:lista;
    end;
    vectorrubro=array [rangorubro] of lista;
    rubro3=array [1..df] of producto;

procedure inicializarvectorlistas(var v:vectorrubro);
var 
i:rangorubro;
begin 
    for i := 1 to 8 do begin 
        v[i]:=nil;
    end;
end;
procedure leerproducto(var p:producto);
begin 
write('INGRESE CODIGO DEL PRODUCTO: ');readln(p.codp);
write('INGRESE CODIGO DEL RUBRO: ');readln(p.codr);
write('INGRESE PRECIO DEL PRODUCTO: ');readln(p.precio);
end;
procedure cargarenlista(var l:lista;p:producto);
var 
nue,ant,act:lista;
begin 
    new(nue);
    nue^.dato:=p;
    act:=l;ant:=l;
    while (act<>nil) and (act^.dato.codp < nue^.dato.codp) do begin 
        ant:=act;
        act:=act^.sig;
    end;
    if (act=ant) then begin 
        l:=nue;
    end
    else begin 
        ant^.sig:=nue;
    end;
    nue^.sig:=act;
end;
procedure cargarenvector(var r:rubro3;p:producto;var dl:integer);
begin 
    if (dl<=df) then begin 
        dl:=dl+1;
        r[dl]:=p;
    end;    
end;    
procedure cargardatos(var v:vectorrubro;var r3:rubro3;var dl:integer);
var 
p:producto;
begin 
leerproducto(p);
while (p.precio <> 0 ) do begin 
    cargarenlista(v[p.codr],p);
    write('AGREGADO');
    if (p.codr = 3) then 
        cargarenvector(r3,p,dl);
    leerproducto(p);
end;
end;
procedure leerlistas(v:vectorrubro);
var 
i:integer;
l:lista;
begin 
    for i := 1 to 8 do begin
        l:=v[i]; 
        if (l<>nil) then 
            writeln('INICIO LISTA:',i);
        while (l<>nil) do begin 
            writeln('CODIGO: ',l^.dato.codp);
            l:=l^.sig;
        end;
    end;
end;
procedure INSERCION(var r:rubro3;dl:integer);
var 
i,j:integer;
act:producto;
begin 
for i:= 2 to dl do begin 
    act:=r[i];
    j:=i-1;
    while (j > 0) and (r[j].precio < act.precio) do begin 
        r[j+1]:=r[j];
        j:=j-1;
    end;
    r[j+1]:=act;
end;
end;
procedure leervector(v:rubro3;dl:integer);
var 
prom:real;
i:integer;
begin 
prom:=0;
for i := 1 to dl do begin 
    writeln('PRECIO DEL PRODUCTO NUMERO: ',i,' DEL RUBRO 3: ',v[i].precio:2:2);
    prom:=v[i].precio + prom;
end;
writeln('PROMEDIO DE PRECIOS DEL RUBRO 3: ',(prom:2:2 div dl):2:2);
end;    
var 
v:vectorrubro;
r3:rubro3;
dl:integer;
begin 
dl:=0;
inicializarvectorlistas(v);
cargardatos(v,r3,dl);
leerlistas(v);
INSERCION(r3,dl);
leervector(r3,dl);
end.

