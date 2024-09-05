{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
program eje2;
type
  
  {ARBOL i}
    rangoano=2010..2018;
    autos=record 
      patente:integer;
      ano:rangoano;
      marca,modelo:string;
    end;

    arbolpat=^nodo1;
    nodo1=record 
      dato:autos;
      HI:arbolpat;
      HD:arbolpat;
    end;


{ARBOL ii}

    autoxmarca=record 
      patente:integer;
      ano:rangoano;
      modelo:string;
      end;

    lista=^nodol;
    nodol=record 
      dato:autoxmarca;
      sig:lista;
      end;

    marcaauto=record 
      marca:string;
      l:lista;
    end;
    
    arbolxmarca=^nodo2;
    nodo2=record 
      dato:marcaauto;
      HI:arbolxmarca;
      HD:arbolxmarca;
    end;  
  
  vector1 = array [2010..2018] of autos;





procedure leerautomanual(var a:autos);
begin 
write('INGRESE MARCA DEL AUTO: ');readln(a.marca);
write('INGRESE MODELO DEL AUTO: ');readln(a.modelo);
write('INGRESE PATENTE DEL AUTO: ');readln(a.patente);
a.ano:=random(2018-2010)+2010+1;
end;

    



procedure agregararbol1(var ar:arbolpat;a:autos);
begin 
  if (ar=nil) then begin 
    new(ar);
    ar^.dato:=a;
    ar^.HI:=nil;
    ar^.HD:=nil;
  end
  else 
    if (a.patente < ar^.dato.patente) then 
      agregararbol1(ar^.HI,a)
    else
      agregararbol1(ar^.HD,a);
end; 

procedure insertar(var l:lista;a:autos);
var 
  nue:lista;
begin   
  new(nue);
  nue^.dato.patente:=a.patente;
  nue^.dato.modelo:=a.modelo;
  nue^.dato.ano:=a.ano;
  nue^.sig:=l;
  l:=nue;
end;  

procedure agregararbol2(ar:arbolxmarca;a:autos);
begin 
  if (ar = nil) then begin 
    new(ar);
    ar^.dato.marca:=a.marca;
    ar^.dato.l:=nil;
    insertar(ar^.dato.l,a);
    ar^.HI:=nil;
    ar^.HD:=nil;
  end
  else 
    if (ar^.dato.marca = a.marca) then 
        insertar(ar^.dato.l,a)
    else if (a.marca  < ar^.dato.marca) then 
      agregararbol2(ar^.HI,a)
    else
      agregararbol2(ar^.HD,a);
end;  

procedure cargararboles(var a1:arbolpat;var a2:arbolxmarca);
var 
a:autos;
begin 
leerautomanual(a);
while (a.marca <> 'ZZZ') do begin 
    agregararbol1(a1,a);
    agregararbol2(a2,a);
    leerautomanual(a);
end;
end;


procedure recorrerarbol(a:arbolpat);
begin 
if (a<>nil) then begin 
  recorrerarbol(a^.HI);
  writeln(a^.dato.marca,' ',a^.dato.modelo,' ',a^.dato.patente,' ',a^.dato.ano);
  recorrerarbol(a^.HD);
end;
end;  

procedure INCISOB(a:arbolpat;marca:string;var cant:integer);
begin 
  if (a<>nil) then begin 
    if (a^.dato.marca = marca) then 
      cant:=cant + 1;
      INCISOB(a^.HI,marca,cant);
      INCISOB(a^.HD,marca,cant);
  end;
end;  


procedure recorrerlista(l:lista;var cant:integer);
begin 
  while (l<>nil) do begin 
    cant:=cant + 1;
    l:=l^.sig;
  end;
end;

procedure INCISOC(a:arbolxmarca;marca:string;var cant:integer);
begin
  if (a<>nil) then begin
    if (a^.dato.marca = marca) then 
      recorrerlista(a^.dato.l,cant)
    else 
      if (a^.dato.marca > marca) then
          INCISOC(a^.HI,marca,cant)
      else    
        INCISOC(a^.HD,marca,cant);
  end;
end;    
var 
a1:arbolpat;
a2:arbolxmarca;
marca:string;
cant:integer;
begin
cant:=0;
randomize;
a1:=nil;
a2:=nil;

cargararboles(a1,a2);
writeln(' ');
writeln(' ');
recorrerarbol(a1);
write('INGRESE MARCA A BUSCAR: ');readln(marca);
INCISOB(a1,marca,cant);
writeln('LA MARCA INGRESADA TIENE: ',cant);
writeln(' ');
writeln(' ');
cant:=0;
write('INGRESE MARCA A BUSCAR: ');readln(marca);
INCISOC(a2,marca,cant);
writeln('LA MARCA INGRESADA TIENE: ',cant);
end.
