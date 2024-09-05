{El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}
program eje1;
const
df=300;
type 
    oficina=record 
        dni,cod:integer;
        valor:real;
    end;
    vector=array [1..df] of oficina;


procedure leeroficinaauto(var o:oficina);
begin 
    o.cod:=random(301);
    if (o.cod <> -1) then begin 
        o.dni:=random(350)+1;
        o.valor:=random(350)*1.5;
    end;
end;        


procedure leeroficinamanual(var o:oficina);
begin 
    write('INGRESANDO CODIGO DE IDENTIFICACION: ');readln(o.cod);
    if (o.cod <> -1) then begin 
        write('INGRESE DNI: ');readln(o.dni);
        write('INGRESE VALOR: ');readln(o.valor);
    end;
end;      


procedure cargarvector(var v:vector;var dl:integer;o:oficina);
begin 
    dl:=dl+1;
    v[dl]:=o;
end;    


procedure armarvector(var v:vector;var dl:integer);
var 
o:oficina;
begin 
leeroficinamanual(o);  
while (o.cod <> -1) and (dl < df) do begin 
    cargarvector(v,dl,o);
    writeln('OFICINA INGRESADA');
    leeroficinaauto(o);
end;    
if (dl <> df) then begin
    leeroficinamanual(o);
    cargarvector(v,dl,o);
end;
end;
procedure informarvector(v:vector;dl:integer);
var 
i:integer;
begin 
    for i:=1 to dl do begin 
        writeln(i,'.  --> ',v[i].cod,' | ',v[i].valor:2:2);
    end;
end;



procedure seleccion(var v:vector;dl:integer);
var 
i,j,pos:integer;
item:oficina;
begin 
    for i:= 1 to dl-1 do begin 
        pos:= i;
        for j:= i+1 to dl do begin 
            if v[j].cod < v[pos].cod then pos:=j;
        end;
        item:=v[pos];
        v[pos]:=v[i];
        v[i]:=item;
    end;
end;        

procedure busquedadicotomica(v:vector;dl,valor:integer;var pos:integer);
var 
ini,fin,medio:integer;
begin 
    ini:=1;
    fin:=dl;
    medio:= (ini+fin) div 2;
    while (ini <> fin ) and (v[medio].cod <> valor) do begin 
        if (valor < v[medio].cod ) then 
            fin:=medio - 1
        else ini:=medio + 1;
        medio:=(ini+fin) div 2;
    end;
    if (ini <= fin ) and (valor = v[medio].cod) then 
        pos:=medio
    else      
        pos:=0;
end;        


function montototal(v:vector;dl:integer;i:integer):real;

begin 
    if ( i = dl) then begin 
        montototal:=v[i].valor;
    end 
    else 
        montototal:=montototal(v,dl,i+1) + v[i].valor;
end;            

var 
dl,valor,pos:integer;
v:vector;
begin 
pos:=0;
dl:=0;
armarvector(v,dl);
informarvector(v,dl);
writeln('----ORDENANDO----');
seleccion(v,dl);
informarvector(v,dl);
writeln(' ');
writeln(' ');
write('INGRESE CODIGO A BUSCAR EN EL VECTOR. ');readln(valor);
busquedadicotomica(v,dl,valor,pos);
if (pos <> 0) then 
    write('EL CODIGO INGRESADO SE ENCONTRO EN LA POSICION: ',pos,'| DNI DEL CLIENTE: ',v[pos].dni)
else    
    writeln('EL CODIGO NO SE ENCONTRO EN LA OFICINA');
writeln(' ');
writeln(' '); 
pos:=0;
writeln('EL MONTO TOTAL DEL VECTOR ES: ',montototal(v,dl,pos):2:2);
end.