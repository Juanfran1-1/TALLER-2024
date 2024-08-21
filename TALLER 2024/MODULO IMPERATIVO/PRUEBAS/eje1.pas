{1.- Implementar un programa que procese la información de los alumnos de la Facultad de
Informática.
a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de
todos los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso,
cantidad de materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada
una de las materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno
11111, el cual debe procesarse.
b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número
de alumno y promedio de cada alumno.
c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de
materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo
puede diseñarse una solución modularizada que requiera la menor cantidad de cambios?}
program eje1;
const 
df = 36 ;
type 
    rangonota = 1..10 ;
    notas = array [1..36] of rangonota; 
    alumno = record
        apellido:string;
        num:integer;
        anoing:integer;
        cantaprob:integer;
        aprob:notas;
    end;
    lista=^nodo;
    nodo=record 
        dato:alumno;
        sig:lista;
    end;
procedure cargarnotas(var v:notas;x:integer);
var 
    i:integer;
begin 
    for i:= 1 to x do begin 
        writeln('Ingrese nota obtenida en la materia numero ',i,' :');
        readln(v[i]);
    end;
end;        

procedure leeralumno(var a:alumno);
begin 
    writeln('Ingrese apellido del alumno: ');readln(a.apellido);
    writeln('Ingrese numero del alumno: ');readln(a.num);
    writeln('Ingrese año de ingreso del alumno: ');readln(a.anoing);
    writeln('Ingrese cantidad de materias aprobadas:');readln(a.cantaprob);
    cargarnotas(a.aprob,a.cantaprob);
end;    

procedure armarnodo(var l:lista;a:alumno);
var 
    nue,act,ant:lista;
begin   
    new(nue);nue^.dato:=a;
    act:=l;ant:=l;
    while (act<>nil) and (act^.dato.num < nue^.dato.num) do begin 
        ant:=act;
        act:=act^.sig;
        end;
    if (act=ant) then begin
        l:= nue;
        end    
    else
        ant^.sig:=nue;
nue^.sig:=act;
end;    
{procedure armarnodo(var l:lista;a:alumno);
var 
nue:lista;
begin 
new(nue);nue^.dato:=a;nue^.sig:=l;
l:=nue;
end;}
procedure armarlista(var l:lista);
var 
a:alumno;
begin 
    repeat
        leeralumno(a);
        armarnodo(l,a);
        writeln('----ALUMNO LEIDO----');
        writeln('----SIGUIENTE ALUMNO----');
    until(a.num = 11111);
end;
function calcularprom(v:notas;x:integer):real;
var 
i:integer;p:real;
begin 
    p:=0;
    for i := 1 to x do begin 
        p:=v[i];
    end;
calcularprom:=p;
end;        
procedure procesarlista(l:lista);
begin 
    while ( l <> nil) do begin
        writeln('El alumno con el numero ',l^.dato.num,' tiene un promedio de: ',calcularprom(l^.dato.aprob,l^.dato.cantaprob):2:2);
    l:=l^.sig;    
    end;
    writeln('--------------PROCESOS FINALIZADOS-----------');
end; 
var 
    l:lista;
begin 
l:=nil;
armarlista(l);
writeln('-------PROCESANDO------');
procesarlista(l);    
end.