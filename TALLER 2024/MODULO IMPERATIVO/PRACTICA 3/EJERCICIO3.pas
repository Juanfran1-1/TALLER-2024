{Implementar un programa que contenga:
a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}
program eje3;
type 
    info=record
        dia,mes,ano:integer;
    end;  
    rangonota=1..10;
        materia= record 
        codigo:integer;
        fecha:info;
        nota:rangonota;
    end;
    lista=^nodo;
    nodo=record
        dato:materia;
        sig:lista;
    end;
    alumno=record
        finales:lista;
        legajo:integer;
    end;
    arbol=^nodo2;
    nodo2=record
        dato:alumno;
        HI:arbol;
        HD:arbol;
    end;    
procedure leermateria(var m:materia);
var 
    ale:integer;
begin 
    ale:=random(31);m.codigo:=ale;
    ale:=random(10)+1;m.nota:=ale;
    ale:=random(12)+1;m.fecha.mes:=ale;
    if ((m.fecha.mes = 4) or (m.fecha.mes = 6) or (m.fecha.mes = 9) or (m.fecha.mes = 11) )then begin 
        ale:=random(30)+1;m.fecha.dia:=ale;
        ale:=random(2024-1990)+1990+1;m.fecha.ano:=ale;
    end
    else if (m.fecha.mes = 2) then begin 
        ale:=random(28)+1;m.fecha.dia:=ale;
        ale:=random(2024-1990)+1990+1;m.fecha.ano:=ale;
    end
    else 
        ale:=random(31)+1;m.fecha.dia:=ale;
        ale:=random(2024-1990)+1990+1;m.fecha.ano:=ale;
end;
procedure armarlista(var l:lista;m:materia);
var 
nue:lista;
begin 
new(nue);
nue^.dato:=m;
nue^.sig:=l;
l:=nue;
end;
procedure leeralumno(var a:alumno);
var 
m:materia;
ale:integer;
begin 
    a.finales:=nil;
    ale:=random(100);
    write('INGRESANDO LEJAGO DE ALUMNO: ');a.legajo:=ale;
    write(a.legajo);
    writeln(' ');
    leermateria(m);
    while((m.codigo <> 0))  do begin 
        armarlista(a.finales,m);
        leermateria(m);
    end;
end;
procedure agregaralarbol(var ar:arbol;a:alumno);
begin 
    if (ar=nil) then begin 
        new(ar);
        ar^.dato:=a;
        ar^.HI:=nil;
        ar^.HD:=nil;
    end
    else begin 
        if (a.legajo < ar^.dato.legajo) then 
            agregaralarbol(ar^.HI,a)
        else if (a.legajo > ar^.dato.legajo) then 
            agregaralarbol(ar^.HD,a);
    end;
end;              
procedure armararbol(var ar:arbol);
var 
a:alumno;
act:integer;
begin 
    leeralumno(a);
    act:=a.legajo;
    while (a.legajo <> 0) do begin 
        agregaralarbol(ar,a);
        leeralumno(a);
        if (act=a.legajo) then 
            leeralumno(a)
        else 
            act:= a.legajo;               
    end;
end;
function impar(x:integer):boolean;
begin 
impar:=(x mod 2 = 1);
end;
function calcularpromedio(l:lista):real;
var 
aux:integer;
begin 
aux:=0;
calcularpromedio:=0;
while (l <> nil) do begin 
    calcularpromedio:= calcularpromedio + l^.dato.nota;
    aux:=aux+1;
    l:=l^.sig;
end;
calcularpromedio:=calcularpromedio/aux;
end;    
procedure aprobadas(l:lista;var cantap:integer);
begin 
cantap:=0;
while (l <> nil) do begin 
    if (l^.dato.nota > 4) then begin 
        cantap:=cantap+1;
    end;    
    l:=l^.sig;    
end;
end;

procedure leerarbol(ar:arbol;var i : integer;x:real);
var
cantap:integer;
begin 
cantap:=0;
    if (ar <> nil) then begin 
        leerarbol(ar^.HI,i,x);
        
        if (impar(ar^.dato.legajo) = true) then 
            i:=i + 1;

        aprobadas(ar^.dato.finales,cantap);    
        writeln('legajo: ',ar^.dato.legajo,'| cantidad de materias aprobadas: ',cantap,' | ');

        if (calcularpromedio(ar^.dato.finales) > x) then 
            writeln('legajo: ',ar^.dato.legajo,' promedio ',calcularpromedio(ar^.dato.finales):2:2,' | ');

        leerarbol(ar^.HD,i,x);
    end;    
end;
var 
ar:arbol;
i:integer;
prom:real;
begin 
i:=0;
randomize;
armararbol(ar);
writeln('');
write('INGRESE PROMEDIO A CUMPLIR: ');readln(prom);
leerarbol(ar,i,prom);
writeln('---------------');
writeln('LOS LEGAJOS IMPARES SON: ',i);

end.





