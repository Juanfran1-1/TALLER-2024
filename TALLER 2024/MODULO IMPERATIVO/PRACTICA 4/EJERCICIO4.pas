{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}
program eje4;

type 
rangodia= 1..31;
rangomes=1..12;

prestamo=record 
    ISBN:integer;
    socio:integer;
    dia:rangodia;
    mes:rangomes;
    cantdias:integer;
end;

arbol = ^nodo;
nodo = record
		dato : prestamo;
		HI : arbol;
		HD : arbol;
	end;

prestamo2=record 
    socio:integer;
    dia:rangodia;
    mes:rangomes;
    cantdias:integer;
end;

lista=^nodo2;
nodo2=record 
    dato:prestamo2;
    sig:lista;
end;


alisbn=record 
    ISBN:integer;
    l:lista;
end; 

arbol2=^nodo3;
nodo3=record 
    dato:alisbn;
    HI:arbol2;
    HD:arbol2;
end;  

{INCISO FYG}
inc=record
    ISBN:integer;
    cant:integer;
end;
listainc=^nodoinc;
nodoinc=record 
    dato:inc;
    sig:listainc;
end;        


procedure prestamomanual(var p : prestamo);
begin
    write('ingrese ISBN: ');readln(p.ISBN);
    write('ingrese numero socio: ');readln(p.socio);
    write('ingrese dia: ');readln(p.dia);
    write('ingrese mes: ');readln(p.mes);
    write('ingrese cantidad de dias: ');readln(p.cantdias);
end;
procedure prestamoauto(var p:prestamo);
begin 
    p.ISBN:=random(100)-1;
    p.socio:=random(30)+1;
    p.dia:=random(31)+1;
    p.mes:=random(12)+1;
    p.cantdias:=random(20)+1;
end; 

{INCISO i}
procedure agregararbol1(var a:arbol;p:prestamo);
begin 
    if (a= nil ) then begin 
        new(a);
        a^.dato:=p;
        a^.HI:=nil;
        a^.HD:=nil;
    end 
    else 
        if (p.ISBN < a^.dato.ISBN) then 
            agregararbol1(a^.HI,p)
        else 
            agregararbol1(a^.HD,p);
end;


procedure imprimirPrestamo(p:prestamo);
begin 
    writeln('ISBN=',p.ISBN,' Socio=',p.socio,' Dia=',p.dia,' Mes=',p.mes,' Dias=',p.cantdias);
end;

procedure imprimirarbol1(a:arbol);
begin 
    if (a<>nil) then 
        begin
            imprimirarbol1(a^.hi); 
            imprimirprestamo(a^.dato);
            imprimirarbol1(a^.hd);
        end;
end; 


{INCISO ii}
procedure agregarprestamoalista(var l:lista;p:prestamo );
var 
nue:lista;
begin 
new(nue);
nue^.dato.socio:=p.socio;
nue^.dato.dia:=p.dia;
nue^.dato.mes:=p.mes;
nue^.dato.cantdias:=p.cantdias;
nue^.sig:=l;
l:=nue;
end;

procedure agregararbol2(var a:arbol2;p:prestamo);
begin 
    if (a <> nil ) then begin 
        if (p.ISBN = a^.dato.ISBN) then begin
            agregarprestamoalista(a^.dato.l,p);
        end    
        else begin
            if (p.ISBN<=a^.dato.isbn) then 
                agregararbol2(a^.HI,p)
            else 
                agregararbol2(a^.HD,p);
        end;  
    end 
    else begin
        new(a);
        a^.dato.ISBN:=p.ISBN;
        agregarprestamoalista(a^.dato.l,p);
        a^.HI:=nil;
        a^.HD:=nil;   
    end;             
end;

procedure imprimirlista(p: alisbn);
begin
	write('ISBN= ', p.ISBN);
	while(p.l <> nil) do
		begin
			write('| Socio=', p.l^.dato.socio,' Dia=',p.l^.dato.dia,' Mes=',p.l^.dato.mes,' Dias=',p.l^.dato.cantdias);
			p.l:= p.l^.sig;
		end;
end;

procedure imprimirarbol2(a:arbol2);
begin
	if (a<>nil) then
		begin
			imprimirarbol2(a^.Hi);
			imprimirlista(a^.dato);
			writeln();
			imprimirarbol2(a^.HD);
		end
    else      
end;




{CARGAR ARBOLES i y ii}

procedure cargararboles(var a1:arbol;var a2:arbol2);
var 
p:prestamo;
begin 
    {writeln('INGRESE PRIMER PRESTAMO: ');
    prestamomanual(p);}
    prestamoauto(p);
    while (p.ISBN <> -1) do begin 
        agregararbol1(a1,p);
        agregararbol2(a2,p);
        prestamoauto(p);
    end;
    writeln('');
    {writeln('INGRESE ULTIMO PRESTAMO: ');
    prestamomanual(p);
    agregararbol1(a1,p);
    agregararbol2(a2,p);}
end;    

{-----INCISOS-----}

{INCISO B}
function INCISOB(a:arbol):integer;
begin 
    if (a=nil ) then begin 
        INCISOB:=0; 
        writeln('ARBOL VACIO');
    end
    else 
        if (a^.HD=nil) then 
            INCISOB:=a^.dato.ISBN
        else 
            INCISOB:=INCISOB(a^.HD);
end;    

{INCISO C}
function INCISOC(a:arbol2):integer;
begin 
    if (a=nil ) then begin 
        INCISOC:=0; 
        writeln('ARBOL VACIO');
    end
    else 
        if (a^.HI=nil) then 
            INCISOC:=a^.dato.ISBN
        else 
            INCISOC:=INCISOC(a^.HI);
end; 

{INCISO D}
function INCISOD(a:arbol;nsocio:integer):integer;{CANTIDAD DE VECES QUE UN SOCIO X APARECE}
begin 
    if(a=nil) then 
        INCISOD:=0
    else begin
        INCISOD:= INCISOD(a^.HI,nsocio) + INCISOD(a^.HD,nsocio);
        if (a^.dato.socio = nsocio) then 
            INCISOD:= INCISOD + 1 
    end;
end;  

{INCISO E}
procedure INCISOE(a:arbol2;nsocio:integer;var cant:integer);
var 
aux:lista;
begin 
    if (a<>nil) then begin
        aux:=a^.dato.l;
        while (aux<>nil) do begin 
            if (aux^.dato.socio = nsocio) then 
                cant:=cant+1;
            aux:=aux^.sig;
        end;
        INCISOE(a^.HI,nsocio,cant);
        INCISOE(a^.HD,nsocio,cant);
    end   
end;

{INCISO F }
procedure agregaradelante(var l:listainc;i:inc);
var 
nue:listainc;

begin
    new(nue);
    nue^.dato:= i;
    nue^.sig:= l;
    l:= nue;
end;

procedure cantidades(var l: listainc; i: inc);
var
	aux: listainc;
	sigo: boolean;
begin
	sigo:= false;
	aux:= l;
	while(aux<>nil) and (i.ISBN <  aux^.dato.ISBN) do
		aux:= aux^.sig;
    if(aux <> nil) and (aux^.dato.ISBN = i.ISBN ) then
		begin
			aux^.dato.cant:= aux^.dato.cant + 1;
			sigo:= true;
		end;
	if(not sigo) then begin
        i.cant:= 1;
        agregaradelante(l, i);
    end;
end;
procedure INCISOF(a:arbol;var l:listainc);
var 
i:inc;
begin 
    if (a<>nil) then begin 
        i.ISBN:=a^.dato.ISBN;
        cantidades(l,i);
        INCISOF(a^.HI,l);
        INCISOF(a^.HD,l);
    end;
end;
procedure imprimirlista(l: listainc);
begin
	while(l<>nil) do
		begin
			writeln('ISBN=', l^.dato.ISBN, ' Cantidad=', l^.dato.cant);
			l:= l^.sig;
		end;
end;

{INCISO G}
procedure INCISOG(a:arbol2;var l:listainc);
var 
aux:lista;
i:inc;
begin 
    if ( a <> nil) then begin 
        aux:=a^.dato.l;
        i.cant:=0;
        i.ISBN:=a^.dato.ISBN;
        while (aux <> nil) do begin 
            i.cant:=i.cant + 1;
            aux:=aux^.sig;
        end;
        agregaradelante(l,i);
        INCISOG(a^.HI,l);    
        INCISOG(a^.HD,l);
    end;
end;    

{INCISO I}
function INCISOI(a:arbol;min,max:integer):integer;
begin 
    if (a = nil) then begin
        INCISOI:=0;
    end
    else begin
        if (a^.dato.ISBN >= min) and (a^.dato.ISBN <= max) then 
            INCISOI:= 1 + INCISOI(a^.HI,min,max) + INCISOI(a^.HD,min,max)
        else 
            if (a^.dato.ISBN > min) then
                INCISOI:=INCISOI(a^.HI,min,max)
            else 
                INCISOI:=INCISOI(a^.HD,min,max)  
    end;                    
end;                
var 
a1:arbol;
a2:arbol2;
nsocio:integer;
cant,min,max:integer;
l1,l2:listainc;
begin 
a1:=nil;
a2:=nil;
l1:=nil;
l2:=nil;
cant:=0;
randomize;
cargararboles(a1,a2);
writeln('');
writeln('');
writeln('IMPRIMIENDO ARBOL 1: ');
imprimirarbol1(a1);
writeln('');
{writeln('IMPRIMIENDO ARBOL 2: ');
imprimirarbol2(a2);}
writeln('EL ISBN DEL LIBRO MAS GRANDE ES: ',INCISOB(a1));
writeln('EL ISBN DEL LIBRO MAS PEQUENO ES: ',INCISOC(a2));
writeln('');
write('INGRESE NUMERO DE SOCIO A ENCONTRAR EN EL ARBOL 1: ');readln(nsocio);
writeln('EL SOCIO HA HECHO ',INCISOD(a1,nsocio),' PRESTAMOS');
writeln('');
write('INGRESE NUMERO DE SOCIO A ENCONTRAR EN EL ARBOL 2: ');readln(nsocio);
INCISOE(a2,nsocio,cant);
writeln('EL SOCIO HA HECHO ',cant,' PRESTAMOS');
writeln('');
writeln('GENERANDO LISTA 1 (INCISO F): ');
INCISOF(a1,l1);
imprimirlista(l1);{INCISO H}
writeln('');
writeln('GENERANDO LISTA 2(INCISO G)');
INCISOG(a2,l2);
imprimirlista(l2);
writeln('');
write('INGRESE VALOR MIN ');readln(min);
write('INGRESE VALOR MAX ');readln(max);
write('LA CANTIDAD DE PRESTAMOS ENTRE EL RANGO DE VALORES ES DE ',INCISOI(a1,min,max));
end.