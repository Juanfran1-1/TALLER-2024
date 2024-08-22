program eje2;
const
df=300;
type
    oficina=record
        cod:integer;
        dni:integer;
        valor:real;
    end;    
    vector = array [1..df] of oficina;
procedure leeroficina(var o:oficina);
begin 
writeln('INGRESE DE CODIGO DE IDENTIFICACION DEL PROPIETARIO DE LA OFICINA: ');
readln(o.cod);
writeln('INGRESE DE DNI DEL PROPIETARIO DE LA OFICINA: ');
readln(o.dni);
writeln('INGRESE DE VALOR DE LA EXPENSA DE LA OFICINA: ');
readln(o.valor);
end;
procedure leervector(v:vector;dl:integer);
var 
i:integer;
begin 
for i := 1 to dl do begin 
    writeln('CODIGO ',i,' : ',v[i].cod);
end;
end;    
procedure cargarvector(var v:vector;var dl:integer);
var
o:oficina;
begin 
leeroficina(o);
while (o.cod <> -1) and (dl<=df) do begin
	dl:=dl+1;
	v[dl]:=o;
    writeln('-OFICINA CARGADA--');
    leeroficina(o);
end;
end;
procedure INSERCION(var v:vector;var dl:integer);
var
i,j:integer;
act:oficina;
begin
    for i:= 2 to dl do begin 
        act:=v[i];
        j:=i-1;
        while (j>0) and (v[j].cod<act.cod) do begin 
            v[j+1]:=v[j];
            j:=j-1;
        end;
        v[j+1]:=act;
    end;       
end;
procedure SELECCION(var v:vector;dl:integer);
var 
i,j,pos:integer;
act:oficina;
begin 
	for i := 1 to dl-1 do begin
		pos:=i;
		for j:= i+1 to dl do begin 
			if v[j].cod < v[pos].cod then pos:=j;
		end;	
		act:=v[pos];
		v[pos]:=v[i];
		v[i]:=act;
	end;
end;			
var 
v:vector;
dl:integer;
begin 
dl:=0;
cargarvector(v,dl);
leervector(v,dl);
{writeln('----->ORDENANDO POR METODO DE INSERCION<-----');
INSERCION(v,dl);
writeln('-----ORDENADO POR METODO DE INSERCION-----');   
leervector(v,dl);}
writeln('----->ORDENANDO POR METODO DE SELECCION<-----');
SELECCION(v,dl);
writeln('-----ORDENADO POR METODO DE SELECCION-----'); 
leervector(v,dl);
end.
{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
